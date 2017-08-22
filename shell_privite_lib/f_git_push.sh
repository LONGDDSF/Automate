#! bin/bash

#$1 = repo name
#$2 = podspec path
function f_git_push ()
{
	(f_echo " 当前 $ProjectName，是否进行 pod push [y/n]:")
	
	read isPodPush 

	# if [[ 'y' = $isPodPush || '' = $isPodPush ]] ; then
	# 	#statements --verbose
	# 	# pod repo push $1 $2 --use-libraries --allow-warnings 
	# fi
}