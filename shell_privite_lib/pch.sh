#! /bin/sh

# path=$(cd 'dirname $0'; pwd)

path="./shell_privite_lib"

# echo "$path"

source $path/f_echo.sh

source $path/file_list.sh

source $path/f_input.sh

source $path/file_check.sh

source $path/f_git_check_status.sh
source $path/f_git_stash.sh
source $path/f_git_tag.sh
source $path/f_git_push.sh

source $path/f_pod_cache_clean.sh
source $path/f_pod_update.sh
source $path/f_pod_repos_update.sh

source $path/f_xcodebuild.sh
