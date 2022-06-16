//
//  SharedPreferenceUtil.swift
//  MobileERP
//
//  Created by Manoj Karki on 11/4/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import Foundation

open class SharedPreferenceUtil{
    
    class func clearUserDefaultData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    class func remove(_ key: String){
        let preferences: UserDefaults = UserDefaults.standard
        preferences.removeObject(forKey: key)
        preferences.synchronize()
    }
    
    class func put(_ key: String, value: String) {
        //        let PREF_NAME: String? = "ylw.mobileerp"
        let preferences: UserDefaults = UserDefaults.standard //NSUserDefaults(suiteName: PREF_NAME)!
        preferences.set(value, forKey: key)
        preferences.synchronize()
    }
    
    
    class func put(_ key: String, value: Bool) {
        let preferences: UserDefaults = UserDefaults.standard
        preferences.set(value, forKey: key)
        preferences.synchronize()
    }
    
    class func put(_ key: String, value: Int) {
        let preferences: UserDefaults = UserDefaults.standard
        preferences.set(value, forKey: key)
        preferences.synchronize()
    }
    
    
    class func getValue(_ key: String, dftValue: String) -> String {
        let preferences: UserDefaults = UserDefaults.standard
        if preferences.object(forKey: key) == nil {
            //  Doesn't exist
            return dftValue
        } else {
            let value = preferences.string(forKey: key)
            return value!
        }
        
    }
    
    class func getValue(_ key: String, dftValue: Int) -> Int {
        let preferences: UserDefaults = UserDefaults.standard
        if preferences.object(forKey: key) == nil {
            //  Doesn't exist
            return dftValue
        } else {
            let value = preferences.integer(forKey: key)
            return value
        }
        
    }
    
    
    class func getValue(_ key: String, dftValue: Bool) -> Bool {
        let preferences: UserDefaults = UserDefaults.standard
        if preferences.object(forKey: key) == nil {
            //  Doesn't exist
            return dftValue
        } else {
            let value = preferences.bool(forKey: key)
            return value
        }
    }
}


//MARK: Companity
struct UserDefaultKeys {
    static let userId = "userId"
    static let companityId = "companityId"
}


