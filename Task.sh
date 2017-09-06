
source ./SiYuanTask/config.sh
source ./shell_privite_lib/pch.sh

shellPath="./SiYuanTask"

function f_doWork
{
	(f_echo)

	(f_echo "思源企业 - toon - ios版 - 名片模块 - 陈冬冬 - 任务指令列表")

	local taskGroup="[
		1、toon 项目 ，pod update

		2、私有pod库 ， pod update
					
		3、私有pod库 ， pod push
					
		4、私有pod库 ， 打包

					]"

	(f_echo "$taskGroup")

	(f_echo "请输入任务指令 [如：1]:")

	read taskID

	case $taskID in
		
		'1' )
		source $shellPath/toon_pod_update.sh
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
	esac

	'f_doWork'
}

'f_doWork'

