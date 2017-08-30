#! bin/bash

#$1 = podspec path
function f_git_push ()
{
    (f_echo "本地repo有  ::")
    (pod repo list)

    (f_echo "git remote信息:::")
    (git remote -v)

	(f_echo " 当前 $ProjectName，是否进行 pod push [y/n]:")
	
	read isPodPush 

    if [[ 'y' = $isPodPush || '' = $isPodPush ]] ; then
	 	#statements --verbose

        (f_echo "请选择要推送的repo:::")

        read repoName

        pod repo push $repoName $1 --use-libraries --allow-warnings --verbose
    fi
}
