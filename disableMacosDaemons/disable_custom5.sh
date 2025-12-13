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
      launchctl bootout "gui/501/${daemon}"
    launchctl disable "gui/501/${daemon}"

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

