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


if [[ -d $ProjectPath ]]; then
	#statements
	echo " $arrowFlag 目录存在 :"
	$ProjectPath

	cd $ProjectPath

	echo " $arrowFlag 当前目录文件有:"
	ls

	echo " $arrowFlag "
	read -p '是否继续 [y/n] :' isGo

	if [[ 'y' = $isGo || '' = $isGo ]]; then

		echo " $arrowFlag 更新本地repo - Syswin "
		pod repo update Syswin

		echo " $arrowFlag 更新本地repo - 6-syswin_pod_spec "
		pod repo update 6-syswin_pod_spec

		echo " $arrowFlag 查看当前Git 状态 "
		git status

		echo " $arrowFlag "
		read -p "是否继续[y/n]:" shouldGo1

		if [[ 'y' = $shouldGo1 || '' = $shouldGo1 ]]; then
			#statemente
			ls
			echo " $arrowFlag checkout Podfile.lock"
			
			rm -rf Podfile.lock 

			echo " $arrowFlag "
			read -p "将修改stash，是否继续[y/n]:" shouldGo2

			if [[ 'y' = $shouldGo2 || '' = $shouldGo2 ]]; then
				#statements

				echo " $arrowFlag 保存更改都stash "
				git stash

				echo " $arrowFlag 查看当前Git 状态 "
				git status

				echo " $arrowFlag "
				read -p "Xcode是否已经关闭 [y/n]:" isClose

				if [[ 'y' = $isClose || '' = $isClose ]]; then
					#statements

					echo " $arrowFlag 更新Git，pull "
					git pull

					echo " $arrowFlag pod update "
					pod update --no-repo-update 

					# echo '\n pod install \n'
					# pod install

					(f_echo "已经更新完毕")

					(f_echo "是否自动build")
					read shouldBuild

					if [[ 'y' = $shouldBuild || '' = $shouldBuild ]]; then
						#statements

						xcodebuild -workspace Toon.xcworkspace -scheme Toon -sdk iphonesimulator10.3 -configuration debug
					fi


					sleep 3
					
					echo " $arrowFlag  打开工程 "
					open *.xcworkspace

				fi
			fi
		fi
	fi

else
	echo " $arrowFlag 路径不存在 "
fi

