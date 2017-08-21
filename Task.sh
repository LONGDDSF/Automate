#!/bin/sh 

cd 

cd jjj

echo "--->思源企业 - toon - ios版 - 名片模块 - 陈冬冬 - 任务指令列表"

taskGroup="[
			1、toon 项目 ，pod update

			2、私有pod库 ， pod update
			
			3、私有pod库 ， pod push
			
			4、私有pod库 ， 打包
]"

echo "\n --->$taskGroup"

read -p "--->请输入任务指令" taskID

case $taskID in
	
	'1' )
	source toon_pod_update.sh
		;;

	'2' )
	source lib_pod_update.sh
		;;

	'3' )
	source lib_pod_push.sh
		;;

	'4' )
	source lib_package
		;;


esac
