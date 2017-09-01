#!/bin/sh

title="**************** 清除所有 privite pod cache ****************"

function f_pod_cache_clean ()
{
	for podName in $`ls $1` ; do
		#statements
	echo "要清理的pod ---> ${podName}"
    pod cache clean ${podName} --all

	done
}


function f_privite_repo_cache_clean
{

	(f_echo "是否清理所有私有pod cache？？？[y/n]")

	read shouldPodCacheClean

	if [[ 'y' = $shouldPodCacheClean || '' = $shouldPodCacheClean ]]; then
		#statements
		(f_echo "清除所有privite pod cache")

		#找到所有的privite repo

		pathCurrent=`pwd`

		cd
		rootPath=`pwd`

		echo "rootPath --> $rootPath"

		pathCocoaPods="${rootPath}/.cocoapods/repos"

		echo ""
		cd $pathCocoaPods

		for repoName in `ls`; do
			#statements
			echo "find a repo --> $repoName"

			repoPath="${pathCocoaPods}/${repoName}"

			if [[ -d $repoPath && "$repoName" != 'master' ]]; then
				#statements

				echo "找到私有repo ---> $repoName"

				(f_pod_cache_clean $repoPath)
			fi

		done

		cd "$pathCurrent"

		echo "done！！！！ privite repo pod cache clean"
	fi

}

# f_privite_repo_cache_clean
