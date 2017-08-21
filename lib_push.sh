#!/bin/sh 

#私有pod提交

echo " ************************** 私有pod提交 ******************************"

arrowFlag=" \n ---->"

rootPath='/Users/fiend/Documents/Siyuan/Libs'

echo " $arrowFlag 当前根目录为"
echo " $arrowFlag $rootPath"

cd $rootPath

echo " $arrowFlag 当前目录文件有 "
ls

echo " $arrowFlag "
read -p " 请输入目标(如:TNShareSDK) : " ProjectName

targetPath="$rootPath/$ProjectName/"

cd $targetPath

filePodspec='$ProjectName.podspec'

if [[ -d $targetPath ]]; then
	#statements
	echo " $arrowFlag 目录存在 :"

	ls

	echo " $arrowFlag 查看git 状态"
	git status

	echo " $arrowFlag "
	read -p " 请确认git status，是否继续[y/n] :"

	echo " $arrowFlag "
	read -p " 请确认已经更新podspec版本号[y/n] :" hasUpdatePodSpec

	if [[ 'y' = $hasUpdatePodSpec || '' = $hasUpdatePodSpec ]]; then
		#statements

		echo " $arrowFlag 当前tag 有 :"
		git tag 

		echo " $arrowFlag "
		read -p " 请输入git tag 版本号 : " gitTagVertion

		echo " $arrowFlag 更新git tag 到 $gitTagVertion"
		git tag -a $gitTagVertion -m"$ProjectName - tag $gitTagVertion "
		
		echo " $arrowFlag  tag push "
		git push origin --tags 

		echo " $arrowFlag "
		read -p " 当前 $ProjectName，是否进行 pod push [y/n]:" isPodPush 
		if [[ 'y' = $isPodPush || '' = $isPodPush ]]; then
			#statements --verbose
			pod repo push Syswin $filePodspec --use-libraries --allow-warnings 
		fi

	fi

else
	echo '--->路径不存在'
fi

