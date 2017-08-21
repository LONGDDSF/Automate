#!/bin/sh 

function f_checkFolderIsAviliable ()
{

	echo "查看文件是否存在，路径 == $1 *****"

	p1=$1

	if [[ -d $p1 ]]; then
			#statements
			
			# source ./file_list.sh $p1
			(f_file_list $p1)

			return 1	
	else

			echo "$arrowFlag 路径不存在"
			
			return 0
	fi	
}

# (f_checkFolderIsAviliable $filePath)