#!/bin/sh

title="**************** clean privite pod cache ****************"

function f_pod_cache_clean ()
{
	for podName in $`ls $1` ; do
		#statements
	echo "pod ---> ${podName}"
	if [[ -n ${podName} ]]; then
		#statements
	    pod cache clean ${podName} --all
	fi

	done
}


function f_privite_repo_cache_clean
{
	(f_echo "clean all privite pod cache ？？？[y/n]")

	shouldPodCacheClean='n'

	read -t 4 shouldPodCacheClean 

	if [[ 'y' = $shouldPodCacheClean || '' = $shouldPodCacheClean ]]; then
		#statements
		(f_echo "clean all privite pod cache ,start ....")

		(f_echo "find all privite repos...")

		pathCurrent=`pwd`

		cd
		rootPath=`pwd`

		pathCocoaPods="${rootPath}/.cocoapods/repos"

		cd $pathCocoaPods

		for repoName in `ls`; do
			#statements
			(f_echo "find a repo --> $repoName")

			repoPath="${pathCocoaPods}/${repoName}"

			if [[ -d $repoPath && "$repoName" != 'master' ]]; then
				#statements

				(f_echo "find a privite repo ---> $repoName")

				(f_pod_cache_clean $repoPath)
			fi

		done

		cd "$pathCurrent"

		(f_echo "done！！！！ privite repo pod cache clean")
	fi

}

# f_privite_repo_cache_clean
