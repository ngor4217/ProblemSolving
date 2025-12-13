#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

#Custom
TODISABLE=()

TODISABLE+=(
'com.apple.bird' #iCloud Drive and iCloud synchronization
\
'com.apple.metadata.mds' #Metadata Server for Spotlight
\
'com.apple.metadata.mds.scan' # spotlight file indexer
\
'com.apple.metadata.mds.index' #creating and maintaining the index used by Spotlight search
\
'com.apple.ftp-proxy' # ftp proxy, listening tcp ports... I don't host any ftp services...
\
'com.apple.homed' # macOS background process that manages the state and controls of HomeKit accessories for Apple's smart home platform
\
'com.apple.GameController.gamecontrolleragentd' #You will not be able to use game controllers with your Mac. 
\
'com.apple.weatherd' #you will not receive weather updates.
\
'com.apple.Spotlight' #lose the ability to quickly search for files, applications Spotlight or the top-right search bar
\
#'com.apple.corespotlightd' #Disabling Spotlight core daemon would severely impair or entirely break this functionality.
\
'com.apple.contactsd' #t enables interactions between your contacts and other native apps like Mail, Messages, and FaceTime. 
\
'com.microsoft.autoupdate.helper' #ms rep trash
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

