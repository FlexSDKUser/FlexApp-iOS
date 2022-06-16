//
//  WebConst.swift
//  webServiceTest
//
//  Created by 김 희원 on 2015. 10. 30..
//  Copyright (c) 2015년 김 희원. All rights reserved.
//

import UIKit
import Foundation

class WebConst: NSObject {
    static let CLOSE_CODEREADER_FROM_JS = "CLOSE_CODEREADER_FROM_JS"
    static let WEBSVC_ERROR = "WEB_SERVER_ERROR"
    static let CODE_DEVICE_ERROR = "CODE_DEVICE_ERROR"
    static let WEBSVC_TIMEOUT = "TIMEOUT_ERROR"
    static let FileServiceURL_CREATE_ERROR = "FileServerURL_CREATE_ERROR"
    //wbsmdev
//    static let LOGIN_SERVER_IP = "http://wbs.ksystem.co.kr:8889"
//    static let LOGIN_DSN_OPER = "wbsmdev_oper"
//    static let LOGIN_DSN_BIS = "wbsmdev_bis"
    
    //wbs
    static let SERVER_IP_WBS = "http://wbs.ksystem.co.kr:8889"
    static let DSN_OPER_WBS = "wbs_oper"
    static let DSN_BIS_WBS = "wbs_bis"
    
    //ylwgn
//    static let LOGIN_SERVER_IP = "http://ylwout.ksystem.co.kr:8585/KSystemSvc/"
//    static let LOGIN_DSN_OPER = "ylwgn_oper"
    //    static let LOGIN_DSN_BIS = "ylwgn_bis"
    
    //gnPackage
    //MobileERPSetting://~,kpackagem_oper~,kpackagem_bis~,http://devout.ksystem.co.kr:8102/KSystemSvc/~,
//    static let LOGIN_SERVER_IP = "http://devout.ksystem.co.kr:8102/KSystemSvc/"
//    static let LOGIN_DSN_OPER = "kpackagem_oper"
//    static let LOGIN_DSN_BIS = "kpackagem_bis"
    
//    영림원_geniTFT
//    MobileERPSetting://~,genitft_oper~,genitft_bis~,http://211.253.14.184/ksystemmobileAppsvc/~,
//    static let DEMO_SERVER_IP = "http://211.253.14.184/ksystemmobileAppsvc/"//"http://115.178.72.187:8585/KsystemSvc/"
//    static let DEMO_DSN_OPER = "genitft_oper"
//    static let DEMO_DSN_BIS = "genitft_bis"
//    static let DEMO_ID = "genitfttest"
//    static let DEMO_PW = "genitft"

    static let DEMO_SERVER_IP = NSLocalizedString("DEMO_SERVER_IP", comment: "http://211.253.14.184/ksystemmobileAppsvc/")
    static let DEMO_DSN_OPER = NSLocalizedString("DEMO_DSN_OPER_S", comment: "genitft_oper")
    static let DEMO_DSN_BIS = NSLocalizedString("DEMO_DSN_BIS_S", comment: "genitft_bis")
    static let DEMO_ID = NSLocalizedString("DEMO_ID_S", comment: "genitfttest")
    static let DEMO_PW = NSLocalizedString("DEMO_PW_S", comment: "genitft")
    static let DEMO_LANGUAGE_SEQ = NSLocalizedString("DEMO_LANGUAGE_SEQ", comment: "1")
    static let LOGIN_SERVER_IP = ""
    static let LOGIN_DSN_OPER = ""
    static let LOGIN_DSN_BIS = ""
}
