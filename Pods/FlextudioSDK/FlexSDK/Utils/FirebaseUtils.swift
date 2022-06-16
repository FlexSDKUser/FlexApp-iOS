//
//  FirebaseUtils.swift
//  MobileERP
//
//  Created by Sunil Luitel on 11/22/16.
//  Copyright © 2016 Sunil Luitel. All rights reserved.
//

import Foundation
import FirebaseAnalytics


protocol CompanitySaveStatusDelegate {
    func returnStatus(isSuccess: Bool)
}
class FirebaseUtils {
    var companitySaveStatusDelegate: CompanitySaveStatusDelegate?
//    var databaseRef : DatabaseReference?
//    class func signedIn(_ user: User?) {
//        Analytics.logEvent(AnalyticsEventLogin, parameters: nil)
//        
//    }
    

    class func analyticsLogEventWithName(_ eventName: String, eventParameters: [String:NSObject]) {
//        var eventParams = eventParameters
        //Removed below line because device type will be there in user_dim.app_info.app_platform already
//        eventParams.updateValue("iOS" as NSObject, forKey: "DeviceType")
        Analytics.logEvent(eventName, parameters: eventParameters)
    }

   
    // This checks whether UI Settings event is logged in firebase or not. We have added the code of analytics later, but there can be some users who have made changes to settings before we wrote the code of adding analytics events. The event is logged only once.
    // Sunil Luitel
    
    class func setEventForUISettings(){
        var isEventAlreadySet = SharedPreferenceUtil.getValue(Const.FirebaseEventSet, dftValue: false)
        if !isEventAlreadySet {
            
            let userDefault = UserDefaults.standard
            var eventParameters:[String:NSObject] = [:]
            
            if userDefault.object(forKey: Const.KEY_ScaleToDefault) != nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_ScaleToDefault) as! NSObject, forKey: Const.SelectedFontSizeKey)
                FirebaseUtils.analyticsLogEventWithName(Const.EventTextSizeSelected, eventParameters: eventParameters)
            }
            if userDefault.object(forKey: Const.KEY_RowControlCountPortrait) != nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_RowControlCountPortrait) as! NSObject, forKey: Const.ControlCountPortraitKey)
                FirebaseUtils.analyticsLogEventWithName(Const.ControlCountPortraitSelected, eventParameters: eventParameters)
            }
            
            if userDefault.object(forKey: Const.KEY_RowControlCountLand) != nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_RowControlCountLand) as! NSObject, forKey: Const.ControlCountLandKey)
                FirebaseUtils.analyticsLogEventWithName(Const.ControlCountLandscapeSelected, eventParameters: eventParameters)
            }
            
            if userDefault.object(forKey: Const.KEY_SheetColumnCount) != nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_SheetColumnCount) as! NSObject, forKey: Const.ColumnCountKey)
                FirebaseUtils.analyticsLogEventWithName(Const.ColumnCountSelected, eventParameters: eventParameters)
            }
            if userDefault.object(forKey: Const.KEY_CodeHelpCount) != nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_CodeHelpCount) as! NSObject, forKey: Const.CodehelpItemCountKey)
                FirebaseUtils.analyticsLogEventWithName(Const.CodehelpItemCountSelected, eventParameters: eventParameters)
            }
            if userDefault.object(forKey: Const.KEY_ColorString) != nil {
                isEventAlreadySet = true
                eventParameters = [:] 
                eventParameters.updateValue(userDefault.object(forKey: Const.KEY_ColorString) as! NSObject, forKey: Const.SelectedColorKey)
                FirebaseUtils.analyticsLogEventWithName(Const.EventColorSelected, eventParameters: eventParameters)
            }
            
            if userDefault.object(forKey: Const.IsPatternEnabled) !=  nil {
                isEventAlreadySet = true
                eventParameters = [:]
                eventParameters.updateValue(Const.UsePattern as NSObject, forKey: Const.PatternLockSelected)
                FirebaseUtils.analyticsLogEventWithName(Const.PatternLockSelected, eventParameters: [:])
            }
        }
        
        if isEventAlreadySet {
            SharedPreferenceUtil.put(Const.FirebaseEventSet, value : true)
        }
    }
    
    class func setUserPropertyUserID(){
        let user = String(BaseUserValue.DsnBis)+String(BaseUserValue.UserSeq)
        Analytics.setUserID(nil)
        Analytics.setUserProperty(String(BaseUserValue.DsnBis), forName: "Company")
        Analytics.setUserID(user)
    }
    
}
