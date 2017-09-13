#!/bin/sh 

#私有pod提交

title=" ************************** 私有pod提交 ******************************" 

function f_dowork
{
	local rootPath="$path_siyuan_lib"

	(f_file_list $rootPath)

	(f_echo "请输入目标(如:TNShareSDK) :" )
	read ProjectName

	targetPath="$rootPath/$ProjectName"
	filePodspec="$targetPath/$ProjectName.podspec"

	if [[ -d $targetPath ]]; then
		
		(f_checkFolderIsAviliable $targetPath)

		(f_git_check_status $targetPath)

		(f_echo " 请确认已经更新podspec版本号[y/n] :")
		read hasUpdatePodSpec

		if [[ 'y' = $hasUpdatePodSpec || '' = $hasUpdatePodSpec ]]; then
			#statements

			(f_git_tag_list $targetPath)

			(f_git_tag_update $targetPath)

			(f_git_push $filePodspec)

		fi

	else
		(f_echo '--->路径不存在')
	fi
}


(f_echo "$title")

'f_dowork'
