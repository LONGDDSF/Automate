#!/bin/sh

title=" ***************** pod update *************** "

function f_sel_source
{
	(f_echo "使用静态库or源码[1、静态库（默认）2、源码] ：：")

	read sourceType

	if [[ $sourceType = 2 ]]; then
		#statements
		source='use_code=1'
	fi
}

# #$1--某一个私有pod库的名字
# function f_sel_source_pod ()
# {
	
# }

function f_pod_update ()
{
	f_sel_source

	if [[ -z $source ]]; then
		#statements
        (f_echo "使用静态库 $source")
		pod update --no-repo-update
	else
        (f_echo "使用源码 $source")
		eval $source pod update --no-repo-update
	fi
}
