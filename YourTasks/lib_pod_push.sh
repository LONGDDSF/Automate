#!/bin/sh 

#私有pod提交

title=" ************************** 私有pod提交 ******************************" 

function f_dowork
{
	local rootPath="$path_pod_libs"

	(f_file_list $rootPath)

	(f_echo "请输入私有pod库名称 :" )
	read ProjectName

	targetPath="$rootPath/$ProjectName"
	filePodspec="$targetPath/$ProjectName.podspec"

	if [[ -d $targetPath ]]; then
		
		(f_checkFolderIsAviliable $targetPath)

		(f_git_check_status $targetPath)

		(f_echo " 请确认已经更新podspec版本号[y/n] :")
		hasUpdatePodSpec='y'
		read -t 3 hasUpdatePodSpec

		if [[ 'y' = $hasUpdatePodSpec || '' = $hasUpdatePodSpec ]]; then

			(f_git_tag_update $targetPath)

			(f_git_push $filePodspec "$privitePodSourceParam ${ProjectName}_use_code=0")

		fi

	else
		(f_echo '--->路径不存在')
	fi
}


(f_echo "$title")

'f_dowork'
