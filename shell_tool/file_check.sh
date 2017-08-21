#!/bin/sh 

filePath=$1

function f_checkFolderIsAviliable ()
{
	p1=$1

	if [[ -d $p1 ]]; then
			#statements
			
			source ./file_list.sh $p1

			return 1	
	else

			echo "$arrowFlag 路径不存在"
			
			return 0
	fi	
}

(f_checkFolderIsAviliable $filePath)