#! /bin/bash

function f_git_check_status ()
{
	pp=`pwd`

	cd $1
	(f_echo "查看当前Git 状态 :")
	 
	(git status)

	(f_echo "请确认git status ,是否继续 [y/n] :")
	read -p ">" isGitStatusOk
		
	if [[ 'y' = $isGitStatusOk || '' = $isGitStatusOk ]]; then

		return 1
	else
		return 0
	fi

	cd $pp
}
