//
//  LoginSvcDTO.swift
//  MobileERP
//
//  Created by K.Hee.W on 2019. 2. 25..
//  Copyright © 2019년 Sunil Luitel. All rights reserved.
//

import Foundation

class LoginSvcDTO {
    //basic info
    var serverIP = ""
    var bis = ""
    var oper = ""
    var langSeq = "0"
    
    var loginID = ""
    
    //below values are set after calling login msg svc by userid.
    
    //value from login view.
    var companySeq = "1"
    //UserSeq in _TCACompany1
    var userSeq = "0"
    
    //for ess
    //IsESSUser in _TCACompany1
    var isEssUser = ""
    //LicenseType in _TCACompany1
    var licenseType = ""
    //value from login view.
    var login_IsESS = false
    //ProductType in _TCACompany
    var productType = ""
    
    //default 1
    //LastLoginType in _TCAMobileSecurityPolicy
    var loginType = "1"
}
