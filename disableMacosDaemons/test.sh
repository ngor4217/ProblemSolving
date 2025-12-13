#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot
#shut down, press and hold the power button until "Loading startup options," appears, click the gear icon, then Continue, and sign in

#CAN'T DISABLE -> services that was called disabled but still present
TODISABLE=()

TODISABLE+=(
'com.apple.BiomeAgent' \
'com.apple.CallHistoryPluginHelper' \
'com.apple.CoreLocationAgent' \
'com.apple.Maps.mapspushd' \
'com.apple.Safari.SafeBrowsing.Service' \
'com.apple.ScreenTimeAgent' \
'com.apple.UsageTrackingAgent' \
'com.apple.WiFiVelocityAgent' \
'com.apple.amsaccountsd' \
'com.apple.amsengagementd' \
'com.apple.ap.adprivacyd' \
'com.apple.assistantd' \
'com.apple.cloudd' \
'com.apple.donotdisturbd' \
'com.apple.familycircled' \
'com.apple.financed' \
'com.apple.geod' \
'com.apple.iCloudNotificationAgent' \
'com.apple.icloud.fmfd' \
'com.apple.imagent' \
'com.apple.itunescloudd' \
'com.apple.nsurlsessiond' \
'com.apple.parsecd' \
'com.apple.protectedcloudstorage.protectedcloudkeysyncing' \
'com.apple.rapportd' \
'com.apple.remindd' \
'com.apple.routined' \
'com.apple.security.cloudkeychainproxy3' \
'com.apple.sharingd' \
'com.apple.siri.context.service' \
'com.apple.siriknowledged' \
'com.apple.suggestd' \
'com.apple.telephonyutilities.callservicesd' \
'com.apple.transparencyd' \
'com.apple.triald'
\
'com.apple.ReportCrash' \
'com.apple.SafariBookmarksSyncAgent' \
'com.apple.Safari.SafeBrowsing.Service' \
'com.apple.amsaccountsd' \
'com.apple.amsengagementd' \
'com.apple.transparencyd' \
'com.apple.EscrowSecurityAlert' \
'com.apple.AMPArtworkAgent' \
'com.apple.AMPDeviceDiscoveryAgent' \
'com.apple.AMPLibraryAgent' \
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
\
'com.apple.bootpd' \
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
'com.apple.icloud.fmfd' \
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
'org.cups.cupsd'
\
'syslogd' \
'logd_helper' \
'logd' \
'com.apple.geod' \
'geodMachServiceBridge' \
'com.apple.analyticsd' \
'com.apple.auditd' \
'com.apple.symptomsd' \
'com.apple.autofsd' \
'com.apple.ospredictiond' \
'com.apple.appleseed.fbahelperd' \
'com.apple.icloud.searchpartyd ' \ 
'com.apple.nsurlsessiond_privileged' \
'com.apple.awdd' \
'com.apple.contextstored' \
'com.apple.appleh13camerad' \
'com.apple.nearbyd' \
'com.apple.systemstatusd' \
'com.apple.BTServer.le' \
'com.apple.locationd' \
'com.apple.backupd' \
'com.apple.aned' \ 
'com.apple.remoted' \
'com.apple.mediaremoted' \ 
'com.apple.fairplayd' \
'com.apple.systemstats.analysis' \
'com.apple.revisiond' \ 
'com.apple.accessoryupdaterd' \
'AccountSubscriber' \
'com.apple.CrashReporterSupportHelper' \
'mediasharingd' \ 
'com.apple.bird' \
'com.apple.metadata.mds' 
\
'com.apple.metadata.mds.scan' 
\
'com.apple.metadata.mds.index'
\
'com.apple.ftp-proxy' 
\
'com.apple.homed'
\
'com.apple.GameController.gamecontrolleragentd' 
\
'com.apple.weatherd' 
\
'com.apple.Spotlight' 
\
'com.apple.contactsd' #t enables interactions between your contacts and other native apps like Mail, Messages, and FaceTime. 
\
'com.microsoft.autoupdate.helper' #ms rep trash
\
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
\
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
\
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
'com.apple.syncdefaultsd' 
\
'com.apple.calaccessd' 
)

for daemon in "${TODISABLE[@]}"
do
    launchctl list | grep -i "$daemon" | grep -v "-"
done


