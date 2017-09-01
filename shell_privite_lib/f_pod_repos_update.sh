#！/bin/sh

title="***************** all priviete repo update ***********"

function f_privite_repos_update
{
	(f_echo "是否更新 all privite repos？？？[y/n]")

	read shouldRepoUpdate

	if [[ 'y' = $shouldRepoUpdate || '' = $shouldRepoUpdate ]]; then
		#statements
		(f_echo "update all privite repos ....")

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

				pod repo update $repoName	
			fi

		done

		cd "$pathCurrent"

		echo " done！！！！ all privite repo has updated"
	fi
}
