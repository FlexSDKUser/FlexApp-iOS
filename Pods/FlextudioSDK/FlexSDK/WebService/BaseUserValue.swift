//
//  BaseUserValue.swift
//  webServiceTest
//
//  Created by 김 희원 on 2015. 9. 25..
//  Copyright (c) 2015년 김 희원. All rights reserved.
//

import UIKit
import JavaScriptCore

@objc protocol BaseUserValueJSExports : JSExport {
    func setBaseUserValueData(_ dsData:DataSet)
}
class BaseUserValue:NSObject, BaseUserValueJSExports {
    
    /** mServerIP : http://wbs.ksystem.co.kr:8889 */
    static var SERVERIP_VALUE = ""
    static var SESSION_ID = ""
    
    static var LanguageSeq:Int = 0// login conn
    static var UserSeq:Int = 0// login conn
    static var CompanySeq:Int = 1// login conn
    static var EmpSeq:Int = 0
    static var SlipUnit:String = ""
    static var AccUnit:String = ""
    
    /* Dsn.. tmp value */
    static var Dsn:String = ""// login conn wbsmdev_oper
    
    static var LoginSeq:String = "0"// login conn
    static var LoginID:String = ""
    static var DeptSeq:String = ""
    static var PosSeq:Int = 1
    static var WkDeptSeq:String = ""
    static var FactUnit:String = ""
    static var BizUnit:String = ""
    static var DsnEsm:String = ""
    static var DsnBpm:String = ""
    static var DsnBis:String = ""// wbsmdev_bis
    static var DsnOper:String = ""// wbsmdev_oper

    static var HostNm:String = "mobile : \(Const.DEVICE_ID)"
    static var HomeDir:String = "1"
    static var HostMacAddress:String = "mobile : \(Const.DEVICE_ID)" //""
    static var HostCPU:String = "mobile : \(Const.DEVICE_ID)" //"1"
    static var HostDeviceType:String = Const.DEVICE_TYPE //"1"
    
    static var PassWord: String = ""
    static var ConnInfoWell: String = ""
    static var SGroupWareType: String = ""
    
    init(dsData:DataSet) {

        super.init()
        setBaseUserValueData(dsData)
        
    }//init
    
    func setBaseUserValueData(_ dsData:DataSet){
        if let m_tables = dsData.m_Tables
        {
            if let table = m_tables.getValueByName("_SCAGetLogin")
            {
                let _SCAGetLoginDtData:DataTable = table
                
                if let m_rows = _SCAGetLoginDtData.m_rows
                {
                    if let row = m_rows.getValueByIndex(0)
                    {
                        if let userSeq = row.getValueByColumnName("UserSeq")
                        {
                            if let intUserSeq = Int(userSeq)
                            {
                                BaseUserValue.UserSeq = intUserSeq
                            }
                        }
                        if let companySeq = row.getValueByColumnName("CompanySeq")
                        {
                            if let intCompanySeq = Int(companySeq)
                            {
                                BaseUserValue.CompanySeq = intCompanySeq
                            }
                        }
                        if let empSeq = row.getValueByColumnName("EmpSeq")
                        {
                            if let intEmpSeq = Int(empSeq)
                            {
                                BaseUserValue.EmpSeq = intEmpSeq
                            }
                        }
                        if let dsn = row.getValueByColumnName("Dsn")
                        {
                            BaseUserValue.Dsn = dsn
                        }
                        if let userType = row.getValueByColumnName("UserType")
                        {
                            if userType == "1001"
                            {
                                if let table = m_tables.getValueByName("_SCOMGetLogin")
                                {
                                    let _SCAGetLoginDtData:DataTable = table
                                    
                                    if let m_rows = _SCAGetLoginDtData.m_rows
                                    {
                                        if let row = m_rows.getValueByIndex(0)
                                        {
                                            if let slipUnit = row.getValueByColumnName("SlipUnit")
                                            {
                                                BaseUserValue.SlipUnit = slipUnit
                                            }
                                            if let accUnit = row.getValueByColumnName("AccUnit")
                                            {
                                                BaseUserValue.AccUnit = accUnit
                                            }
                                            if let deptSeq = row.getValueByColumnName("DeptSeq")
                                            {
                                                BaseUserValue.DeptSeq = deptSeq
                                            }
                                            if let wkDeptSeq = row.getValueByColumnName("WkDeptSeq")
                                            {
                                                BaseUserValue.WkDeptSeq = wkDeptSeq
                                            }
                                            if let factUnit = row.getValueByColumnName("FactUnit")
                                            {
                                                BaseUserValue.FactUnit = factUnit
                                            }
                                            if let bizUnit = row.getValueByColumnName("BizUnit")
                                            {
                                                BaseUserValue.BizUnit = bizUnit
                                            }
                                            if let posSeq = row.getValueByColumnName("PosSeq")
                                            {
                                                if let intPosSeq  = Int(posSeq)
                                                {
                                                    BaseUserValue.PosSeq = intPosSeq
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if let passWord = row.getValueByColumnName("Password") {
                            BaseUserValue.PassWord = passWord
                        }
                        if let connInfoWell = row.getValueByColumnName("ConnInfoWell") {
                            BaseUserValue.ConnInfoWell = connInfoWell
                        }
                    }
                }
            }
            
            if let table = m_tables.getValueByName("_SCOMGetLogin1") {
                let _SCOGetLogin1dtData:DataTable = table
                
                if let m_rows = _SCOGetLogin1dtData.m_rows
                {
                    for i in 0..<m_rows.rows.count {
                        if let row = m_rows.getValueByIndex(i)
                        {
                            let key = Int(row.getValueByColumnName("EnvSeq") ?? "0") ?? 0
                            if let value = row.getValueByColumnName("EnvValue") {
                            switch (key) {
                                case 9001:
                                    BaseUserValue.SGroupWareType = value
                                    break
                            default:
                                    break
                                }
                            }
                        }
                    }
                }
            }
            
            if let table = m_tables.getValueByName("_SCAGetLogin1")
            {
                let _SCAGetLogin1dtData:DataTable = table
                
                let size = m_tables.tables.count
                var exist = false
                
                if let m_columns = _SCAGetLogin1dtData.m_columns
                {
                    exist = m_columns.doesColumnNameExist("LoginSeq")
                }
                
                
                if let m_rows = _SCAGetLogin1dtData.m_rows
                {
                    if size > 1 && exist
                    {
                        if let row = m_rows.getValueByIndex(0)
                        {
                            if let loginSeq = row.getValueByColumnName("LoginSeq")
                            {
                                BaseUserValue.LoginSeq = loginSeq
                            }
                        }
                    }
                    
                    if let row = m_rows.getValueByIndex(0)
                    {
                        if let loginID = row.getValueByColumnName("LoginID")
                        {
                            BaseUserValue.LoginID = loginID
                        }
                    }
                }
            }
            if let table = m_tables.getValueByName("_SCAGetLogin3")
            {
                let _SCAGetLogin3dtData:DataTable = table
                
                if let m_rows = _SCAGetLogin3dtData.m_rows
                {
                    for i in 0..<m_rows.rows.count {
                        if let row = m_rows.getValueByIndex(i)
                        {
                            if let dbType = row.getValueByColumnName("DBType")
                            {
                                if let intDBType = Int(dbType)
                                {
                                    switch(intDBType){
                                        
                                    case 158001 :
                                        if let dsnOper = row.getValueByColumnName("Dsn")
                                        {
                                            BaseUserValue.DsnOper = dsnOper
                                        }
                                        
                                    case 158002 :
                                        if let dsnBis = row.getValueByColumnName("Dsn")
                                        {
                                            BaseUserValue.DsnBis = dsnBis
                                        }
                                        
                                    case 158003 :
                                        if let dsnEsm = row.getValueByColumnName("Dsn")
                                        {
                                            BaseUserValue.DsnEsm = dsnEsm
                                        }
                                        
                                    case 158004 :
                                        if let dsnBpm = row.getValueByColumnName("Dsn")
                                        {
                                            BaseUserValue.DsnBpm = dsnBpm
                                        }
                                        
                                    default :
                                        print("NO SWITCH CASE")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }//tables
        
        BaseUserValue.HostNm = "mobile : \(Const.DEVICE_ID)"//Const.DEVICE_ID////\(UIDevice.currentDevice().identifierForVendor!.UUIDString)"
        BaseUserValue.HostMacAddress = "mobile : \(Const.DEVICE_ID)"

    }
    
    class func setConnInfo(){
        BaseUserValue.SERVERIP_VALUE = SharedPreferenceUtil.getValue(Const.KEY_SERVERIP, dftValue: "")
        BaseUserValue.DsnBis = SharedPreferenceUtil.getValue(Const.LOGIN_DSN_BIS_VALUE, dftValue: "")
        BaseUserValue.DsnOper = SharedPreferenceUtil.getValue(Const.LOGIN_DSN_OPER_VALUE, dftValue: "")
        BaseUserValue.Dsn = SharedPreferenceUtil.getValue(Const.LOGIN_DSN_OPER_VALUE, dftValue: "")
        BaseUserValue.LanguageSeq = SharedPreferenceUtil.getValue(Const.KEY_LANGUAGESEQ, dftValue: 0)
        BaseUserValue.CompanySeq = SharedPreferenceUtil.getValue(Const.LOGIN_COMPANYSEQ_IDX, dftValue: 1)
        //180305 hwon.kim - LoginInfoAndMessageMobileApp 호출파라미터에 아이디값이 없음
        BaseUserValue.LoginID = SharedPreferenceUtil.getValue(Const.LOGIN_ID, dftValue: "")
    }

}//class

    // �� �Լ��� BaseUtil.java �� �̵�
    // public static String getConntionInfo(String dsn) {
    // // 0.dsn | 1.lang | 2.UserSeq | 3.CompanySeq | 4.AccUnit | 5.LoginSeq |
    // // 6.LocalMachineName | 7.LoginID | 8.DsnBis
    // // | 9.(0.DsnBPM / 1.DeptSeq / 2.PosSeq / 3.EmpSeq / 4.WkDeptSeq) /
    // // 5.FactUnit) / 6.BizUnit) / 7.SlipUnit / 8.m_PCHomeDir / 9.m_DsnOper
    // // / 10.m_IsPgmEventSecu / 11.m_IsServiceTimeLog / 12.HostDeviceType /
    // // 13.HostMacAddress / 14.HostCPU ))
    // // | 10.HomeDir |
    //
    // String connInfo = dsn + "|" + LanguageSeq + "|" + UserSeq + "|"
    // + CompanySeq + "|" + AccUnit + "|" + LoginSeq + "|" + HostNm
    // + "|" + LoginID + "|" + DsnBis
    // connInfo += "|" + "" + "/" + DeptSeq + "/" + PosSeq + "/" + EmpSeq
    // + "/" + WkDeptSeq + "/" + FactUnit + "/" + BizUnit + "/"
    // + SlipUnit + "/" + HomeDir.replace("/", "?") + "/" + DsnOper
    // + "/"
    // connInfo += "" + "/" + "" + "/" + "" + "/" + HostMacAddress + "/"
    // + HostCPU + "/"
    //
    // return connInfo
    // }

