#!/bin/sh 

function f_file_list ()
{

	(f_echo "当前目录有 ：")

	tree -L 1 $1 --sort=name
}
