#! /bin/sh 

#$1 提示语
#$2 变量

function f_input ()
{	
	alertMsg="请输入"

	if [[ -n $1 ]]; then
		alertMsg=$1
	fi
	
	(f_echo "$alertMsg")
	
	if [[ -n $2 ]]; then

		read -t $TIMEOUT $2
	else
		read -t $TIMEOUT taskID
	fi 

	(f_echo "输入内容为:")

	if [[ -n $2 ]]; then

		f_echo $2
	else
		
		f_echo "$taskID"
	fi 
}

