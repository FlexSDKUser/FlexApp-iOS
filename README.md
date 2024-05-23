# [Flextudio](https://flextudio.com) SDK for iOS

[![Platform](https://img.shields.io/badge/platform-ios-orange.svg)](https://github.com/FlexSDKUser/FlexApp-iOS)
[![Languages](https://img.shields.io/badge/language-swift-orange.svg)](https://github.com/FlexSDKUser/FlexApp-iOS)

## Table of contents

1. [Introduction](#introduction)
1. [Requirements](#requirements)
1. [Quick start](#quick-start)
1. [Step by step](#step-by-step)

## Introduction

The <span style="color:orange"> Flextudio SDK </span> for iOS allows us to easily build native app to run modules developed in flextudio.
<br />

### How it works

The <span style="color:orange"> Flextudio SDK </span> enables use of all features and services supported by flextudio platform. By simply adding the SDK dependencies into a new iOS app project, a fully functional flex app can be built without any other setup or initalization.

## Requirements

The minimum requirements for the <span style="color:orange"> Flextudio SDK </span> for iOS are:

- `Xcode 13.0 or higher`
- `Swift 5.1 or higher`
- `iOS 15.0 or higher`
- `Cocoapods`

> **Note**: <span style="color:orange"> Flextudio SDK </span> includes initialization of firebase push notification and other dependencies. You are only required to include google-services.plist corresponding to your package Id to take full advantage of flextudio push notification services.

## Quick start

You can download the source code for sample app from this repository and open it in your xcode for one step installation and testing.

## Step by step

Follow the steps below to create a new app of your own using <span style="color:orange"> Flextudio SDK </span>.

### Step 1: Create new ios app project in Xcode

Open Xcode and create a new iOS app project with storyboard as a template.
File > New > Project > Select App...click Next.
![Create new ios app](https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/createproj.png "Create new ios app")
Provide your desired product name and organization identifier.
Select Storyboard from Interface dropdown menu.
Click Next and then click Finish.
> **Note**: You need this bundle identifier to generate `GoogleServices-Info.plist` file for your application to support firebase push notification and other services.

### Step 2: Open a terminal at project location. Create `Podfile` for the project using command **pod init**

```
pod init
```

### Step 3: In `Podfile`, add source and  FlextudioSDK

Open Podfile and place FlextudioSDK dependency under target 'yourproject'

```swift
# platform :ios, '13.0'
# Copy these source urls
source 'https://github.com/CocoaPods/Specs.git'
source 'https://FlexSDKCreator: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@github.com/FlexSDKCreator/SDK_ios_podspec.git'

# Replace <yourproject> with your own project name
target '<yourproject>' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks! 
  # Pods for <yourproject>
  # Add FlextudioSDK pod with specific version
  pod 'FlextudioSDK', '1.0.4'
  end

```

### Step 4: Run pod install command in terminal

```
pod install
```

Wait until all dependencies are download and follow the instruction in terminal.

### Step 5: Please close any current Xcode sessions and open `yourproject.xcworkspace` for this project from now on

After pod installation, new files are generated by dependencies. Go to your project location and find `yourproject.xcworkspace`  file and open it with xcode.
</br>


### Step 6: Enable **Push Notifications** 
Navigate to **Targets** -> Your App -> **Signing & Capabilities**

Note: Prerequisite for **Push Notifications**. Bundle Identifier must be registered in [Apple developer account](https://developer.apple.com/account/resources/identifiers/list) with Push Notifications selected.
![Push notifications in Apple website](https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/pushnotification.png "Push notifications in Apple website")
And to send Push Notifications, registering APNs key in [Apple developer website](https://developer.apple.com/account/resources/authkeys/list) is also required.

### Step 7: Enable **Remote notifications**
Navigate to **Targets** -> Your App -> **Signing & Capabilities** -> add  **Background Modes** and check **Remote notifications**

![Remote notifications](https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/remotenotification.png "Remote notifications")

</br>


### Step 8: Add these permission required for framework in your project `Info.plist`

- Privacy - Calendars Usage Description
- Privacy - Camera Usage Description
- Privacy - Contacts Usage Description
- Privacy - Location Always and When In Use Usage Description
- Privacy - Location Always Usage Description
- Privacy - Location When In Use Usage Description
- Privacy - Microphone Usage Description
- Privacy - Photo Library Additions Usage Description
- Privacy - Photo Library Usage Description
- Privacy - Location Temporary Usage Description Dictionary
![permission](https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/iOSperm.png "permission")  

Note:  Alternately, you can add these permission by directly copying below code and add it inside <mark>&lt;dict&gt;</mark> element in your `Info.plist`(Right click your Info.plist and select **open as source code**).

```swift
<key>NSAppTransportSecurity</key>
 <dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
 </dict>
 <key>NSCalendarsUsageDescription</key>
 <string>App needs to access the calendar to track events</string>
 <key>NSCameraUsageDescription</key>
 <string>Used to take picture and barcode</string>
 <key>NSContactsUsageDescription</key>
 <string>App needs to use contacts</string>
 <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 <string>This app requires your location information to save and query data. </string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>This app requires your location information to save and query data. </string>
 <key>NSLocationTemporaryUsageDescriptionDictionary</key>
 <dict>
  <key>AccuracyRequired</key>
  <string>This app needs accurate location</string>
 </dict>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>This app requires your location information to save and query data. </string>
 <key>NSMicrophoneUsageDescription</key>
 <string>App needs to access your micophone for video recording</string>
 <key>NSPhotoLibraryAddUsageDescription</key>
 <string>We need to write photos</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>Used to get images</string>
```

### Step 9: Initialize FlexApp UI 
In `SceneDelegate.swift` file, follow these steps:
- Import FlextudioSDK Library
  ```swift
  import FlextudioSDK
  ```
- Add these codes.
  ```swift
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let winScene = (scene as? UIWindowScene) else { return }
    
    let win = UIWindow(windowScene: winScene)
    win.rootViewController = createRootViewController()
    win.makeKeyAndVisible()
    
    window = win
  }
  
  func createRootViewController() -> UIViewController {
    let flexBundle = Bundle(for: MainMasterDetailVC.self)
    let storyboard = UIStoryboard(name: "FlexSDK", bundle: flexBundle)
    return storyboard.instantiateInitialViewController() ?? UIViewController()
  }
  ```

### Step 10: To receive Push Notifications
In `AppDelegate.swift` file, follow these steps:
- Import Firebase and FlextudioSDK Libraries
	```swift
	import FirebaseCore
	import FirebaseMessaging
 	import FlextudioSDK
	```
- extend following Protocols in **AppDelegate** class
	```swift
	UNUserNotificationCenterDelegate, MessagingDelegate
	```
- add these code in ```func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)``` function
	```swift
	    FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_,_  in })
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
        
        if launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil {
            let dic = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? NSDictionary
            NotiConstants.sharedInstance.userDefaults.set(dic, forKey: NotiConstants.notificationpayload);
        }
	```
- add these function
	```swift
	func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        let title = response.notification.request.content.title
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotiConstants.notificationpayload), object: title, userInfo: userInfo)
        completionHandler()
    }
	```
![appdelegate](https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/appdelegate.png "appdelegate")  

### Step 11: Add `GoogleServices-Info.plist` file in your project

<img src="https://create-s3-test1.s3.ap-northeast-2.amazonaws.com/readme-ios-sdk/googleservice-info.png" alt="GoogleServices-Info.plist" width="50%" />  

This file is generated from [Firebase Console](https://console.firebase.google.com/ "Firebase Console") for the bundle identifier of your project.
> Note: It is required to register the app in firebase project and provide Flextudio Team 'Server key' to send push notifiications to your apps. Alternatively, we (Flextudio Team) can assist you to generate the  `GoogleServices-Info.plist` file. For this you should provide us with <mark>.p8 APNs key file with your team id and key id</mark> from your [Apple developer account](https://developer.apple.com/account). 

PS : To recieve push notification we need your p8 key files which is issued from Apple Development Center
> Refer to this site : https://support.mobiroller.com/en/knowledgebase/5-how-to-create-a-key-file-p8-on-apple-to-send-push-notifications/	


### Step 12: Now, build  and run the project
