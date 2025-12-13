#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

# user
TODISABLE=()

TODISABLE+=(
'com.apple.accessibility.MotionTrackingAgent' \
'com.apple.ReportCrash' \
'com.apple.SafariBookmarksSyncAgent' \
'com.apple.Safari.SafeBrowsing.Service' \
'com.apple.amsaccountsd' \
'com.apple.amsengagementd' \
'com.apple.transparencyd' \
'com.apple.EscrowSecurityAlert' \
'com.apple.AMPArtworkAgent' #iphone/ipad sync  
\
'com.apple.AMPDeviceDiscoveryAgent' #iphone/ipad sync 
\
'com.apple.AMPLibraryAgent' #iphone/ipad sync 
\
'com.apple.ap.adprivacyd' \
'com.apple.ap.adservicesd' \
'com.apple.ap.promotedcontentd' \
'com.apple.assistant_service' \
'com.apple.assistantd' \
'com.apple.avconferenced' \
'com.apple.BiomeAgent' \
'com.apple.biomesyncd' \
'com.apple.CallHistoryPluginHelper' \
'com.apple.cloudd' \
'com.apple.cloudpaird' \
'com.apple.cloudphotod' \
'com.apple.CloudPhotosConfiguration' \
'com.apple.CloudSettingsSyncAgent' \
'com.apple.CommCenter-osx' \
'com.apple.CoreLocationAgent' \
'com.apple.dataaccess.dataaccessd' \
'com.apple.donotdisturbd' \
'com.apple.ensemble' \
'com.apple.familycircled' \
'com.apple.familycontrols.useragent' \
'com.apple.familynotificationd' \
'com.apple.financed' \
'com.apple.followupd' \
'com.apple.gamed' \
'com.apple.geod' \
'com.apple.homed' \
'com.apple.icloud.fmfd' \
'com.apple.iCloudNotificationAgent' \
'com.apple.iCloudUserNotifications' \
'com.apple.icloud.searchpartyuseragent' \
'com.apple.imagent' \
'com.apple.imautomatichistorydeletionagent' \
'com.apple.imtransferagent' \
'com.apple.intelligenceplatformd' \
'com.apple.itunescloudd' \
'com.apple.knowledge-agent' \
'com.apple.ManagedClient.cloudconfigurationd' \
'com.apple.ManagedClientAgent.enrollagent' \
'com.apple.Maps.mapspushd' \
'com.apple.Maps.pushdaemon' \
'com.apple.mediaanalysisd' \
'com.apple.mediastream.mstreamd' \
'com.apple.newsd' \
'com.apple.nsurlsessiond' \
'com.apple.parsec-fbf' \
'com.apple.parsecd' \
'com.apple.passd' \
'com.apple.photoanalysisd' \
'com.apple.photolibraryd' \
'com.apple.progressd' \
'com.apple.protectedcloudstorage.protectedcloudkeysyncing' \
'com.apple.rapportd-user' \
'com.apple.remindd' \
'com.apple.routined' \
'com.apple.SafariCloudHistoryPushAgent' \
'com.apple.screensharing.agent' \
'com.apple.screensharing.menuextra' \
'com.apple.screensharing.MessagesAgent' \
'com.apple.ScreenTimeAgent' \
'com.apple.security.cloudkeychainproxy3' \
'com.apple.sharingd' \
'com.apple.sidecar-hid-relay' \
'com.apple.sidecar-relay' \
'com.apple.siri.context.service' \
'com.apple.macos.studentd' \
'com.apple.siriknowledged' \
'com.apple.suggestd' \
'com.apple.tipsd' \
'com.apple.telephonyutilities.callservicesd' \
'com.apple.TMHelperAgent' \
'com.apple.TMHelperAgent.SetupOffer' \
'com.apple.triald' \
'com.apple.UsageTrackingAgent' \
'com.apple.videosubscriptionsd' \
'com.apple.WiFiVelocityAgent' \
'com.apple.weatherd'
)

for agent in "${TODISABLE[@]}"
do
    launchctl bootout gui/501/${agent}
    launchctl disable gui/501/${agent}

	launchctl bootout user/277/${daemon}
	launchctl disable user/277/${daemon}

	launchctl bootout user/278/${daemon}
	launchctl disable user/278/${daemon}

	launchctl bootout user/200/${daemon}
	launchctl disable user/200/${daemon}

	launchctl bootout user/205/${daemon}
	launchctl disable user/205/${daemon}

	launchctl bootout user/262/${daemon}
	launchctl disable user/262/${daemon}

	launchctl bootout user/202/${daemon}
	launchctl disable user/202/${daemon}

	launchctl bootout user/0/${daemon}
	launchctl disable user/0/${daemon}

	#launchctl bootout user/501/${daemon}
	#launchctl disable user/501/${daemon}
done

#read -n 1 -s -r -p "Press any key to continue..."