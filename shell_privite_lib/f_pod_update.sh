#!/bin/sh

title=" ***************** pod update *************** "

function f_sel_source
{
	(f_echo "使用静态库or源码[1、静态库（默认）2、源码] ：：")

	read -t $TIMEOUT sourceType

	if [[ $sourceType = 2 ]]; then
		#statements
		(f_echo "当前 --- > 源码")
		source='use_code=1'
	else
		(f_echo "当前 --- > framework")
	fi
}

function f_other_enval
{
	(f_echo "私人模块，使用静态库or源码[1、静态库（默认）2、源码] ：：")

	priviteSourceType='2'
	read -t $TIMEOUT priviteSourceType

	if [[ $priviteSourceType = 2 ]]; then
		#statements
		
		priviteSource='TNChooseFeed_use_code=1 TNShareSDK_use_code=1 TNCard_use_code=1 TNFrame_use_code=1'
		
		(f_echo "私人模块当前 --- > 源码  $priviteSource")

	else
		(f_echo "私人模块当前 --- > framework")
	fi


	(f_echo "请输入其他自定义环境变量: ")

	read -t $TIMEOUT inputContent 
}

# #$1--某一个私有pod库的名字
# function f_sel_source_pod ()
# {
	
# }

function f_pod_update ()
{
	f_sel_source

	f_other_enval

	eval $source  eval $inputContent eval $priviteSource pod update --no-repo-update
}
