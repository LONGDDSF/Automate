#!/bin/sh 

echo " \n
		**************************** 私有库，CocoPods-package 打包 ***********************"


#配置项目路径
# ="/Users/fiend/Documents/toonProject/toonios/Toon"

#所有私有库的根目录
rootPath="$path_siyuan_lib"

function f_checkDir ()
{
	(f_echo "当前目录文件有")
	tree -L 1 --sort=name $1
}

function f_selTarget
{	
	(f_echo)

	read -p "请输入目标(如:TNShareSDK) :" targetName

	echo $targetName
}

function f_checkTagetIsAviliable ()
{
	path=$1

	(f_echo "检测文件路径：" )
	(f_echo "$path")

	if [[ -d $path ]]; then
			#statements
			function f_list_files
			{
				(f_echo "目录存在，当前目录文件有 :")
			
				tree -L 1 $path
			}
			
			'f_list_files'

			return 1	
	else

			(f_echo "路径不存在")
			
			return 0
	fi	
}

function f_checkGitStatus
{
	(f_echo "查看当前Git 状态")
	 
	(git status)

	read -p "请确认git status ,是否继续 [y/n] :" isGitStatusOk
		
	if [[ 'y' = $isGitStatusOk || '' = $isGitStatusOk ]]; then

		return 1
	else
		return 0
	fi
}

function f_git_stash
{
	(f_echo "保存更改到stash")
	git stash

	(f_echo "查看当前Git 状态")
	git status
}

function doWork
{
	cd $rootPath

	#检查当前工作目录
	(f_checkDir $rootPath)

	'f_selTarget'

	#校验目标路径
	(f_checkTagetIsAviliable $targetName)
	isTagetOk=$?

	if [[ $isTagetOk = 1 ]]; then
		#statements

		cd $targetName
		
		#检查git status
		(f_checkGitStatus)
		isGoOn=$?

		if [[ $isGoOn = 1 ]]; then
			#statements

				'f_git_stash'

				(f_echo '\n 开始打包 .....')

				podSpecName=$targetName.podspec

				pod package $podSpecName --no-mangle --spec-sources=http://172.28.6.24:8080/syswin_pod_spec,https://github.com/CocoaPods/Specs.git --exclude-deps --force
		
				(f_echo "打包结束 。。。。")


				sleep 3
				open .
		fi

	else

		echo "$arrowFlag 请重新选择目标"

		'doWork'
	fi
}


#干
(doWork)

