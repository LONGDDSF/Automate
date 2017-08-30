#! bin/bash

function f_dir_list_and_rmdir ()
{
	path=$1

	for file in allDir ; do
		
		if [[ -d $file ]] ; then
			echo "$file is a folder"
			pod cache clean "$file"

		elif [[ -f $file ]] ; then
			echo "$file is a file"
		fi
	done
}

 
function f_privite_pod_cache_clean ()
{
	path_pod_repos=$"~/.cocoapods/repos"

	path_pod_syswin=$path_pod_repos/Syswin

	path_pod_6syswin=$path_pod_repos/6-syswin_pod_spec

	echo "开始删除pod cache"

	(f_dir_list_and_rmdir "$path_pod_syswin")

	(f_dir_list_and_rmdir "$path_pod_6syswin")
}

read -p "是否需要pod clean cache ？[y/n] :" shouldCleanPodCahche

if [[ 'y' = $shouldCleanPodCahche || '' = $shouldCleanPodCahche ]] ; then
	#statements
	(f_privite_pod_cache_clean)
fi

# function f_pod_privite_clean
# {
# 	pod cache clean FeedLibrary
# pod cache clean MWapSDK
# pod cache clean ServiceSLibrary
# pod cache clean TabBarRoot
# pod cache clean TNAddFriend
# pod cache clean TNADiscovery
# pod cache clean TNAFavorites
# pod cache clean TNAImageBrowser
# pod cache clean TNApplicationLibrary
# pod cache clean TNARecommend
# pod cache clean TNARecord
# pod cache clean TNAShareManagerTool
# pod cache clean TNASocial
# pod cache clean TNAudio
# pod cache clean TNAWallet
# pod cache clean TNBlackList
# pod cache clean TNBluetooth
# pod cache clean TNCard
# pod cache clean TNChat
# pod cache clean TNChatLibrary
# pod cache clean TNChooseFeed
# pod cache clean TNComment
# pod cache clean TNCommonBusinessModules
# pod cache clean TNContact
# pod cache clean TNCreateCard
# pod cache clean TNEExpressionShop
# pod cache clean TNForum
# pod cache clean TNFrame
# pod cache clean TNFrameFoundation
# pod cache clean TNIMInputPanel
# pod cache clean TNJoyTool
# pod cache clean TNLink
# pod cache clean TNLogSDK
# pod cache clean TNLookImageView
# pod cache clean TNMarkTags
# pod cache clean TNMBProgressHUD
# pod cache clean TNMJRefresh
# pod cache clean TNMobileContacts
# pod cache clean TNNetworkManager
# pod cache clean TNNewFriend
# pod cache clean TNNNotificationCenter
# pod cache clean TNOrgnization
# pod cache clean TNPhotoSelector
# pod cache clean TNQiNiuSDK
# pod cache clean TNQRCode
# pod cache clean TNRssRichText
# pod cache clean TNSearch
# pod cache clean TNSensorsAnalyticsSDK
# pod cache clean TNSkin
# pod cache clean TNSShare
# pod cache clean TNTrends
# pod cache clean TNUser
# pod cache clean TNWorkBench
# pod cache clean ToonCommon
# pod cache clean ToonKit
# pod cache clean ToonRouter
# pod cache clean ToonYYKit
# }

