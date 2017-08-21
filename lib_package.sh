#!/bin/sh 

#选择lib、freamwork
function f_sel_package_type
{
	echo "请选择打包类型 [1、静态库 2、动态库 3、lib] :"

	read inputType

	case "$inputType" in
			
			"1")
			package_type="embedded"
			;;

			"2")
			package_type="dynamic"
			;;

			"3")
			package_type="library"
			;;
	esac

	echo $package_type
}

function f_doWork
{
	# "f_checkDir"	

	"f_sel_package_type"


}

echo "***************************私有库 cocopods-packager 打包**********************************"



'f_doWork'

