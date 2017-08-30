#！/bin/bash

#路径
# workPath=
function f_set_work_path ()
{
	if [[ -n $1 ]]; then
		#statement
		workPath=$1
	fi

	(f_checkFolderIsAviliable $workPath)
}

#选择workspace or project
function f_set_work_type
{
	(f_echo "请选择工程类型：{1、workspace 2、project} :")

	read workType

	case workType in
		 '1' )
			sel_work='*.xcworkspace';;

		 '2' )
			sel_work='*.xcodeproj';;
	esac

	echo "$sel_work"
}

#选择scheme or targe

function f_sel_target
{
	case workType in
		 '1' )
			(f_echo "请选择 scheme :")

			(xcodebuild -workspace $sel_work -list)

			read target 
			 ;;

		 '2' )
	
			(f_echo "请选择 target :")

			(xcodebuild -project $sel_work -list)

			read target
	esac

	(f_echo "选择为：：：：")
	echo "$target"
}

#选择sdk
function f_sel_skd
{
	(f_echo "当前sdk有：：：：")
	`xcodebuild -showsdks`

	(f_echo "请选择sdk:")

	read selSdk

	(f_echo "你选择的sdk是"）

	echo "$selSdk"
}

#configration
#暂时支持options:{debug, realese}
function f_sel_debug
{
	debugType='debug'

	(f_echo "默认是debug模式，是否切换：[y/n] ::")

	read isChange

	if [[ 'y' = $isChage || '' = $isChange ]]; then
		#statements
		debug='realese'
	fi

	(f_echo "当前是：")
	echo "$debugType"
}

#$1 --- path
fucntion f_do_build ()
{	
	path=$1
	(f_set_work_path $path)

	(f_set_work_type)

	(f_sel_target)

	(f_sel_skd)

	(f_sel_debug)
}
