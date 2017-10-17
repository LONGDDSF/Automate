#！/bin/sh

title="***************** all private repo update ***********"

function f_privite_repos_update
{
	(f_echo "是否更新 all privite repos？？？[y/n]")

	shouldRepoUpdate='y'

	read -t $TIMEOUT shouldRepoUpdate 

	if [[ 'y' = $shouldRepoUpdate || '' = $shouldRepoUpdate ]]; then
		#statements
		(f_echo "update all privite repos ....")

		#找到所有的privite repo

		pathCurrent=`pwd`

		cd
		rootPath=`pwd`

		(f_echo "rootPath --> $rootPath")

		pathCocoaPods="${rootPath}/.cocoapods/repos"

		cd $pathCocoaPods

		for repoName in `ls`; do
			#statements
			(f_echo "find a repo --> $repoName")

			repoPath="${pathCocoaPods}/${repoName}"

			if [[ -d $repoPath && "$repoName" != 'master' ]]; then
				#statements

				(f_echo "找到私有repo ---> $repoName")

				pod repo update $repoName	
			fi

		done

		cd "$pathCurrent"

		(f_echo " done！！！！ all privite repo has updated")
	fi
}
