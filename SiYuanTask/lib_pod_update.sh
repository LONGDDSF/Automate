#!/bin/sh 

echo " \n
		**************************** 私有pod库工程，pod update ***********************"


#配置项目路径
# ="/Users/fiend/Documents/toonProject/toonios/Toon"

rootPath="$path_siyuan_lib"

arrowFlag="\n ----> "

function f_checkDir ()
{
	echo "$arrowFlag 当前目录文件有"
	tree -L 1 --sort=name $1
}

function f_selTarget
{	
	echo "$arrowFlag"

	read -p "请输入目标(如:TNShareSDK) :" targetName

	echo $targetName
}

function f_checkTagetIsAviliable ()
{
	p1=$1

	ExamplePath="$p1/Example"

	echo "ExamplePath =="$ExamplePath

	if [[ -d $ExamplePath ]]; then
			#statements
			function f_list_files
			{
				echo " $arrowFlag 目录存在，当前目录文件有 :"
			
				tree -L 1 $p1

				echo "$arrowFlag Example中有:"
			
				tree -L 1 $ExamplePath
			}
			
			'f_list_files'

			return 1	
	else

			echo "$arrowFlag 路径不存在"
			
			return 0
	fi	
}

#本地pod repo 更新
function f_local_repo_update()
{
	echo "$arrowFlag"

	read -p '是否更新repo（[y/n]） :' isUpdate

	if [[ 'y' = $isUpdate || '' = $isUpdate ]]; then

		echo "$arrowFlag 更新本地repo - Syswin"
		pod repo update Syswin

		echo "$arrowFlag 更新本地repo - 6-syswin_pod_spec"
		pod repo update 6-syswin_pod_spec

	fi
}

function f_checkGitStatus
{
	echo "$arrowFlag 查看当前Git 状态"
	
	(cd $rootPath)	 
	(git status)

	read -p "请确认git status ,是否继续 [y/n] :" isGitStatusOk
		
	if [[ 'y' = $isGitStatusOk || '' = $isGitStatusOk ]]; then

		return 1
	else
		return 0
	fi
}

function f_resetPodfileLock
{
	echo "$arrowFlag reset Podfile.lock"

	local filePath="Example/Podfile.lock"

	read -p " 是否继续[y/n]: " shouldGo1
	if [[ 'y' = $shouldGo1 || '' = $shouldGo1 ]]; then

		echo "$arrowFlag remove $filePath"
		git checkout $filePath
	fi
}

function f_git_stash
{
	echo "$arrowFlag 保存更改到stash"
	git stash

	echo "$arrowFlag 查看当前Git 状态"
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

		#本地repo更新
		(f_local_repo_update)

		#revert Podfile.lock
		(f_resetPodfileLock)
		
		#检查git status
		(f_checkGitStatus)
		isGoOn=$?

		if [[ $isGoOn = 1 ]]; then
			#statements

			echo '\n'
			read -p '---->保存working到stash，是否继续[y/n]:' should_Stash

			if [[ 'y' = $should_Stash || '' = $should_Stash ]]; then
				#statements

				'f_git_stash'

				echo '\n'
				read -p '---->Xcode是否已经关闭 [y/n]:' isClose

				if [[ 'y' = $isClose || '' = $isClose ]]; then
					#statements

					echo '\n ---->更新Git，pull'
					git pull

					cd Example

					echo '\n ---->pod update \n'
					pod update --no-repo-update --project-directory=

					# echo '\n pod install \n'
					# pod install
					
					echo '\n 打开工程'
					WorkSpace=$targetName.xcworkspace
					open $WorkSpace

				fi
			fi
		fi

	else

		echo "$arrowFlag 请重新选择目标"

		'doWork'
	fi
}


#干
(doWork)

