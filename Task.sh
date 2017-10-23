#! /bin/sh

####################################

# 是否自动编译
# 1=yes 
# others=no
isAutoRun=$1

TIMEOUT=99999999

echo $isAutoRun

if [[ $isAutoRun -eq 1 ]]; then
	#statements
	TIMEOUT=1
fi

####################################


# 是否清除所有Pod Cache
# 1=yes 
# others=no
iaCleanPodCache=$2


############################################

source ./YourTasks/config.sh
source ./shell_privite_lib/pch.sh

shellPath="./YourTasks"

shellPrivateLibPath="./shell_privite_lib"

function f_doWork
{
	(f_echo)

	(f_echo "基于私有repo、git管理的任务指令列表")

	local taskGroup="[
	
		1、main项目 ，pod update
		2、私有pod库 ， pod update
		3、私有pod库 ， pod push
		4、私有pod库 ， 打包
		5、清除私有repo相关库cache
		6、私有repo update
		7、编译
		8、退出
				]"

	(f_echo "$taskGroup")

	(f_echo "请输入任务指令 [如：1]:")

	read taskID

	case $taskID in
		
		'1' )
			source $shellPath/main_project_update.sh
			;;

		'2' )
			source $shellPath/lib_pod_update.sh
			;;

		'3' )
			source $shellPath/lib_pod_push.sh
			;;

		'4' )
			source $shellPath/lib_pod_archive.sh
			;;
		
		'5' )
			'f_privite_repo_cache_clean'
			;;
			
		'6' )
			'f_privite_repos_update'
			;;

        '7' )
            'f_do_build'
            ;;

		'8' )
			'exit'
			;;
	esac

	'f_doWork'
}

'f_doWork'

