#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

#Custom
TODISABLE=()

TODISABLE+=(
'syslogd' \
'logd_helper' \
'logd' \
'com.apple.geod' \
'geodMachServiceBridge' \
'com.apple.wifianalyticsd' \
'com.apple.analyticsd' \
'com.apple.auditd' \
'com.apple.symptomsd' \
'com.apple.autofsd' \
'com.apple.ospredictiond' \
'com.apple.appleseed.fbahelperd' \
'com.apple.icloud.searchpartyd ' #Find My 
\
'com.apple.nsurlsessiond_privileged' \
'com.apple.awdd' \
'com.apple.contextstored' \
'com.apple.appleh13camerad' \
'com.apple.nearbyd' \
'com.apple.systemstatusd' \
'com.apple.BTServer.le' \
'com.apple.locationd' \
'com.apple.backupd' \
'com.apple.aned' #for machine learning tasks
\
'com.apple.airportd' \
'com.apple.remoted' \
'com.apple.mediaremoted' # airpods stop/next working! after stop
\
'com.apple.fairplayd' \
'com.apple.systemstats.analysis' \
'com.apple.revisiond' #save data when poweroff, maybe and enable file->revert-revisions
\
'com.apple.accessoryupdaterd' \
'AccountSubscriber' \
'com.apple.CrashReporterSupportHelper' \
'mediasharingd'
)

for daemon in "${TODISABLE[@]}"
do
    launchctl bootstrap "gui/501/${daemon}"
    launchctl enable "gui/501/${daemon}"

	launchctl bootstrap system/${daemon}
    launchctl enable system/${daemon}

	launchctl bootstrap user/277/${daemon}
	launchctl enable user/277/${daemon}

	launchctl bootstrap user/278/${daemon}
	launchctl enable user/278/${daemon}

	launchctl bootstrap user/501/${daemon}
	launchctl enable user/501/${daemon}

	launchctl bootstrap user/200/${daemon}
	launchctl enable user/200/${daemon}

	launchctl bootstrap user/205/${daemon}
	launchctl enable user/205/${daemon}

	launchctl bootstrap user/262/${daemon}
	launchctl enable user/262/${daemon}

	launchctl bootstrap user/202/${daemon}
	launchctl enable user/202/${daemon}

	launchctl bootstrap user/0/${daemon}
	launchctl enable user/0/${daemon}
done

