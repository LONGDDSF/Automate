#!/bin/sh 

echo " \n
		**************************** 私有pod库工程，pod update ***********************"

rootPath="$path_pod_libs"

function f_selTarget
{	
	(f_echo "请输入私有pod库名称 :")

	read targetName

	(f_echo "当前私有库为 $targetName")
}

function doWork
{
	cd $rootPath

	(f_file_list)

	'f_selTarget'

	#校验目标路径
	(f_checkFolderIsAviliable $rootPath/$targetName)
	isTagetOk=$?

	if [[ $isTagetOk = 1 ]]; then
		#statements

		cd $targetName

		#本地repo更新
		(f_privite_repos_update)

		#本地pod cache清理
		(f_privite_repo_cache_clean)
		
		#检查git status
		(f_git_check_status $rootPath/$targetName)
		isGoOn=$?

		if [[ $isGoOn = 1 ]]; then

			(f_echo "保存working到stash，是否继续[y/n]:")
			should_Stash='n'
			read -t $TIMEOUT should_Stash

			if [[ 'y' = $should_Stash || '' = $should_Stash ]]; then
				#statements

				(f_git_stash $rootPath/$targetName)
			fi

			(f_echo "Xcode是否已经关闭 [y/n]:")
			isClose='y'
			read -t $TIMEOUT isClose

			if [[ 'y' = $isClose || '' = $isClose ]]; then
					#statements

					(f_echo "更新Git，pull")
					git pull

					cd Example

					rm -rf Pods/

					rm -rf Podfile.lock

					(f_echo "当前库，使用源码or静态库[1.源码 2.静态库]：：")
					isYuanMa=1
					read -t $TIMEOUT isYuanMa
					
					(f_echo "pod update .... ")

					if [[ $isYuanMa -eq 2 ]]; then
						#statements
						eval $privitePodSourceParam $PodInstall --no-repo-update
					fi

					if [[ $isYuanMa -eq 1 ]]; then
						#statements

						eval $privitePodSourceParam \
						eval "${targetName}_use_code=1" \
                        $PodInstall --no-repo-update
					fi
				
					(f_echo "打开工程 $targetName >>>> ")
					pathWorkSpace=$targetName.xcworkspace
					open $pathWorkSpace

			fi
		fi

	else

		(f_echo "请重新选择目标")

		'doWork'
	fi
}


#干
(doWork)

