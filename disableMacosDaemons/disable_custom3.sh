#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

#Custom
TODISABLE=()

TODISABLE+=(
'com.apple.diagnosticextensionsd' # ??? core system process to support Apple Diagnostics, send hardware data to apple
\
'com.apple.commerce' # purchasing, installing, and updating content from Apple's various stores. 
\
'com.apple.CommCenter' # ??? managing cellular/network communications, handling carrier settings, SIM/eSIM operations, network switching (LTE, 5G), and essential connectivity services
\
'com.apple.accessibility.axassetsd' #VoiceOver, Zoom, and Magnifier, handling things like special icons, voice data
\
'com.apple.ContextStoreAgent' # gathers to provide personalized, intelligent features, Siri, predictive text, and continuity features
\
'com.apple.cmfsyncagent' #syncing shared data and contacts, particularly related to iCloud and other Apple services
\
'com.apple.diagnostics_agent' #collecting diagnostic and usage data, monitoring system health, and reporting issues to Apple
\
'com.apple.networkserviceproxy' #managing iCloud, App Store, Apple features, downloading proxy settings from the internet, and directing traffic through configured proxies to Apple's servers
\
'com.apple.cmio.ContinuityCaptureAgent' #allowing your iPhone or iPad to act as a webcam or microphone, bridging the CoreMediaIO (CMIO) layer to use those devices seamlessly with Mac apps
\
'com.apple.AMPDeviceDiscoveryAgent' # ??? iphone/ipad sync
\
'com.apple.SecureBackupDaemon' #transfer passwords, credit card, WiFikeys to iCloud, for access across Mac, iPhone when you're signed in.
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

