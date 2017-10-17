#!/bin/sh 

title=" ************************** Toon工程 pod update ******************************"

function f_do_work
{
	ProjectPath="$path_main_project"

	(f_checkFolderIsAviliable $ProjectPath)

	if [[ $? > 0 ]]; then

		cd $ProjectPath

		isGo='y'

		read -p '是否继续 [y/n] :' -t 3 isGo 

		if [[ 'y' = $isGo || '' = $isGo ]]; then

			(f_privite_repos_update)

			(f_git_check_status $ProjectPath)

			(f_echo " 是否继续[y/n]:")

			shouldGo1='y'
			read -t 5 shouldGo1 

			if [[ 'y' = $shouldGo1 || '' = $shouldGo1 ]]; then
				#statemente

				(f_echo "checkout Podfile.lock")
				git checkout Podfile.lock 

				(f_echo "将修改stash，是否继续[y/n]:")
				shouldGo2='n'
				read -t 3 shouldGo2
				if [[ 'y' = $shouldGo2 || '' = $shouldGo2 ]]; then
					#statements

					(f_git_stash $ProjectPath)
				fi

				(f_echo "移除所有依赖的库 > Pods/*")
				rm -rf Pods/*

				(f_echo "Xcode是否已经关闭 [y/n]:")

				isClose='y'
				read -t 3 isClose 

				if [[ 'y' = $isClose || '' = $isClose ]]; then
						#statements

						(f_echo "更新Git，pull")
						git pull

						(f_privite_repo_cache_clean)

						(f_pod_update)

						(f_echo "已经更新完毕")

						(f_echo "是否自动build")

						# read shouldBuild

						# if [[ 'y' = $shouldBuild || '' = $shouldBuild ]]; then

						# 	#xcodebuild -workspace *.xcworkspace -scheme Toon -sdk iphonesimulator10.3 -configuration debug
						# fi
						
						sleep 1

						(f_echo "打开工程 *** $ProjectPath ")

						open *.xcworkspace
				fi	
			fi
		fi
	fi
}

(f_echo $title)

(f_do_work)
