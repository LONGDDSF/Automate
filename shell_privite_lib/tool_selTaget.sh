#!/bin/sh 

source ./shell_tool/pch.sh


echo " ******************* 私有pod库 打包 ***********************"

rootPath='/Users/fiend/Documents/Siyuan/Libs'

arrowFlag="\n ----> "

#显示文件目录结构
# p1 - 文件路径
function f_list_files ()
{
	echo " $arrowFlag 目录存在，当前目录文件有 :"

	tree -L 2 $p1 
}	


function f_selTarget
{	
	echo "$arrowFlag"

	read -p "请输入目标:" targetName

	echo $targetName
}

function f_checkFolderIsAviliable ()
{
	p1=$1

	if [[ -d $p1 ]]; then
			#statements
			
			'f_list_files'

			return 1	
	else

			echo "$arrowFlag 路径不存在"
			
			return 0
	fi	
}

function doWork
{
	(f_selTarget $rootPath)
}


'doWork'

