#!/bin/sh 

path=$1

function f_file_list ()
{
	echo " --- > 当前目录有 ："

	tree -L 2 $1
}

tree -L 2 $1

# (f_file_list $path)