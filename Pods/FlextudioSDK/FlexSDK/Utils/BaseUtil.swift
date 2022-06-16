//
//  BaseUtil.swift
//  ExecuteMothodSyncTest
//
//  Created by osbaek on 2015. 9. 7..
//  Copyright (c) 2015년 osbaek. All rights reserved.
//

import Foundation
class BaseUtil {
    static let SP = "~,"
    static let SP_LF = "~I~"
    static let SP_PARAM_DIV = "-,"
    
    static var NumPointType:String = ""
    static var NumSeparatorType:String = ""
    static var DateFormatType:String = ""
    static var DateSeparatorType:String = ""
    
//    class func getConnInfo(_ dsn : String) -> String{
//
//        //    // 0.dsn | 1.lang | 2.UserSeq | 3.CompanySeq | 4.AccUnit | 5.LoginSeq |
//        //    // 6.LocalMachineName | 7.LoginID | 8.DsnBis
//        //    // | 9.(0.DsnBPM / 1.DeptSeq / 2.PosSeq / 3.EmpSeq / 4.WkDeptSeq) /
//        //    // 5.FactUnit) / 6.BizUnit) / 7.SlipUnit / 8.m_PCHomeDir / 9.m_DsnOper
//        //    // / 10.m_IsPgmEventSecu / 11.m_IsServiceTimeLog / 12.HostDeviceType /
//        //    // 13.HostMacAddress / 14.HostCPU ))
//        //    // | 10.HomeDir |
//        
//        let replaceHomeDir = BaseUserValue.HomeDir.replacingOccurrences(of: "/", with: "?", options: NSString.CompareOptions.literal, range: nil)
//        
//        var connInfo : String = "\(dsn)|"
//        connInfo += "\(BaseUserValue.LanguageSeq)|\(BaseUserValue.UserSeq)|\(BaseUserValue.CompanySeq)|\(BaseUserValue.AccUnit)|\(BaseUserValue.LoginSeq)|\(BaseUserValue.HostNm)|\(BaseUserValue.LoginID)|\(BaseUserValue.DsnBis)|"
//        
//        connInfo += "/"
//        connInfo += "\(BaseUserValue.DeptSeq)/\(BaseUserValue.PosSeq)/\(BaseUserValue.EmpSeq)/\(BaseUserValue.WkDeptSeq)/\(BaseUserValue.FactUnit)/\(BaseUserValue.BizUnit)/\(BaseUserValue.SlipUnit)/\(replaceHomeDir)/\(BaseUserValue.DsnOper)/"
//        
//        connInfo += "//\(BaseUserValue.HostDeviceType)/\(BaseUserValue.HostMacAddress)/\(BaseUserValue.HostCPU)/"
//        
//        
//        return connInfo
//    }
    //190225 hwonkim
    //add loginSvcDTO for MobileERPLite
    //we will make param string without BaseUserValue.
    class func getConnInfo(_ loginSvcDTO : LoginSvcDTO, isBis:Bool) -> String{
        
        //    // 0.dsn | 1.lang | 2.UserSeq | 3.CompanySeq | 4.AccUnit | 5.LoginSeq |
        //    // 6.LocalMachineName | 7.LoginID | 8.DsnBis
        //    // | 9.(0.DsnBPM / 1.DeptSeq / 2.PosSeq / 3.EmpSeq / 4.WkDeptSeq) /
        //    // 5.FactUnit) / 6.BizUnit) / 7.SlipUnit / 8.m_PCHomeDir / 9.m_DsnOper
        //    // / 10.m_IsPgmEventSecu / 11.m_IsServiceTimeLog / 12.HostDeviceType /
        //    // 13.HostMacAddress / 14.HostCPU ))
        //    // | 10.HomeDir |
        
        var connInfo : String = "\(isBis ? loginSvcDTO.bis : loginSvcDTO.oper)|"
        connInfo += "\(loginSvcDTO.langSeq)|\(loginSvcDTO.userSeq)|\(loginSvcDTO.companySeq)||0|mobile : \(Const.DEVICE_ID)|\(loginSvcDTO.loginID)|\(loginSvcDTO.bis)|"
        
        connInfo += "/"
        connInfo += "/1/0/////1/\(loginSvcDTO.oper)/"
        
        connInfo += "//\(Const.DEVICE_TYPE)/mobile : \(Const.DEVICE_ID)/mobile : \(Const.DEVICE_ID)/"
        
        
        return connInfo
    }
    
     /*
     class func getOptions(_ workingTag : String, executeSeq : String, pgmMethodSeq : String) -> String{
        let user = UserDefaults.standard
        
        var pgmSeq = ""
        var defaultExecuteSeq = ""
        var defaultPgmMethodSeq = ""
        var eventSeq = ""
        
        if let pgm : AnyObject = user.value(forKey: Const.KEY_PGMSEQ) as AnyObject?
        {
            pgmSeq = pgm as! String
        }
        
        if let execute : AnyObject = user.value(forKey: Const.EXECUTE_SEQ) as AnyObject?
        {
            defaultExecuteSeq = execute as! String
        }
        
        if let method : AnyObject = user.value(forKey: Const.PGM_METHOD_SEQ) as AnyObject?
        {
            defaultPgmMethodSeq = method as! String
        }
        
        if let event : AnyObject = user.value(forKey: Const.EVENT_SEQ) as AnyObject?
        {
            eventSeq = event as! String
        }

            // String pgmSeq = "501565";
            // String prefExecuteSeq = "0";
            // String prefPgmMethodSeq = "0";
            // String eventSeq = "0";
        
        //TODO: make default where
        //    String where = Util.makeDefaultWhere(defaultSqlArr);
        var key_serverIP = BaseUserValue.SERVERIP_VALUE
        var key_dsn = BaseUserValue.DsnBis
        var key_pgmSeq = pgmSeq
        var key_languageSeq = String(BaseUserValue.LanguageSeq)
        
        if let serverIP : AnyObject = user.value(forKey: Const.KEY_SERVERIP) as AnyObject?
        {
            key_serverIP = serverIP as! String
        }
        
        if let dsn : AnyObject = user.value(forKey: Const.KEY_DSN) as AnyObject?
        {
            key_dsn = dsn as! String
        }
        
        if let pgm : AnyObject = user.value(forKey: Const.KEY_PGMSEQ) as AnyObject?
        {
            key_pgmSeq = pgm as! String
        }
        
        if let languageSeq : AnyObject = user.value(forKey: Const.KEY_LANGUAGESEQ) as AnyObject?
        {
            key_languageSeq = languageSeq as! String
        }
        
        let whereStr = "key_serverIP = '\(key_serverIP)' AND key_dsn = '\(key_dsn)' AND key_pgmSeq = '\(key_pgmSeq)' AND key_languageSeq = '\(key_languageSeq)'"
        
        let sqlHandler = YLWSqlHandler()
        let selectResult = sqlHandler.selectInConditionOf(TableConstants.FormInfoTable, whereStr: whereStr)
        
        var xmlFlag = ""
        var loginPgmSeq = ""
        
        for row in selectResult {

            if let flag = row["XmlFlag"]
            {
                xmlFlag = flag
            }
            if let seq = row["LoginPgmSeq"]
            {
                loginPgmSeq = seq
            }
            
//            for unit in row
//            {
//                if let flag = unit["XmlFlag"]
//                {
//                    xmlFlag = flag
//                }
//                if let seq = unit["LoginPgmSeq"]
//                {
//                    loginPgmSeq = seq
//                }
//            }
        }
        let opStr = "\(pgmSeq)|\(workingTag)|\(xmlFlag)|30|\(loginPgmSeq)|\(defaultExecuteSeq)|\(defaultPgmMethodSeq)||FALSE|\(eventSeq)|1|"
        
        return opStr
    }
  */
    
//   class func getLoginPgmSeq()->String{
//        let user = UserDefaults.standard
//        
//        var pgmSeq = ""
//
//        if let pgm : AnyObject = user.value(forKey: Const.KEY_PGMSEQ) as AnyObject?
//        {
//            pgmSeq = pgm as! String
//        }
//        
//        var key_serverIP = BaseUserValue.SERVERIP_VALUE
//        var key_dsn = BaseUserValue.DsnBis
//        var key_pgmSeq = pgmSeq
//        var key_languageSeq = String(BaseUserValue.LanguageSeq)
//        
//        if let serverIP : AnyObject = user.value(forKey: Const.KEY_SERVERIP) as AnyObject?
//        {
//            key_serverIP = serverIP as! String
//        }
//        
//        if let dsn : AnyObject = user.value(forKey: Const.KEY_DSN) as AnyObject?
//        {
//            key_dsn = dsn as! String
//        }
//        
//        if let pgm : AnyObject = user.value(forKey: Const.KEY_PGMSEQ) as AnyObject?
//        {
//            key_pgmSeq = pgm as! String
//        }
//        
//        if let languageSeq : AnyObject = user.value(forKey: Const.KEY_LANGUAGESEQ) as AnyObject?
//        {
//            key_languageSeq = languageSeq as! String
//        }
//        
//        let whereStr = "key_serverIP = '\(key_serverIP)' AND key_dsn = '\(key_dsn)' AND key_pgmSeq = '\(key_pgmSeq)' AND key_languageSeq = '\(key_languageSeq)'"
//        
//        let sqlHandler = YLWSqlHandler()
//        let selectResult = sqlHandler.selectInConditionOf(TableConstants.FormInfoTable, whereStr: whereStr)
//        
//        var loginPgmSeq = ""
//        
//        for row in selectResult {
//            if let seq = row["LoginPgmSeq"]
//            {
//                loginPgmSeq = seq
//            }
//        }
//        return loginPgmSeq
//    }

}


