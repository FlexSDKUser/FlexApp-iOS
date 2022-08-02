//
//  AppDelegate.swift
//  FlexStory
//
//  Created by Subhaye on 6/15/22.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import FlextudioSDK
//import Companity
@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {


//    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        Messaging.messaging().delegate = self
        application.registerForRemoteNotifications()
        //check if app opened from notification click
        if launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil {
            let dic = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? NSDictionary
            NotiConstants.sharedInstance.userDefaults.set(dic, forKey: NotiConstants.notificationpayload);
        }
    
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    // when app is in bg or fg
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        let title = response.notification.request.content.title
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotiConstants.notificationpayload), object: title, userInfo: userInfo)
        completionHandler()
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

