#! /bin/sh 
function f_input
{
	(f_echo "请输入:")
	
	read taskID

	(f_echo "输入内容为:")

	(f_echo "$taskID")
}

