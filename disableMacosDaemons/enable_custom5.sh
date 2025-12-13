#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

#Custom
TODISABLE=()

TODISABLE+=(
'com.apple.coreservices.useractivityd' #managing user activities and powering the Continuity features across Apple devices
\
'com.apple.AppSSOAgent' #Single Sign-On for enterprise apps (like Microsoft Entra ID/Azure AD, Office 365, Teams)
\
'com.apple.AppSSODaemon' 
\
'com.apple.identityservicesd' #disabling breaks iMessage, FaceTime, iCloud, Continuity, and Handoff
\
'com.apple.BTServer.cloudpairing' #managing Bluetooth for iPhones, Apple Watches, or even Apple Remotes, facilitating features like Handoff, Universal Clipboard, and Find My
\
'com.apple.cdpd' #managing data flow for cellular connections, disable - continuity of data across devices
\
'com.apple.sociallayerd' #managing contact photos and names, from iMessage, FaceTime across the system, for other apps
\
'com.apple.syncdefaultsd' #syncs app settings, preferences, and NSUbiquitousKeyValueStore data across Apple devices via iCloud
\
'com.apple.calaccessd' #managing and syncing your calendar data from iCloud, Exchange, Google, and other
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

