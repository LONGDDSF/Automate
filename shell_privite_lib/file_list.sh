#!/bin/sh 

function f_file_list ()
{
	echo " --- > 当前目录有 ："

	tree -L 2 $1 --sort=name
}
