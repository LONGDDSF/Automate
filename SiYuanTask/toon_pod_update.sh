#!/bin/sh 

arrowFlag=" \n ---->"

echo " $arrowFlag "
echo " ************************** Toon工程 pod update ******************************"

echo " $arrowFlag "
read -p "请输入项目路径(1:Toon) : " ProjectPath

case "$ProjectPath" in
	
	'1' )
	ProjectPath="$path_toon"
	workspaceName='Toon.xcworkspace'
		;;
esac

f_checkFolderIsAviliable $ProjectPath

if [[ $? > 0 ]]; then
	#statements
	
	cd $ProjectPath

	read -p '是否继续 [y/n] :' isGo

	if [[ 'y' = $isGo || '' = $isGo ]]; then

		(f_privite_repos_update)

		(f_git_check_status $ProjectPath)

		(f_echo " 是否继续[y/n]:")
		read shouldGo1

		if [[ 'y' = $shouldGo1 || '' = $shouldGo1 ]]; then
			#statemente

			(f_echo "checkout Podfile.lock")
			
			git checkout Podfile.lock 

			(f_echo "将修改stash，是否继续[y/n]:")
			read shouldGo2

			if [[ 'y' = $shouldGo2 || '' = $shouldGo2 ]]; then
				#statements

				(f_git_stash $ProjectPath)

				(f_git_check_status $ProjectPath)

				(f_echo "移除Pods/*")
				rm -rf Pods/*

				(f_echo "Xcode是否已经关闭 [y/n]:")
				read isClose

				if [[ 'y' = $isClose || '' = $isClose ]]; then
					#statements

					(f_echo "更新Git，pull")
					git pull

					(f_privite_repo_cache_clean)

					(f_pod_update)

					(f_echo "已经更新完毕")

					(f_echo "是否自动build")
					read shouldBuild

					if [[ 'y' = $shouldBuild || '' = $shouldBuild ]]; then
						#statements

						xcodebuild -workspace *.xcworkspace -scheme Toon -sdk iphonesimulator10.3 -configuration debug
					fi
					
					sleep 1
					(f_echo "打开工程 *** $ProjectPath ")

					open *.xcworkspace

				fi
			fi
		fi
	fi
fi

