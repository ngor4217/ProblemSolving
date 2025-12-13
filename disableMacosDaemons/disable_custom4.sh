#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

#Custom
TODISABLE=()

TODISABLE+=(
'com.apple.email.maild' #handles email delivery failures, sending bounce messages when emails can't reach their destination
\
'com.apple.linkd' #Siri interact, actions and share data, quick access and Siri integration simple voice commands
\
'com.apple.helpd' #managing help content for applications, indexing help files, making searchable, accessible when press ? key
\
'com.AutoLauncher' #can't find anything exact about this, check autorun scripts and apps after disable!!!
\
'com.apple.FileProvider' #iCloud Drive, Dropbox, Google Drive, OneDrive Finder integration allowing file access, cloud file management
\
'com.apple.SoftwareUpdateNotificationManager' #displaying notifications about macOS software updates, just handles the alerts
\
'com.apple.siriactionsd' #Siri voice shortcuts
\
'com.apple.imdpersistence.IMDPersistenceAgent' #responsible for handling iMessage and the Contacts/Address Book. 
\
'com.apple.dmd' #Mobile Device Management (MDM) for organizations, allowing IT to remotely manage, configure, secure, and deploy apps/settings on Macs, iPhones, etc., communicating with MDM servers for instructions and status updates, acting as local engine for device control. 
\
'com.apple.corespeechd' #handling all speech-related features like Siri, Dictation, and Voice Control
\
'com.apple.akd' #handling Apple ID, iCloud auth for App Store, Mail, Messages, Safari, leveraging Apple's AuthKit framework
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

