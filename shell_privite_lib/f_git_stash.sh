#! bin/bash

function f_git_stash ()
{
	pp=`pwd`

	cd $1
	
	(f_echo "保存更改到stash")
	git stash

	(f_echo "查看当前Git 状态")
	git status

	cd $pp
}
