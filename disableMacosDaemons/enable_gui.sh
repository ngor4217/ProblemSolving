#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot

# user
TODISABLE=()

TODISABLE+=(
'com.apple.quicklook' \
'com.apple.quicklook.ui.helper' \
'com.apple.quicklook.ThumbnailsAgent' \
'com.apple.accessibility.MotionTrackingAgent' \
'com.apple.amsaccountsd' \
'com.apple.amsengagementd' \
'com.apple.transparencyd' \
'com.apple.EscrowSecurityAlert' \
'com.apple.assistant_service' \
'com.apple.assistantd' \
'com.apple.avconferenced' \
'com.apple.BiomeAgent' \
'com.apple.biomesyncd' \
'com.apple.CallHistoryPluginHelper' \
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
'com.apple.imagent' \
'com.apple.imautomatichistorydeletionagent' \
'com.apple.imtransferagent' \
'com.apple.intelligenceplatformd' \
'com.apple.knowledge-agent' \
'com.apple.mediaanalysisd' \
'com.apple.mediastream.mstreamd' \
'com.apple.nsurlsessiond' \
'com.apple.parsec-fbf' \
'com.apple.parsecd' \
'com.apple.passd' \
'com.apple.progressd' \
'com.apple.rapportd-user' \
'com.apple.remindd' \
'com.apple.routined' \
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
'com.apple.universalaccessd' \
'com.apple.UsageTrackingAgent' \
'com.apple.videosubscriptionsd' \
'com.apple.WiFiVelocityAgent' \
)

for agent in "${TODISABLE[@]}"
do
    launchctl bootstrap gui/501/${agent}
    launchctl enable gui/501/${agent}

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