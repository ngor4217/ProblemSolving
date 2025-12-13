#!/bin/bash
#Credit: Original idea and script disable.sh by pwnsdx https://gist.github.com/pwnsdx/d87b034c4c0210b988040ad2f85a68d3

#SCRIPT FOR Disabling unwanted services on macOS 13 Ventura
#Disabling SIP is required  ("csrutil disable" from Terminal in Recovery)
#Modifications are written in /private/var/db/com.apple.xpc.launchd/ disabled.plist, disabled.501.plist
# To revert, delete /private/var/db/com.apple.xpc.launchd/ disabled.plist and disabled.501.plist and reboot
#shut down, press and hold the power button until "Loading startup options," appears, click the gear icon, then Continue, and sign in

# user
TODISABLE=()

TODISABLE+=('com.apple.accessibility.MotionTrackingAgent' \
'com.apple.ReportCrash' \
'com.apple.SafariBookmarksSyncAgent' \
'com.apple.Safari.SafeBrowsing.Service' \
'com.apple.amsaccountsd' \
'com.apple.amsengagementd' \
'com.apple.transparencyd' \
'com.apple.EscrowSecurityAlert' \
'com.apple.AMPArtworkAgent' #iphone/ipad sync 
\
'com.apple.AMPDeviceDiscoveryAgent' #iphone/ipad sync 
\
'com.apple.AMPLibraryAgent' #iphone/ipad sync 
\
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
'com.apple.weatherd')

for agent in "${TODISABLE[@]}"
do
    launchctl bootout gui/501/${agent}
    launchctl disable gui/501/${agent}

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
'org.cups.cupsd')

for daemon in "${TODISABLE[@]}"
do
    launchctl bootout system/${daemon}
    launchctl disable system/${daemon}

	launchctl bootout user/277/${daemon}
	launchctl disable user/277/${daemon}

	launchctl bootout user/278/${daemon}
	launchctl disable user/278/${daemon}

#carefull - crash one disabling gui
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
'mediasharingd' \ 
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
'com.apple.syncdefaultsd' #syncs app settings, preferences, and NSUbiquitousKeyValueStore data across Apple devices via iCloud
\
'com.apple.calaccessd' #managing and syncing your calendar data from iCloud, Exchange, Google, and other
)

for daemon in "${TODISABLE[@]}"
do
    launchctl bootout system/${daemon}
    launchctl disable system/${daemon}

    launchctl bootout gui/501/${daemon}
    launchctl disable gui/501/${daemon}


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

#UNDER QUESTION:
#com.apple.talagent 			#features like Auto Save, Versions, Resume (reopening apps/documents after restart), It ensures apps save work, restore state, and don't crash the system due to resource
#com.apple.accessibility.heard 		#Plays ambient sounds (like waves or rain) Settings > Accessibility > Hearing
#com.apple.usernoted 			#Manages Notifications: It's the central service for all pop-ups and banner alerts you see on your Mac.
# need investigation 'com.apple.mobiletimerd' #manages and triggers the built-in timers and alarms, ensuring they fire at the scheduled times

#NOT DISABLE -> critical or unknown services to avoid problems
#com.apple.quicklook			#desktop Icons preview!!!
#com.apple.quicklook.ui.helper		#desktop Icons preview!!!
#com.apple.quicklook.ThumbnailsAgent	#desktop Icons preview!!!
#com.apple.corespotlightd 		#disable ALL Indexing functionality even in Settings or Finder
#com.apple.universalaccessd		#Color Filters!!!!
#com.apple.airportd			#WIFI!!!!!
#com.apple.CryptoTokenKit.ahp.agent 	#system crash! CryptoTokenKit (CTK), managing cryptographic tokens like smart cards, hardware security modules Interacts with physical smart cards, virtual tokens, or network-based security devices
#com.apple.distnoted.xpc.agent 		#manages notifications between applications, allowing to communicate events.
#com.apple.carboncore.csnameddata 	#crash when disabled!!! legacy Carbon APIs in macOS. That deprecated in 2012
#com.apple.xtyped 			#System Integration: bridges parts of macOS (kernel, apps, services) forupdates, system configuration, or leveraging core OS features.
#com.apple.CoreAuthentication.agent 	#display prompts that ask for password when administrator-level changes are requested.
#com.apple.SystemUIServer.agent 	#managing the menu bar at the top, displaying icons (Wi-Fi, battery, time, volume)
#com.apple.imklaunchagent 		#switching between keyboard layouts and input sources (e.g., Pinyin, Emoji, U.S. Keyboard).
#com.apple.notificationcenterui.agent 	#visual appearance Notification Center, banners, alerts, full view by clicking the date/time
#com.apple.pbs 				#updating the Services menu in applications
#com.apple.containermanagerd 		#define what an app(container) can access. ensures each app knows its boundaries
#com.apple.pboard 			#handling all cut, copy, and paste operations by managing data between applications
#com.apple.coreservices.sharedfilelistd #It maintains the lists of recent items found in the Apple Menu (Apple menu > Recent Items).
#com.apple.backgroundtaskmanagement.agent #Alerts for Settings > General > Login Items, user notifications about background tasks
#com.apple.pluginkit.pkd 		#register and asociate file extensions and apps asociated
#com.apple.ViewBridgeAuxiliary 		#helps manage interactions between the secure, isolated environments of sandboxed applications (a security feature in macOS) and core system functions.
(HSMs), and other security keys for authentication, signing, and encryption tasks within macOS and its applications
#com.apple.askpermissiond 		#prompt users for passwords, granting app permissions (e.g., camera, mic, location) or system changes
#com.apple.coreservices.uiagent 	#Displaying system alerts, notifications, and security prompts. 
#com.apple.replayd 			#screen record sec bridge between app like a game, video conferencing, or a streaming. Apps with "Screen Recording" permission use replayd to function.
#com.apple.StatusKitAgent 		#managing and distributing status updates for Apple's StatusKit framework, presence, availability (e.g., Do Not Disturb, Focus), and communication states across apps
#com.apple.tccd 			#manages permissions for apps accessing camera, microphone, location, photos, contacts, and files, acting asgatekeeper
#com.apple.accessibility.mediaaccessibilityd #manages Settings -> accessibility -> Captions 
#com.apple.accountsd 			#Accounts Framework -> manages user accounts, fetches passwords, usernames from the Keychain for apps
#com.apple.audio.AudioComponentRegistrar #registering audio components, effects (plugins), audio drivers, web browser can find and use audio devices and software components when needed for playback or recording. 
#com.apple.secd 			#access to and modifications macOS Keychains, Syncs Keychain across devices.
#com.apple.TextInputSwitcher 		#switching between keyboard layouts, languages (input sources), Character Viewer, Keyboard Viewer
#com.apple.wifi.WiFiAgent 		#scanning, connecting, managing Wi-Fi status, for user-level actions or framework interactions
#com.apple.Dock.agent 			#responsible for managing the user's Dock, a core part graphical interface holds apps
#com.apple.AirPlayUIAgent		#airplay ???
#com.apple.AccessibilityVisualsAgent 	#(Zoom), VoiceOver (screen reader), and !color filters!
#com.apple.XprotectFramework.PluginService #XProtect, which scans for, detects, and blocks known malware using signature updates, acting as your Mac's first line of defense against malicious software automatically and silently
#com.apple.secinitd 			#enforcing security policies for applications, services ensuring they run correct privileges
#com.apple.ctkd 			#manages tokens drivers, certificates,sessions, auth VPNs, encrypted emails, network access
#com.apple.controlcenter 		#menu bar for quick access Wi-Fi, Bluetooth, Focus, volume, brightness, and AirDrop
#com.apple.apfsuseragent 		#monitors for new APFS (Apple File System) containers or volumes ensuring proper disk management
#com.apple.accessibility.AXVisualSupportAgent # need for "color adjustments"
#com.apple.cfprefsd.xpc.agent 		# reads and writes user settings and system configurations.
#com.apple.TextInputMenuAgent 		#manage text input methods, select different keyboards or input methods.
#com.apple.ndoagent 			#involved in Bluetooth interactions iOS Device Integration: Supports seamless interaction with iPhones/iPads (AirDrop, Handoff). Works with nsurlsessiond for App Store, iCloud, and Safari. 
#com.apple.iconservices.iconservicesagent #generating, managing, and caching icons for files, applications, and system services
#com.apple.PerfPowerServices 		#Manages power and performance logs
#com.apple.revisiond 			#save data on poweroff, maybe and enable file->revert-revisions
#com.apple.suhelperd 			# need for OS update and other updates
#com.apple.AirPlayXPCHelper 		# airplay
#com.apple.mediaremoted    		#now playing widget, prob need for switching next/prev with AirPods
#com.apple.tccd.system 			# camera and privacy options app sharing service, NOT STOP
#com.apple.corebrightnessd 		#nightshift
#com.apple.opendirectoryd 		#allowing login
#com.apple.timed 			#timesync for auth protocols like Kerberos
#?com.apple.oahd 			#run rosetta 2 intel apps, does I have any?...
#com.apple.FileCoordination 		#(core)coord file access to ensure data integrity 
#com.apple.alf 				#managing the Application Layer Firewall (ALF)
#com.apple.diskarbitrationd 		#listens and allow  USB plugged and check user access
#com.apple.diskmanagementd 		#mount any disks
#com.apple.cmio.uvcassistantextension 	#apps that use camera video conferencing rely on this
#com.apple.runningboardd 		#not sure, ggl says that it can prevent mac frm sleping during downloads
#com.apple.usbmuxd 			#check iphone file transfer after stop
#com.apple.timesync.audioclocksyncd 	#sync clock with network time servers
#com.apple.trustd 			#cert check for all processes, megaspy sec process?
#com.apple.trustd.agent			#agent for core device above
#com.apple.distnoted.xpc.daemon 	#XPC (inter-process comm) system, handles distributed notification
#com.apple.Finder 			#finder!! Not disable!!!
#com.apple.mediaremoteagent 		#Now Playing widget - prob need to airpods next/prev
#com.apple.FontWorker  			#a system process that registers and validates fonts for macOS
#com.apple.bluetoothuserd		# bluetooth associated, just don't touch
#com.apple.WindowManager.agent		#core, prob windows render manage
#com.apple.lsd				#It provides support for launching applications and ensuring the correct execution environment. 
#?com.apple.icdd 			#identify and match devices that can supply image data, such as digital cameras or scanners, with the correct driver modules
#com.apple.videoconference.camera 	#ability to perform automatic device backups will likely be disabled. Finder may behave unexpectedly or not open when an iOS device is connected. 

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
'com.apple.parsecd
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
)

for daemon in "${TODISABLE[@]}"
do
    launchctl list | grep -i "$daemon"
done


