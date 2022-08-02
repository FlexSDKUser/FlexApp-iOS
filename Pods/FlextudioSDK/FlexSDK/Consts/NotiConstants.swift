//
//  NotiConstants.swift
//  FlexSDK
//
//  Created by Subhaye on 8/1/22.
//
import Foundation
public class NotiConstants: NSObject {
    public let userDefaults = UserDefaults.standard
    public static let sharedInstance = NotiConstants()
    public static let actionJson = "actionJson"
    public static let notificationpayload = "notificationpayload"
}
