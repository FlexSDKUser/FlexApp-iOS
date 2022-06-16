//
//  BaseFormClass.swift
//  webServiceTest
//
//  Created by 김 희원 on 2015. 9. 23..
//  Copyright (c) 2015년 김 희원. All rights reserved.
//

import UIKit
import ObjectMapper
class BaseFormClass: NSObject, Mappable, BaseFormClassJSDelegate {
//    private static final long serialVersionUID = 1985269050139398811L;
    let serialVersionUID:UInt64 = 1985269050139398811

    var isOpened : Bool = false
    
    var mAccUnit : String = ""
    
    var mAccUnitName : String = ""
    
    var mCompanyName : String = ""
    
    var mCompanySeq : Int = 1
    
    var mDevCustSeq : Int = 0
    
    var mDsn : String = ""
    
    var mEMail : String = ""
    
    var mEmpId : String = ""
    
    var mEmpName : String = ""
    
    var mEmpSeq : Int = 0
    
    var mJpName : String = ""
    
    var mLanguageSeq : Int = 0
    
    var mLoginDate : String = ""
    
    var mLoginDateDay : Int = 0
    
    var mLoginDateMonth : Int = 0
    
    var mLoginDateTime : String = ""
    
    var mLoginDateYear : Int = 0
    
    var mPassword : String = ""
    
    var mSiteInit : String = ""
    
    var mSlipUnit : String = ""
    
    var mSlipUnitName : String = ""
    
    var mSMUserType : Int = 0
    
    var mUserID : String = ""
    
    var mUserName : String = ""
    
    var mUserSeq : Int = 0
    
    var mConnInfo : String = "" // (BaseFormFramework)
    
    var mMessage : String = ""// _SCAGetLogin5
    
    var mBgtUnit : String = ""
    
    var mBizUnit : String = ""
    
    var mBizUnitName : String = ""
    
    var mCustName : String = ""
    
    var mCustSeq : Int = 0
    
    var mDeptName : String = ""
    
    var mDeptSeq : String = ""
    
    var mFactUnit : String = ""
    
    var mHPNo : String = ""
    
    var mPosName : String = ""
    
    var mPosSeq : Int = 0
    
    var mPuName : String = ""
    
    var mPuSeq : Int = 0
    
    var mTaxName : String = ""
    
    var mTaxUnit : String = ""
    
    var mUMCostType : String = ""
    
    var mUMCostTypeName : String = ""
    
    var mWkDeptName : String = ""
    
    var mWkDeptSeq : String = ""
    
    /* _SCAGetLogin1dtData */
    
    var mLoginSeq : String = ""

    var mLoginID : String = ""

    /* _SCAGetLogin3DtData */
    
    var mDsnOper : String = ""

    var mDsnBis : String = ""

    var mDsnEsm : String = ""

    var mDsnBpm : String = ""

    /* _SCOMGetLogin1DtData */
    
    var mENV_Nation : String = ""

    var mENV_SiteInit : String = ""

    var mENV_CustomsTariff : Double = 0

    var mENV_DecLenBOM : Int = 0

    var mENV_DecLenMatQty : Int = 0

    var mENV_DecLenMatCost : Int = 0

    var mENV_DecLenMatCostFor : Int = 0

    var mENV_DecLenGoodsQty : Int = 0

    var mENV_DecLenGoodsCost : Int = 0

    var mENV_DecLenGoodsCostFor : Int = 0

    var mENV_DecLenExcRate : Int = 0

    var mENV_BasicForCurr : Int = 0

    var mENV_BasicForCurrName : String = ""

    var mENV_BasicKorCurr : Int = 0

    var mENV_BasicKorCurrName : String = ""

    var mENV_DecLenFOR : Int = 0

    var mENV_DecLenKOR : Int = 0

    var mENV_DecLenCostDivRate : Int = 0

    var mReportDefSwitch : String = ""

    var mGroupWareUse : Bool = false

    var mENV_DecLenManHour : Int = 0

    /* number&date set */
    
    var mNumPointType : String = ""

    var mNumSeparatorType : String = ""

    var mDateFormatType : String = ""

    var mDateSeparatorType : String = ""

    var mIsPgmEventSecu : String = ""

    var mIsServiceTimeLog : String = ""

    //Data.DataSet getter setter 없음
    var mPgmId : String = ""
    
    var mPgmSeq : Int = 0
    
    var mActiveSheetControlName : String = ""
    // (BaseFormFramework)
    
    var mHomeDir : String = ""
    
    var mIsJumpEventCancel : Bool = false//(BaseFormFramework)
    
    var mIsJumpInCancel_CloseButtonClick : Bool = false
    // (BaseFormFramework)
    
    var mIsOpen : Bool = false//(BaseFormFramework)
    
    //not use
//    var JumpDs : Data.DataSet = Data.DataSet()//(BaseFormFramework)
    
    var mPgmMethodEventCancel : Bool = false //(BaseFormFramework)
    
    //not use
    var CodeHelpData : DataSet? //= DataSet() //(BaseFormFramework)
    
    // public XmlData PgmSendXml
    
    var mJumpPgmId : String = ""//(BaseFormFramework)
    
    var mJumpPgmSeq : String = ""//(BaseFormFramework)
    
    var mLinkCreateID : String = "" //(BaseFormFramework)
    
    var mRemoteAddress : String = ""//(BaseFormFramework)
    
    var mJumpType : String = ""//(BaseFormFramework)
    
    var mPgmMethodSeq : Int = 0//(BaseFormFramework)
    
    var mServiceAffair : Int = 0//(BaseFormFramework)
    
    // public DataTable TimeOut
    
    var mFactUnitName : String = ""
    
    var mBgtUnitName : String = ""
    
//    public Context context;
    
    //osbaek. _base.setProgTableSeq error when progressjump
    var mProgTableSeq : Int = 0
    
    // 16.12.05 hwon.kim
    var mLocation : String = ""
    var mLatitude : String = ""
    var mLongitude : String = ""
    
    // 17.07.05 hwon.kim
    var barCodeString : String = ""
    
    //17.07.17 hwon.kim
    var ProductType = "0"
    
    //17.08.30 hwon.kim
    var WebViewResultString = ""
    
    //17.12.11 hwon.kim
    var fileServerDir = ""
    
    // 전자결재 종류
    var SGroupWareType = ""
    
    var url = ""
    
    var session = ""
    
    func setUrl(url: String) {
        self.url = url
    }
    
    func getUrl() -> String {
        return url
    }
    
    func setSession(session: String) {
        self.session = session
    }
    
    func getSession() -> String {
        return session
    }
    
    //17.12.11 hwon.kim
    func getFileServerDir()->String {
        return fileServerDir
    }
    func setFileServerDir(fileServerDir:String) {
        self.fileServerDir = fileServerDir
    }
    
    //17.08.30 hwon.kim
    func getWebViewResultString()->String {
        return WebViewResultString
    }
    func setWebViewResultString(webViewResultString:String) {
        self.WebViewResultString = webViewResultString
    }
    
    //17.07.17 hwon.kim
    func getProductType()->String {
        return ProductType
    }
    func setProductType(productType:String) {
        self.ProductType = productType
    }
    
    // 17.07.05 hwon.kim
    func getBarCodeString()->String{
        return barCodeString
    }
    func setBarCodeString(barCodeString:String){
        self.barCodeString = barCodeString
    }
    //170329 hwon.kim
    func getCurrTime()->String{
        let nsDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let date = dateFormatter.string(from: nsDate)
        
        return date
    }
    // 170620 osbaek added, dpjang request.
    // DeviceType : PHONE, PDA
    var mDeviceType = ""
//    func getDeviceType() -> String{
//    return mDeviceType
//    }
    // DeviceType: PDA, PHONE ...
    func getDeviceType() -> String{
        return "PHONE"
    }
    func setDeviceType(DeviceType: String){
        mDeviceType = DeviceType
    }
    // OS: Android, iOS
    func getOSType() -> String{
        return "IOS"
    }
    func setMobileLocation(_ location:String){
        mLocation = location
    }
    func getMobileLocation()->String{
        return mLocation
    }
    func setMobileLatitude(_ latitude:String){
        mLatitude = latitude
    }
    func getMobileLatitude()->String{
        return mLatitude
    }
    func setMobileLongitude(_ longitude:String){
        mLongitude = longitude
    }
    func getMobileLongitude()->String{
        return mLongitude
    }
    
    func setProgTableSeq(_ seq: Int) {
        mProgTableSeq = seq
    }
    func getProgTableSeq() -> Int {
        return mProgTableSeq
    }
    func getCurrDate() -> String {
        
        let nsDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: nsDate)
        print("getCurrDate : \(date)")
        return date
    }
    func setLoginResultDataSet(_ dsData : DataSet) {
        if let m_Tables = dsData.m_Tables
        {
            if let table = m_Tables.getValueByName("_SCAGetLogin")
            {
                let _SCAGetLoginDtData : DataTable = table
                if let m_rows = _SCAGetLoginDtData.m_rows
                {
                    if let row = m_rows.getValueByIndex(0)
                    {
                        //17.12.11 hwon.kim
                        if let fileServerDir = row.getValueByColumnName("FileServerDir") {
                            self.fileServerDir = fileServerDir
                        }
                        //17.07.17 hwon.kim
                        if let productType = row.getValueByColumnName("ProductType") {
                            ProductType = productType
                        }
                        if let userID = row.getValueByColumnName("UserId")
                        {
                            mUserID = userID
                        }
                        if let userName = row.getValueByColumnName("UserName")
                        {
                            mUserName = userName
                        }
                        if let userSeq = row.getValueByColumnName("UserSeq")
                        {
                            if let intUserSeq = Int(userSeq)
                            {
                                mUserSeq = intUserSeq
                            }
                        }
                        if let password = row.getValueByColumnName("Password")
                        {
                            mPassword = password
                        }
                        if let email = row.getValueByColumnName("EMail")
                        {
                            mEMail = email
                        }
                        if let jpName = row.getValueByColumnName("JpName")
                        {
                            mJpName = jpName
                        }
                        if let empSeq = row.getValueByColumnName("EmpSeq")
                        {
                            if let intEmpSeq = Int(empSeq)
                            {
                                mEmpSeq = intEmpSeq
                            }
                        }
                        if let empId = row.getValueByColumnName("EmpId")
                        {
                            mEmpId = empId
                        }
                        //
                        if let loginDateTime = row.getValueByColumnName("LoginDateTime")
                        {
                            mLoginDateTime = loginDateTime
                        }
                        // 17.05.18 hwon.kim
//                        if let loginDate = row.getValueByColumnName("LoginDate")
//                        {
//                            mLoginDate = loginDate
//                        }
                        if let loginDate = row.getValueByColumnName("Solar")
                        {
                            mLoginDate = loginDate
                        }
                        if let empName = row.getValueByColumnName("EmpName")
                        {
                            mEmpName = empName
                        }
                        if let accUnit = row.getValueByColumnName("AccUnit")
                        {
                            mAccUnit = accUnit
                        }
                        if let accUnitName = row.getValueByColumnName("AccUnitName")
                        {
                            mAccUnitName = accUnitName
                        }
                        if let slipUnit = row.getValueByColumnName("SlipUnit")
                        {
                            mSlipUnit = slipUnit
                        }
                        if let slipUnitName = row.getValueByColumnName("SlipUnitName")
                        {
                            mSlipUnitName = slipUnitName
                        }
                        if let companySeq = row.getValueByColumnName("CompanySeq")
                        {
                            if let intCompanySeq = Int(companySeq)
                            {
                                mCompanySeq = intCompanySeq
                            }
                        }
                        if let companyName = row.getValueByColumnName("CompanyName")
                        {
                            mCompanyName = companyName
                        }
                        if let devCustSeq = row.getValueByColumnName("DevCustSeq")
                        {
                            if let intDevCustSeq = Int(devCustSeq)
                            {
                                mDevCustSeq = intDevCustSeq
                            }
                        }
                        if let languageSeq = row.getValueByColumnName("LanguageSeq")
                        {
                            if let intLanguageSeq = Int(languageSeq)
                            {
                                mLanguageSeq = intLanguageSeq
                            }
                        }
                        // 17.05.18 hwon.kim
                        // 삼진제약 수주입력(직납) 처음 담당자가 master일때 거래처 코드헬프 조회안됨
//                        if let deptSeq = row.getValueByColumnName("DeptSeq")
//                        {
//                            mDeptSeq = deptSeq
//                        }
//                        if let deptName = row.getValueByColumnName("DeptName")
//                        {
//                            mDeptName = deptName
//                        }
//                        if let wkDeptSeq = row.getValueByColumnName("WkDeptSeq")
//                        {
//                            mWkDeptSeq = wkDeptSeq
//                        }
//                        if let wkDeptSeq = row.getValueByColumnName("WkDeptName")
//                        {
//                            mWkDeptName = wkDeptSeq
//                        }
//                        if let hpNo = row.getValueByColumnName("HPNo")
//                        {
//                            mHPNo = hpNo
//                        }
                        if let siteInit = row.getValueByColumnName("SiteInit")
                        {
                            mSiteInit = siteInit
                        }
                        if let dsn = row.getValueByColumnName("Dsn")
                        {
                            mDsn = dsn
                        }
                        if let smUserType = row.getValueByColumnName("SMUserType")
                        {
                            if let intSMUserType = Int(smUserType)
                            {
                                mSMUserType = intSMUserType
                            }
                        }
                        if let loginDateDay = row.getValueByColumnName("SDay")
                        {
                            if let intLoginDateDay = Int(loginDateDay)
                            {
                                mLoginDateDay = intLoginDateDay
                            }
                        }
                        if let loginDateMonth = row.getValueByColumnName("SMONth")
                        {
                            if let intLoginDateMonth = Int(loginDateMonth)
                            {
                                mLoginDateMonth = intLoginDateMonth
                            }
                        }
                        if let loginDateYear = row.getValueByColumnName("SYear")
                        {
                            if let intLoginDateYear = Int(loginDateYear)
                            {
                                mLoginDateYear = intLoginDateYear
                            }
                        }
                        if let bgtUnit = row.getValueByColumnName("BgtUnit")
                        {
                            mBgtUnit = bgtUnit
                        }
                        
                        if let userType = row.getValueByColumnName("UserType")
                        {
                            if userType == "1001" // 1001 내부사용자 / 1002 외부사용자
                            {
                                if let table = m_Tables.getValueByName("_SCOMGetLogin")
                                {
                                    let _SCOMGetLoginDtData : DataTable = table
                                    
                                    if let m_rows = _SCOMGetLoginDtData.m_rows
                                    {
                                        if let scom_row = m_rows.getValueByIndex(0)
                                        {
                                            if let accUnit = scom_row.getValueByColumnName("AccUnit")
                                            {
                                                mAccUnit = accUnit
                                            }
                                            if let accUnitName = scom_row.getValueByColumnName("AccUnitName")
                                            {
                                                mAccUnitName = accUnitName
                                            }
                                            if let bizUnit = scom_row.getValueByColumnName("BizUnit")
                                            {
                                                mBizUnit = bizUnit
                                            }
                                            if let bizUnitName = scom_row.getValueByColumnName("BizUnitName")
                                            {
                                                mBizUnitName = bizUnitName
                                            }
                                            if let slipUnit = scom_row.getValueByColumnName("SlipUnit")
                                            {
                                                mSlipUnit = slipUnit
                                            }
                                            if let slipUnitName = scom_row.getValueByColumnName("SlipUnitName")
                                            {
                                                mSlipUnitName = slipUnitName
                                            }
                                            if let factUnit = scom_row.getValueByColumnName("FactUnit")
                                            {
                                                mFactUnit = factUnit
                                            }
                                            if let factUnitName = scom_row.getValueByColumnName("FactUnitName")
                                            {
                                                mFactUnitName = factUnitName
                                            }
                                            if let umCostType = scom_row.getValueByColumnName("UMCostType")
                                            {
                                                mUMCostType = umCostType
                                            }
                                            if let umCostTypeName = scom_row.getValueByColumnName("UMCostTypeName")
                                            {
                                                mUMCostTypeName = umCostTypeName
                                            }
                                            if let deptSeq = scom_row.getValueByColumnName("DeptSeq")
                                            {
                                                mDeptSeq = deptSeq
                                            }
                                            if let deptName = scom_row.getValueByColumnName("DeptName")
                                            {
                                                mDeptName = deptName
                                            }
                                            if let wkDeptSeq = scom_row.getValueByColumnName("WkDeptSeq")
                                            {
                                                mWkDeptSeq = wkDeptSeq
                                            }
                                            if let wkDeptName = scom_row.getValueByColumnName("WkDeptName")
                                            {
                                                mWkDeptName = wkDeptName
                                            }
                                            if let puSeq = scom_row.getValueByColumnName("PuSeq")
                                            {
                                                if let intPuSeq = Int(puSeq)
                                                {
                                                    mPuSeq = intPuSeq
                                                }
                                            }
                                            if let puName = scom_row.getValueByColumnName("PuName")
                                            {
                                                mPuName = puName
                                            }
                                            if let posSeq = scom_row.getValueByColumnName("PosSeq")
                                            {
                                                if let intPosSeq = Int(posSeq)
                                                {
                                                    mPosSeq = intPosSeq
                                                }
                                            }
                                            if let posName = scom_row.getValueByColumnName("PosName")
                                            {
                                                mPosName = posName
                                            }
                                            if let custName = scom_row.getValueByColumnName("CustName")
                                            {
                                                mCustName = custName
                                            }
                                            if let custSeq = scom_row.getValueByColumnName("CustSeq")
                                            {
                                                if let intCustSeq = Int(custSeq)
                                                {
                                                    mCustSeq = intCustSeq
                                                }
                                            }
                                            if let taxUnit = scom_row.getValueByColumnName("TaxUnit")
                                            {
                                                mTaxUnit = taxUnit
                                            }
                                            if let taxName = scom_row.getValueByColumnName("TaxName")
                                            {
                                                mTaxName = taxName
                                            }
                                            if let hpNo = scom_row.getValueByColumnName("HPNo")
                                            {
                                                mHPNo = hpNo
                                            }
                                            if let bgtUnitName = scom_row.getValueByColumnName("BgtUnitName")
                                            {
                                                mBgtUnitName = bgtUnitName
                                            }
                                        }//_SCOMGetLogin m_row.getindex0
                                    }//_SCOMGetLogin m_rows
                                }//m_tables.getvaluebyname _SCOMGetLogin
                            }//user type 1001
                            // 16.04.06 dpjang Outer user.. 1002
                            // 17.05.18 hwon.kim
                            else if userType == "1002"
                            {
                                if let table = m_Tables.getValueByName("_SCOMGetLogin")
                                {
                                    let _SCOMGetLoginDtData : DataTable = table
                                    
                                    if let m_rows = _SCOMGetLoginDtData.m_rows
                                    {
                                        if let scom_row = m_rows.getValueByIndex(0)
                                        {
                                            if let custName = scom_row.getValueByColumnName("CustName")
                                            {
                                                mCustName = custName
                                            }
                                            if let custSeq = scom_row.getValueByColumnName("CustSeq")
                                            {
                                                if let intCustSeq = Int(custSeq)
                                                {
                                                    mCustSeq = intCustSeq
                                                }
                                            }
                                        }//_SCOMGetLogin m_row.getindex0
                                    }//_SCOMGetLogin m_rows
                                }//m_tables.getvaluebyname _SCOMGetLogin
                            }//user type 1002
                        }//user type
                    }//scagetlogin m_row.getindex0
                }//scagetlogin m_rows
            }//m_tables.getvaluebyname scagetlogin
            if let table = m_Tables.getValueByName("_SCAGetLogin1")
            {
                let _SCAGetLogin1dtData : DataTable = table
                if let m_columns = _SCAGetLogin1dtData.m_columns
                {
                    if (m_Tables.tables.count > 1) && m_columns.doesColumnNameExist("LoginSeq")
                    {
                        if let m_rows = _SCAGetLogin1dtData.m_rows
                        {
                            if let row = m_rows.getValueByIndex(0)
                            {
                                if let loginSeq = row.getValueByColumnName("LoginSeq")
                                {
                                    mLoginSeq = loginSeq
                                }
                            }
                        }
                    }
                }
                if let m_rows = _SCAGetLogin1dtData.m_rows
                {
                    if let row = m_rows.getValueByIndex(0)
                    {
                        if let loginID = row.getValueByColumnName("LoginID")
                        {
                            mLoginID = loginID
                        }
                    }
                }//m_rows
            }//m_tabls.getvaluebyname scagetlogin1
            if let table = m_Tables.getValueByName("_SCAGetLogin3")
            {
                let _SCAGetLogin3dtData : DataTable = table
    
                if let m_rows = _SCAGetLogin3dtData.m_rows
                {
                    if let row = m_rows.getValueByIndex(0)
                    {
                        if let dbType = row.getValueByColumnName("DBType")
                        {
                            if let intDBType = Int(dbType)
                            {
                                switch (intDBType){
                                    
                                case 158001 :
                                    if let dsnOper = row.getValueByColumnName("DSN")
                                    {
                                        mDsnOper = dsnOper
                                    }
                                
                                case 158002 :
                                    if let dsnBis = row.getValueByColumnName("DSN")
                                    {
                                        mDsnBis = dsnBis
                                    }
                                case 158003 :
                                    if let dsnEsm = row.getValueByColumnName("DSN")
                                    {
                                        mDsnEsm = dsnEsm
                                    }
                                    
                                case 158004 :
                                    if let dsnBpm = row.getValueByColumnName("DSN")
                                    {
                                        mDsnBpm = dsnBpm
                                    }
                                    
                                default :
                                    print("no DSN")
                                }
                            }
                        }
                    }
                }//m_rows
            }//m_tabls.getvaluebyname scagetlogin3
            if let table = m_Tables.getValueByName("_SCOMGetLogin1")
            {
                let _SCOMGetLogin1DtData : DataTable = table
                if let m_rows = _SCOMGetLogin1DtData.m_rows
                {
                    for i in 0..<m_rows.rows.count {
                        if let row = m_rows.getValueByIndex(i)
                        {
                            if let envSeq = row.getValueByColumnName("EnvSeq")
                            {
                                if let intEnvSeq = Int(envSeq)
                                {
                                    if let envValue = row.getValueByColumnName("EnvValue")
                                    {
                                        switch (intEnvSeq) {
                                        
                                        case 1 :
                                            mENV_Nation = envValue
                                            
                                        case 2 :
                                            mENV_SiteInit = envValue
                                            
                                        case 3 :
                                            if let intEnvValue = NumberFormatter().number(from: envValue)
                                            {
                                                mENV_CustomsTariff = intEnvValue.doubleValue
                                            }
                                            
                                        case 4 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenBOM = intEnvValue
                                            }
                                            
                                        case 5 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenMatQty = intEnvValue
                                            }
                                            
                                        case 6 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenMatCost = intEnvValue
                                            }
                                            
                                        case 7 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenMatCostFor = intEnvValue
                                            }
                                            
                                        case 8 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenGoodsQty = intEnvValue
                                            }
                                            
                                        case 9 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenGoodsCost = intEnvValue
                                            }
                                            
                                        case 10 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenGoodsCostFor = intEnvValue
                                            }
                                            
                                        case 11 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenExcRate = intEnvValue
                                            }
                                            
                                            
                                        case 12 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_BasicForCurr = intEnvValue
                                            }
                                            if let currName = row.getValueByColumnName("CurrName")
                                            {
                                                mENV_BasicForCurrName = currName
                                            }
                                            
                                        case 13 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_BasicKorCurr = intEnvValue
                                            }
                                            if let currName = row.getValueByColumnName("CurrName")
                                            {
                                                mENV_BasicKorCurrName = currName
                                            }
                                            
                                        case 14 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenFOR = intEnvValue
                                            }
                                            
                                        case 15 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenKOR = intEnvValue
                                            }
                                            
                                        case 5526 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenCostDivRate = intEnvValue
                                            }
                                            
                                        case 9001 :
                                            SGroupWareType = envValue
                                            
                                        case 9013 :
                                            mReportDefSwitch = envValue
                                            
                                        case 7002 :
                                            if let intEnvValue = Int(envValue)
                                            {
                                                mENV_DecLenManHour = intEnvValue
                                            }
                                        //TODO: BaseUtil.NumberPointType?
                                        case 9014 :
                                            if envValue == ""
                                            {
                                                //BaseUtil.NumPointType = this.NumPointType = "."
                                                mNumPointType = "."
                                            }
                                            else
                                            {
                                                //BaseUtil.NumPointType = this.NumPointType = value.toString()
                                                mNumPointType = envValue
                                            }
                                            
                                            //TODO: BaseUtil.NumSeparatorType?
                                        case 9015 :
                                            if envValue == ""
                                            {
                                                //BaseUtil.NumSeparatorType = this.NumSeparatorType = ","
                                                mNumSeparatorType = ","
                                            }
                                            else
                                            {
                                                //BaseUtil.NumSeparatorType = this.NumSeparatorType = value.toString()
                                                mNumSeparatorType = envValue
                                            }
                                            
                                            //TODO: BaseUtil.DateFormatType?
                                        case 9017 :
                                            if let minorValue = row.getValueByColumnName("MinorValue")
                                            {
                                                //BaseUtil.DateFormatType = this.DateFormatType = minorValue
                                                mDateFormatType = minorValue
                                            }
                                            
                                            //TODO: BaseUtil.DateSeparatorType?
                                        case 9018 :
                                            if let minorValue = row.getValueByColumnName("MinorValue")
                                            {
                                                if minorValue == ""
                                                {
                                                    //BaseUtil.DateSeparatorType = this.DateSeparatorType = "-"
                                                    mDateSeparatorType = "-"
                                                }
                                                else
                                                {
                                                    //BaseUtil.DateSeparatorType = this.DateSeparatorType = minorValue
                                                    mDateSeparatorType = minorValue
                                                }
                                            }
                                            
                                        case 9019 :
                                            mIsPgmEventSecu = envValue
                                            
                                        case 9020 :
                                            mIsServiceTimeLog = envValue
                                            
                                        case 9101 :
                                            print("case 9101")

                                        default :
                                            print("no switch")
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }//dsData.m_tables
    }//func
    func getDefaultDate() -> String {
        
        let nsDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmm"
        let date = dateFormatter.string(from: nsDate)

        return date
    }
    
    func getLoginSeq() -> String {
        return mLoginSeq
    }
    func setLoginSeq(_ loginSeq:String){
        mLoginSeq = loginSeq
    }
    
    func getLoginID() -> String {
        return mLoginID
    }
    func setLoginID(_ loginID:String){
        mLoginID = loginID
    }
    
    func getDsnOper() -> String {
        return mDsnOper
    }
    func setDsnOper(_ dsnOper:String){
        mDsnOper = dsnOper
    }
    
    func getDsnBis() -> String {
        return mDsnBis
    }
    func setDsnBis(_ dsnBis:String){
        mDsnBis = dsnBis
    }
    
    func getDsnEsm() -> String {
        return mDsnEsm
    }
    func setDsnEsm(_ dsnEsm:String){
        mDsnEsm = dsnEsm
    }
    
    func getDsnBpm() -> String {
        return mDsnBpm
    }
    func setDsnBpm(_ dsnBpm:String){
        mDsnBpm = dsnBpm
    }
    
    func getENV_Nation() -> String {
        return mENV_Nation
    }
    func setENV_Nation(_ ENV_Nation:String){
        mENV_Nation = ENV_Nation
    }
    
    func getENV_SiteInit() -> String {
        return mENV_SiteInit
    }
    func setENV_SiteInit(_ ENV_SiteInit:String){
        mENV_SiteInit = ENV_SiteInit
    }
    
    func getENV_CustomsTariff() -> Double {
        return mENV_CustomsTariff
    }
    func setENV_CustomsTariff(_ ENV_CustomsTariff:Double){
        mENV_CustomsTariff = ENV_CustomsTariff
    }
    
    func getENV_DecLenBOM() -> Int {
        return mENV_DecLenBOM
    }
    func setENV_DecLenBOM(_ ENV_DecLenBOM:Int){
        mENV_DecLenBOM = ENV_DecLenBOM
    }
    
    func getENV_DecLenMatQty() -> Int {
        return mENV_DecLenMatQty
    }
    func setENV_DecLenMatQty(_ ENV_DecLenMatQty:Int){
        mENV_DecLenMatQty = ENV_DecLenMatQty
    }
    
    func getENV_DecLenMatCost() -> Int {
        return mENV_DecLenMatCost
    }
    func setENV_DecLenMatCost(_ ENV_DecLenMatCost:Int){
        mENV_DecLenMatCost = ENV_DecLenMatCost
    }
    
    func getENV_DecLenMatCostFor() -> Int {
        return mENV_DecLenMatCostFor
    }
    func setENV_DecLenMatCostFor(_ ENV_DecLenMatCostFor:Int){
        mENV_DecLenMatCostFor = ENV_DecLenMatCostFor
    }
    
    func getENV_DecLenGoodsQty() -> Int {
        return mENV_DecLenGoodsQty
    }
    func setENV_DecLenGoodsQty(_ ENV_DecLenGoodsQty:Int){
        mENV_DecLenGoodsQty = ENV_DecLenGoodsQty
    }
    
    func getENV_DecLenGoodsCost() -> Int {
        return mENV_DecLenGoodsCost
    }
    func setENV_DecLenGoodsCost(_ ENV_DecLenGoodsCost:Int){
        mENV_DecLenGoodsCost = ENV_DecLenGoodsCost
    }
    
    func getENV_DecLenGoodsCostFor() -> Int {
        return mENV_DecLenGoodsCostFor
    }
    func setENV_DecLenGoodsCostFor(_ ENV_DecLenGoodsCostFor:Int){
        mENV_DecLenGoodsCostFor = ENV_DecLenGoodsCostFor
    }
    
    func getENV_DecLenExcRate() -> Int {
        return mENV_DecLenExcRate
    }
    func setENV_DecLenExcRate(_ ENV_DecLenExcRate:Int){
        mENV_DecLenExcRate = ENV_DecLenExcRate
    }
    
    func getENV_BasicForCurr() -> Int {
        return mENV_BasicForCurr
    }
    func setENV_BasicForCurr(_ ENV_BasicForCurr:Int){
        mENV_BasicForCurr = ENV_BasicForCurr
    }
    
    func getENV_BasicForCurrName() -> String {
        return mENV_BasicForCurrName
    }
    func setENV_BasicForCurrName(_ ENV_BasicForCurrName:String){
        mENV_BasicForCurrName = ENV_BasicForCurrName
    }
    
    func getENV_BasicKorCurr() -> Int {
        return mENV_BasicKorCurr
    }
    func setENV_BasicKorCurr(_ ENV_BasicKorCurr:Int){
        mENV_BasicKorCurr = ENV_BasicKorCurr
    }
    
    func getENV_BasicKorCurrName() -> String {
        return mENV_BasicKorCurrName
    }
    func setENV_BasicKorCurrName(_ ENV_BasicKorCurrName:String){
        mENV_BasicKorCurrName = ENV_BasicKorCurrName
    }
    
    func getENV_DecLenFOR() -> Int {
        return mENV_DecLenFOR
    }
    func setENV_DecLenFOR(_ ENV_DecLenFOR:Int){
        mENV_DecLenFOR = ENV_DecLenFOR
    }
    
    func getENV_DecLenKOR() -> Int {
        return mENV_DecLenKOR
    }
    func setENV_DecLenKOR(_ ENV_DecLenKOR:Int){
        mENV_DecLenKOR = ENV_DecLenKOR
    }
    
    func getENV_DecLenCostDivRate() -> Int {
        return mENV_DecLenCostDivRate
    }
    func setENV_DecLenCostDivRate(_ ENV_DecLenCostDivRate:Int){
        mENV_DecLenCostDivRate = ENV_DecLenCostDivRate
    }
    
    func getReportDefSwitch() -> String {
        return mReportDefSwitch
    }
    
    func setReportDefSwitch(_ reportDefSwitch : String) {
         mReportDefSwitch = reportDefSwitch
    }
    
    func isGroupWareUse() -> Bool {
        return mGroupWareUse
    }
    func setGroupWareUse(_ groupWareUse:Bool){
        mGroupWareUse = groupWareUse
    }
    
    func getENV_DecLenManHour() -> Int {
        return mENV_DecLenManHour
    }
    func setENV_DecLenManHour(_ ENV_DecLenManHour:Int){
        mENV_DecLenManHour = ENV_DecLenManHour
    }
    
    //These two methods are added for solving the error in IOSERP-477
    func getNumPointType() -> String {
        return mNumPointType
    }
    func setNumPointType(_ numPointType:String){
        mNumPointType = numPointType
    }
    
    func getM_NumPointType() -> String {
        return mNumPointType
    }
    func setM_NumPointType(_ numPointType:String){
        mNumPointType = numPointType
    }
    
    
    func getNumSeparatorType() -> String {
        return mNumSeparatorType
    }
    func setNumSeparatorType(_ numSeparatorType:String){
        mNumSeparatorType = numSeparatorType
    }
    
    func getDateFormatType() -> String {
        return mDateFormatType
    }
    func setDateFormatType(_ dateFormatType:String){
        mDateFormatType = dateFormatType
    }
    
    func getDateSeparatorType() -> String {
        return mDateSeparatorType
    }
    func setDateSeparatorType(_ dateSeparatorType:String){
        mDateSeparatorType = dateSeparatorType
    }
    
    func getIsPgmEventSecu() -> String {
        return mIsPgmEventSecu
    }
    func setIsPgmEventSecu(_ isPgmEventSecu:String){
        mIsPgmEventSecu = isPgmEventSecu
    }
    
    func getIsServiceTimeLog() -> String {
        return mIsServiceTimeLog
    }
    func setIsServiceTimeLog(_ isServiceTimeLog:String){
        mIsServiceTimeLog = isServiceTimeLog
    }
    
    func getAccUnit() -> String {
        return mAccUnit
    }
    func setAccUnit(_ accUnit:String){
        mAccUnit = accUnit
    }
    
    func getAccUnitName() -> String {
        return mAccUnitName
    }
    func setAccUnitName(_ accUnitName:String){
        mAccUnitName = accUnitName
    }
    
    func getCompanyName() -> String {
        return mCompanyName
    }
    func setCompanyName(_ companyName:String){
        mCompanyName = companyName
    }
    
    func getCompanySeq() -> Int {
        return mCompanySeq
    }
    func setCompanySeq(_ companySeq:Int){
        mCompanySeq = companySeq
    }
    
    func getDevCustSeq() -> Int {
        return mDevCustSeq
    }
    func setDevCustSeq(_ devCustSeq:Int){
        mDevCustSeq = devCustSeq
    }
    
    func getDsn() -> String {
        return mDsn
    }
    func setDsn(_ dsn:String){
        mDsn = dsn
    }
    
    func getEMail() -> String {
        return mEMail
    }
    func setEMail(_ email:String){
        mEMail = email
    }
    
    func getEmpId() -> String {
        return mEmpId
    }
    func setEmpId(_ empId:String){
        mEmpId = empId
    }
    
    func getEmpName() -> String {
        return mEmpName
    }
    func setEmpName(_ empName:String){
        mEmpName = empName
    }
    
    func getEmpSeq() -> Int {
        return mEmpSeq
    }
    func setEmpSeq(_ empSeq:Int){
        mEmpSeq = empSeq
    }
    
    func getJpName() -> String {
        return mJpName
    }
    func setJpName(_ jpName:String){
        mJpName = jpName
    }
    
    func getLanguageSeq() -> Int {
        return mLanguageSeq
    }
    func setLanguageSeq(_ languageSeq:Int){
        mLanguageSeq = languageSeq
    }
    
    func getLoginDate() -> String {
        return mLoginDate
    }
    func setLoginDate(_ loginDate:String){
        mLoginDate = loginDate
    }
    
    func getLoginDateDay() -> Int {
        return mLoginDateDay
    }
    func setLoginDateDay(_ loginDateDay:Int){
        mLoginDateDay = loginDateDay
    }
    
    func getLoginDateMonth() -> Int {
        return mLoginDateMonth
    }
    func setLoginDateMonth(_ loginDateMonth:Int){
        mLoginDateMonth = loginDateMonth
    }
    
    func getLoginDateTime() -> String {
        return mLoginDateTime
    }
    func setLoginDateTime(_ loginDateTime:String){
        mLoginDateTime = loginDateTime
    }
    
    func getLoginDateYear() -> Int {
        return mLoginDateYear
    }
    func setLoginDateYear(_ loginDateYear:Int){
        mLoginDateYear = loginDateYear
    }
    
    func getPassword() -> String {
        return mPassword
    }
    func setPassword(_ password:String){
        mPassword = password
    }
    
    func getSiteInit() -> String {
        return mSiteInit
    }
    func setSiteInit(_ siteInit:String){
        mSiteInit = siteInit
    }
    
    func getSlipUnit() -> String {
        return mSlipUnit
    }
    func setSlipUnit(_ slipUnit:String){
        mSlipUnit = slipUnit
    }
    
    func getSlipUnitName() -> String {
        return mSlipUnitName
    }
    func setSlipUnitName(_ slipUnitName:String){
        mSlipUnitName = slipUnitName
    }
    
    func getSMUserType() -> Int {
        return mSMUserType
    }
    func setSMUserType(_ smUserType:Int){
        mSMUserType = smUserType
    }
    
    func getUserID() -> String {
        return mUserID
    }
    func setUserID(_ userID:String){
        mUserID = userID
    }
    
    func getUserName() -> String {
        return mUserName
    }
    func setUserName(_ userName:String){
        mUserName = userName
    }
    
    func getUserSeq() -> Int {
        return mUserSeq
    }
    func setUserSeq(_ userSeq:Int){
        mUserSeq = userSeq
    }
    
    func getConnInfo() -> String {
        return mConnInfo
    }
    func setConnInfo(_ connInfo:String){
        mConnInfo = connInfo
    }
    
    func getMessage() -> String {
        return mMessage
    }
    func setMessage(_ message:String){
        mMessage = message
    }
    
    func getBgtUnit() -> String {
        return mBgtUnit
    }
    func setBgtUnit(_ bgtUnit:String){
        mBgtUnit = bgtUnit
    }
    
    func getBgtUnitName() -> String {
        return mBgtUnitName
    }
    func setBgtUnitName(_ bgtUnitName:String){
        mBgtUnitName = bgtUnitName
    }
    
    func getBizUnit() -> String {
        return mBizUnit
    }
    func setBizUnit(_ bizUnit:String){
        mBizUnit = bizUnit
    }
    
    func getBizUnitName() -> String {
        return mBizUnitName
    }
    func setBizUnitName(_ bizUnitName:String){
        mBizUnitName = bizUnitName
    }
    
    func getCustName() -> String {
        return mCustName
    }
    func setCustName(_ custName:String){
        mCustName = custName
    }
    
    func getCustSeq() -> Int {
        return mCustSeq
    }
    func setCustSeq(_ custSeq:Int){
        mCustSeq = custSeq
    }
    
    func getDeptName() -> String {
        return mDeptName
    }
    func setDeptName(_ deptName:String){
        mDeptName = deptName
    }
    
    func getDeptSeq() -> String {
        return mDeptSeq
    }
    func setDeptSeq(_ deptSeq:String){
        mDeptSeq = deptSeq
    }
    
    func getFactUnit() -> String {
        return mFactUnit
    }
    func setFactUnit(_ factUnit:String){
        mFactUnit = factUnit
    }
    func getFactUnitName() -> String {
        return mFactUnitName
    }
    func setFactUnitName(_ factUnitName:String){
        mFactUnitName = factUnitName
    }
    
    func getHPNo() -> String {
        return mHPNo
    }
    func setHPNo(_ hpNo:String){
        mHPNo = hpNo
    }
    
    func getPosName() -> String {
        return mPosName
    }
    func setPosName(_ posName:String){
        mPosName = posName
    }
    
    func getPosSeq() -> Int {
        return mPosSeq
    }
    func setPosSeq(_ posSeq:Int){
        mPosSeq = posSeq
    }
    
    func getPuName() -> String {
        return mPuName
    }
    func setPuName(_ puName:String){
        mPuName = puName
    }
    
    func getPuSeq() -> Int {
        return mPuSeq
    }
    func setPuSeq(_ puSeq:Int){
        mPuSeq = puSeq
    }
    
    func getTaxName() -> String {
        return mTaxName
    }
    func setTaxName(_ taxName:String){
        mTaxName = taxName
    }
    
    func getTaxUnit() -> String {
        return mTaxUnit
    }
    func setTaxUnit(_ taxUnit:String){
        mTaxUnit = taxUnit
    }
    
    func getUMCostType() -> String {
        return mUMCostType
    }
    func setUMCostType(_ umCostType:String){
        mUMCostType = umCostType
    }
    
    func getUMCostTypeName() -> String {
        return mUMCostTypeName
    }
    func setUMCostTypeName(_ umCostTypeName:String){
        mUMCostTypeName = umCostTypeName
    }
    
    func getWkDeptName() -> String {
        return mWkDeptName
    }
    func setWkDeptName(_ wkDeptName:String){
        mWkDeptName = wkDeptName
    }
    
    func getWkDeptSeq() -> String {
        return mWkDeptSeq
    }
    func setWkDeptSeq(_ wkDeptSeq:String){
        mWkDeptSeq = wkDeptSeq
    }
    
    func getPgmId() -> String {
        return mPgmId
    }
    func setPgmId(_ pgmId:String){
        mPgmId = pgmId
    }
    
    func getPgmSeq() -> Int {
        return mPgmSeq
    }
    func setPgmSeq(_ pgmSeq:Int){
        mPgmSeq = pgmSeq
    }
    
    func getActiveSheetControlName() -> String {
        return mActiveSheetControlName
    }
    func setActiveSheetControlName(_ activeSheetControlName:String){
        mActiveSheetControlName = activeSheetControlName
    }
    
    func getHomeDir() -> String {
        return mHomeDir
    }
    func setHomeDir(_ homeDir:String){
        mHomeDir = homeDir
    }
    
    func isIsJumpEventCancel() -> Bool {
        return mIsJumpEventCancel
    }
    func setIsJumpEventCancel(_ isJumpEventCancel:Bool){
        mIsJumpEventCancel = isJumpEventCancel
    }
    
    func getIsJumpInCancel_CloseButtonClick() -> Bool {
        return mIsJumpInCancel_CloseButtonClick
    }
    func setIsJumpInCancel_CloseButtonClick(_ isJumpInCancel:Bool){
        mIsJumpInCancel_CloseButtonClick = isJumpInCancel
    }
    
    func getIsOpen() -> Bool {
        return mIsOpen
    }
    func setIsOpen(_ isOpen:Bool){
        mIsOpen = isOpen
    }
    
    func isPgmMethodEventCancel() -> Bool {
        return mPgmMethodEventCancel
    }
    func setPgmMethodEventCancel(_ pgmMethodEventCancel:Bool){
        mPgmMethodEventCancel = pgmMethodEventCancel
    }
    
    func getJumpPgmId() -> String {
        return mJumpPgmId
    }
    func setJumpPgmId(_ jumpPgmId:String){
        mJumpPgmId = jumpPgmId
    }
    
    func getJumpPgmSeq() -> String {
        return mJumpPgmSeq
    }
    func setJumpPgmSeq(_ jumpPgmSeq:String){
        mJumpPgmSeq = jumpPgmSeq
    }
    
    func getLinkCreateID() -> String {
        return mLinkCreateID
    }
    func setLinkCreateID(_ linkCreateID:String){
        mLinkCreateID = linkCreateID
    }
    
    func getRemoteAddress() -> String {
        return mRemoteAddress
    }
    func setRemoteAddress(_ remoteAddress:String){
        mRemoteAddress = remoteAddress
    }
    
    func getJumpType() -> String {
        return mJumpType
    }
    func setJumpType(_ jumpType:String){
        mJumpType = jumpType
    }
    
    func getPgmMethodSeq() -> Int {
        return mPgmMethodSeq
    }
    func setPgmMethodSeq(_ pgmMethodSeq:Int){
        mPgmMethodSeq = pgmMethodSeq
    }
    
    func getServiceAffair() -> Int {
        return mServiceAffair
    }
    func setServiceAffair(_ serviceAffair:Int){
        mServiceAffair = serviceAffair
    }
    
    //16.06.20 hwon.kim pgmSecu START
    var mEventType = 0
    var mEventMethodType = 0
    
    func getEventType() -> Int {
        return mEventType
    }
    func setEventType(_ eventType : Int) {
        mEventType = eventType
    }
    
    func getEventMethodType() -> Int {
        return mEventMethodType
    }
    func setEventMethodType(_ eventMethodType : Int) {
        mEventMethodType = eventMethodType
    }
    func getCodeHelpData() -> DataSet? {
        return CodeHelpData
    }
    
    func setCodeHelpDataSet(_ codeHelpData: DataSet?) {
        self.CodeHelpData = codeHelpData
    }
    
//    
    //MARK:- convert to json
//    override func unwrap(any:Any) -> Any? {
//        let mi = Mirror(reflecting: any)
//        
//        guard mi.displayStyle == Mirror.DisplayStyle.Optional else {
//            return any
//        }
//        
//        // Optional.None
//        guard mi.children.count > 0 else {
//            return nil
//        }
//        
//        let (_,some) = mi.children.first!
//        
//        return some
//        
//    }
    
    //dictionary 타입으로 바꾸기
//    override func toDictionary() -> NSDictionary {
//        let propertiesDictionary = NSMutableDictionary()
//        let mirror = Mirror(reflecting: self);
//        for child in mirror.children {
//            let propName = child.label!
//            //            let (propName, childMirror) = mirror[i]
//            if let propValue:AnyObject = unwrap(child.value) as? AnyObject {
//                if let serializeablePropValue = propValue as? Serializable {
//                    propertiesDictionary.setValue(serializeablePropValue.toDictionary(), forKey: propName)
//                } else if let arrayPropValue = propValue as? Array<Serializable> {
//                    var subArray = Array<NSDictionary>()
//                    for item in arrayPropValue {
//                        subArray.append(item.toDictionary())
//                    }
//                    propertiesDictionary.setValue(subArray, forKey: propName)
//                } else if propValue is Int || propValue is Double || propValue is Float {
//                    propertiesDictionary.setValue(propValue, forKey: propName)
//                } else if let dataPropValue = propValue as? NSData {
//                    propertiesDictionary.setValue(dataPropValue.base64EncodedStringWithOptions(NSDataBase64EncodingOptions()), forKey: propName)
//                } else if let boolPropValue = propValue as? Bool {
//                    propertiesDictionary.setValue(boolPropValue.boolValue, forKey: propName)
//                } else if let arrPropValue = propValue as? NSArray {
//                    // if value is of type nsarray of class which doesnot extends serializable class
//                    let arr2:[NSMutableDictionary] = dictionaryOfArr(arrPropValue)
//                    propertiesDictionary.setValue(arr2, forKey: propName)
//                } else if let _ = propValue as? NSIndexPath {
//                }else {
//                    let type = propValue.dynamicType.description()
//                    if type != "__NSCFType" {
//                        propertiesDictionary.setValue(propValue, forKey: propName)
//                    }
//                    
//                }
//            }
//        }
//        return propertiesDictionary
//    }
    
//    override func toJson() -> NSData {
//        let dictionary = self.toDictionary()
//        
//        do {
//            let json = try NSJSONSerialization.dataWithJSONObject(dictionary, options:NSJSONWritingOptions(rawValue: 0))
//            return json
//        }
//        catch {
////            let error = err?.description ?? "nil"
//            let error = "error"
//            NSLog("ERROR: Unable to serialize json, error: %@", error)
//            NSNotificationCenter.defaultCenter().postNotificationName("CrashlyticsLogNotification", object: self, userInfo: ["string": "unable to serialize json, error: \(error)"])
//            abort()
//        }
//    }
    
//    override func toJsonString() -> NSString! {
//        return NSString(data: self.toJson(), encoding: NSUTF8StringEncoding)
//    }
    
    override init() {
        
    }
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
          isOpened  <- map["isOpened"]
        
          mAccUnit <- map["AccUnit"]
        
          mAccUnitName  <- map["AccUnitName"]
        
          mCompanyName <- map["CompanyName"]
        
          mCompanySeq <- map["CompanySeq"]
        
          mDevCustSeq <- map["DevCustSeq"]
        
         mDsn <- map["Dsn"]
        
         mEMail <- map["EMail"]
        
         mEmpId <- map["EmpId"]
        
         mEmpName <- map["EmpName"]
        
         mEmpSeq <- map["EmpSeq"]
        
         mJpName <- map["JpName"]
        
         mLanguageSeq <- map["LanguageSeq"]
        
         mLoginDate <- map["LoginDate"]
        
         mLoginDateDay <- map["LoginDateDay"]
        
         mLoginDateMonth <- map["LoginDateMonth"]
        
         mLoginDateTime <- map["LoginDateTime"]
        
         mLoginDateYear <- map["LoginDateYear"]
        
         mPassword <- map["Password"]
        
         mSiteInit <- map["SiteInit"]
        
         mSlipUnit <- map["SlipUnit"]
        
         mSlipUnitName <- map["SlipUnitName"]
        
         mSMUserType <- map["SMUserType"]
        
         mUserID <- map["UserID"]
        
         mUserName <- map["UserName"]
        
         mUserSeq <- map["UserSeq"]
        
         mConnInfo <- map["ConnInfo"]
        
         mMessage <- map["Message"]
        
         mBgtUnit <- map["BgtUnit"]
        
         mBizUnit <- map["BizUnit"]
        
         mBizUnitName <- map["BizUnitName"]
        
         mCustName <- map["CustName"]
        
         mCustSeq <- map["CustSeq"]
        
         mDeptName <- map["DeptName"]
        
         mDeptSeq <- map["DeptSeq"]
        
         mFactUnit <- map["FactUnit"]
        
         mHPNo <- map["HPNo"]
        
         mPosName <- map["PosName"]
        
         mPosSeq <- map["PosSeq"]
        
         mPuName <- map["PuName"]
        
         mPuSeq <- map["PuSeq"]
        
         mTaxName <- map["TaxName"]
        
         mTaxUnit <- map["TaxUnit"]
        
         mUMCostType <- map["UMCostType"]
        
         mUMCostTypeName <- map["UMCostTypeName"]
        
         mWkDeptName <- map["WkDeptName"]
        
         mWkDeptSeq <- map["WkDeptSeq"]
        
        
         mLoginSeq <- map["LoginSeq"]
        
         mLoginID <- map["LoginID"]
        
        
         mDsnOper <- map["DsnOper"]
        
         mDsnBis <- map["DsnBis"]
        
         mDsnEsm <- map["DsnEsm"]
        
         mDsnBpm <- map["DsnBpm"]
        
        
         mENV_Nation <- map["ENV_Nation"]
        
         mENV_SiteInit <- map["ENV_SiteInit"]
        
         mENV_CustomsTariff <- map["ENV_CustomsTariff"]
        
         mENV_DecLenBOM <- map["ENV_DecLenBOM"]
        
         mENV_DecLenMatQty <- map["ENV_DecLenMatQty"]
        
         mENV_DecLenMatCost <- map["ENV_DecLenMatCost"]
        
         mENV_DecLenMatCostFor <- map["ENV_DecLenMatCostFor"]
        
         mENV_DecLenGoodsQty <- map["ENV_DecLenGoodsQty"]
        
         mENV_DecLenGoodsCost <- map["ENV_DecLenGoodsCost"]
        
         mENV_DecLenGoodsCostFor <- map["ENV_DecLenGoodsCostFor"]
        
         mENV_DecLenExcRate <- map["ENV_DecLenExcRate"]
        
         mENV_BasicForCurr <- map["ENV_BasicForCurr"]
        
         mENV_BasicForCurrName <- map["ENV_BasicForCurrName"]
        
         mENV_BasicKorCurr <- map["ENV_BasicKorCurr"]
        
         mENV_BasicKorCurrName <- map["ENV_BasicKorCurrName"]
        
         mENV_DecLenFOR <- map["ENV_DecLenFOR"]
        
         mENV_DecLenKOR <- map["ENV_DecLenKOR"]
        
         mENV_DecLenCostDivRate <- map["ENV_DecLenCostDivRate"]
        
         mReportDefSwitch <- map["ReportDefSwitch"]
        
         mGroupWareUse <- map["GroupWareUse"]
        
         mENV_DecLenManHour <- map["ENV_DecLenManHour"]
        
        
         mNumPointType <- map["NumPointType"]
        
         mNumSeparatorType <- map["NumSeparatorType"]
        
         mDateFormatType <- map["DateFormatType"]
        
         mDateSeparatorType <- map["DateSeparatorType"]
        
         mIsPgmEventSecu <- map["IsPgmEventSecu"]
        
         mIsServiceTimeLog <- map["IsServiceTimeLog"]
        
         mPgmId <- map["PgmId"]
        
         mPgmSeq <- map["PgmSeq"]
        
         mActiveSheetControlName <- map["ActiveSheetControlName"]
        
         mHomeDir <- map["HomeDir"]
        
         mIsJumpEventCancel <- map["IsJumpEventCancel"]
        
         mIsJumpInCancel_CloseButtonClick <- map["IsJumpInCancel_CloseButtonClick"]
        
         mIsOpen <- map["IsOpen"]
        
        mPgmMethodEventCancel <- map["PgmMethodEventCancel"]
        
        
         mJumpPgmId <- map["JumpPgmId"]
        
         mJumpPgmSeq <- map["JumpPgmSeq"]
        
         mLinkCreateID <- map["LinkCreateID"]
        
         mRemoteAddress <- map["RemoteAddress"]
        
         mJumpType <- map["JumpType"]
        
         mPgmMethodSeq <- map["PgmMethodSeq"]
        
         mServiceAffair <- map["ServiceAffair"]
        
         mFactUnitName <- map["FactUnitName"]
        
         mBgtUnitName <- map["BgtUnitName"]
        
        CodeHelpData <- map["CodeHelpData"]
        
        mLocation <- map["mLocation"]
        
        mLatitude <- map["mLatitude"]
        
        mLongitude <- map["mLongitude"]
        
        fileServerDir <- map["FileServerDir"]
        
        session <- map["session"]
        
        url <- map["url"]
    }
}
