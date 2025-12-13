#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

# system
TODISABLE=()

TODISABLE+=('com.apple.bootpd' \
'com.apple.analyticsd' \
'com.apple.osanalytics.osanalyticshelper' \
'com.apple.locationd' \
'com.apple.SubmitDiagInfo' \
'com.apple.symptomsd-diag' \
'com.apple.symptomsd' \
'com.apple.memoryanalyticsd' \
'com.apple.rtcreportingd' \
'com.apple.systemstats.daily' \
'com.apple.systemstats.analysis' \
'com.apple.systemstats.microstackshot_periodic' \
'com.apple.backupd' \
'com.apple.backupd-helper' \
'com.apple.cloudd' \
'com.apple.cloudpaird' \
'com.apple.cloudphotod' \
'com.apple.CloudPhotosConfiguration' \
'com.apple.CoreLocationAgent' \
'com.apple.coreduetd' \
'com.apple.dhcp6d' \
'com.apple.familycontrols' \
'com.apple.findmymacmessenger' \
'com.apple.followupd' \
'com.apple.FollowUpUI' \
'com.apple.ftp-proxy' \
'com.apple.ftpd' \
'com.apple.GameController.gamecontrollerd' \
'com.apple.geod' \
# prevent diskutility warning 'com.apple.icloud.findmydeviced' \
'com.apple.icloud.fmfd' \
'com.apple.icloud.searchpartyd' \
'com.apple.itunescloudd' \
'com.apple.ManagedClient.cloudconfigurationd' \
'com.apple.netbiosd' \
'com.apple.nsurlsessiond' \
'com.apple.protectedcloudstorage.protectedcloudkeysyncing' \
'com.apple.rapportd' \
'com.apple.screensharing' \
'com.apple.security.cloudkeychainproxy3' \
'com.apple.siri.morphunassetsupdaterd' \
'com.apple.siriinferenced' \
'com.apple.triald.system' \
'com.apple.mDNSResponder' \
'com.apple.wifianalyticsd' \
'org.cups.cupsd' \
'com.apple.ReportCrash')

for daemon in "${TODISABLE[@]}"
do
Echo $daemon
    launchctl bootout system/${daemon}
    launchctl disable system/${daemon}

	launchctl bootout user/277/${daemon}
	launchctl disable user/277/${daemon}

	launchctl bootout user/278/${daemon}
	launchctl disable user/278/${daemon}

	launchctl bootout user/501/${daemon}
	launchctl disable user/501/${daemon}

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
done


