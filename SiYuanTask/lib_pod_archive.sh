#!/bin/sh 

title=" \n
		**************************** 私有库，CocoPods-package 打包 ***********************"

#所有私有库的根目录
rootPath="$path_siyuan_lib"

function f_selTarget
{	
	(f_echo)

	read -p "请输入目标(如:TNShareSDK) :" targetName

	echo $targetName
}

function doWork
{
	cd $rootPath

	#检查当前工作目录
	(f_file_list $rootPath)

	'f_selTarget'

	#校验目标路径
	(f_checkFolderIsAviliable $targetName)
	isTagetOk=$?

	if [[ $isTagetOk = 1 ]]; then
		#statements

		cd $targetName

		#检查git status
		(f_git_check_status $rootPath/$targetName)
		isGoOn=$?

		if [[ $isGoOn = 1 ]]; then
			#statements

				echo `pwd`

				(f_git_stash $rootPath/$targetName)

				(f_privite_repo_cache_clean)

				(f_echo '开始打包 .....')

				podSpecName=$targetName.podspec

				#当前pod要使用源码
				eval "${targetName}_use_code=1" \
				pod package $podSpecName --no-mangle --exclude-deps --force \
				--spec-sources=http://172.28.6.24:8080/syswin_pod_spec,https://github.com/CocoaPods/Specs.git
		
				(f_echo "打包结束 。。。。$podSpecName ")

				sleep 3
				open .
		fi

	else

		(f_echo "请重新选择目标...")

		'doWork'
	fi
}


#干
(f_echo "$title")

(doWork)

