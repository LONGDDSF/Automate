#!/bin/bash

#git tag版本list
#$1 - 路径
function f_git_tag_list ()
{
	cd $1

	(f_echo " $arrowFlag 当前tag 有 :")

	(git tag)
}


#更新tag
#$1 - 路径
function f_git_tag_update ()
{
	(f_git_tag_list $1)

	cd $1

	shouldUpdateTag='n'

	read -p "是否需要更新 git tag ？？？[y/n] ：" -t 3 shouldUpdateTag 

	if [[ 'y' = $shouldUpdateTag ]] ; then

				(f_echo " 请输入git tag 版本号 : " )

				read gitTagVertion

				(f_echo " 更新git tag 到 $gitTagVertion")

				(git tag -a $gitTagVertion -m"$ProjectName - tag $gitTagVertion ")
		
				(f_echo " tag push ")

				(git push origin --tags)

	fi		
}
