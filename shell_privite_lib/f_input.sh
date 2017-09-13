#! /bin/sh 
function f_input ()
{	
	alertMsg="请输入"

	if [[ -n $1 ]]; then
		alertMsg=$1
	fi
	
	(f_echo "$alertMsg")
	
	read taskID

	(f_echo "输入内容为:")

	(f_echo "$taskID")
}

