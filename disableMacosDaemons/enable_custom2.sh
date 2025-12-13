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
'com.apple.corespotlightd' #Disabling Spotlight core daemon would severely impair or entirely break this functionality.
\
'com.apple.contactsd' #t enables interactions between your contacts and other native apps like Mail, Messages, and FaceTime. 
\
'com.microsoft.autoupdate.helper' #ms rep trash
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

