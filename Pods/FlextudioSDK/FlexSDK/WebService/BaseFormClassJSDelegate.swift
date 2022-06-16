//
//  BaseFormClassJSDelegate.swift
//  MobileERP
//
//  Created by 김 희원 on 2016. 2. 1..
//  Copyright (c) 2016년 Sunil Luitel. All rights reserved.
//

import Foundation
import JavaScriptCore

@objc
protocol BaseFormClassJSDelegate:JSExport {
    func setLoginResultDataSet(_ dsData : DataSet)
    func getDefaultDate() -> String
    func getLoginSeq() -> String
    func setLoginSeq(_ loginSeq:String)
    func getLoginID() -> String
    func setLoginID(_ loginID:String)
    func getDsnOper() -> String
    func setDsnOper(_ dsnOper:String)
    func getDsnBis() -> String
    func setDsnBis(_ dsnBis:String)
    func getDsnEsm() -> String
    func setDsnEsm(_ dsnEsm:String)
    func getDsnBpm() -> String
    func setDsnBpm(_ dsnBpm:String)
    func getENV_Nation() -> String
    func setENV_Nation(_ ENV_Nation:String)
    func getENV_SiteInit() -> String
    func setENV_SiteInit(_ ENV_SiteInit:String)
    func getENV_CustomsTariff() -> Double
    func setENV_CustomsTariff(_ ENV_CustomsTariff:Double)
    func getENV_DecLenBOM() -> Int
    func setENV_DecLenBOM(_ ENV_DecLenBOM:Int)
    func getENV_DecLenMatQty() -> Int
    func setENV_DecLenMatQty(_ ENV_DecLenMatQty:Int)
    func getENV_DecLenMatCost() -> Int
    func setENV_DecLenMatCost(_ ENV_DecLenMatCost:Int)
    func getENV_DecLenMatCostFor() -> Int
    func setENV_DecLenMatCostFor(_ ENV_DecLenMatCostFor:Int)
    func getENV_DecLenGoodsQty() -> Int
    func setENV_DecLenGoodsQty(_ ENV_DecLenGoodsQty:Int)
    func getENV_DecLenGoodsCost() -> Int
    func setENV_DecLenGoodsCost(_ ENV_DecLenGoodsCost:Int)
    func getENV_DecLenGoodsCostFor() -> Int
    func setENV_DecLenGoodsCostFor(_ ENV_DecLenGoodsCostFor:Int)
    func getENV_DecLenExcRate() -> Int
    func setENV_DecLenExcRate(_ ENV_DecLenExcRate:Int)
    func getENV_BasicForCurr() -> Int
    func setENV_BasicForCurr(_ ENV_BasicForCurr:Int)
    func getENV_BasicForCurrName() -> String
    func setENV_BasicForCurrName(_ ENV_BasicForCurrName:String)
    func getENV_BasicKorCurr() -> Int
    func setENV_BasicKorCurr(_ ENV_BasicKorCurr:Int)
    func getENV_BasicKorCurrName() -> String
    func setENV_BasicKorCurrName(_ ENV_BasicKorCurrName:String)
    func getENV_DecLenFOR() -> Int
    func setENV_DecLenFOR(_ ENV_DecLenFOR:Int)
    func getENV_DecLenKOR() -> Int
    func setENV_DecLenKOR(_ ENV_DecLenKOR:Int)
    func getENV_DecLenCostDivRate() -> Int
    func setENV_DecLenCostDivRate(_ ENV_DecLenCostDivRate:Int)
    func getReportDefSwitch() -> String
    func isGroupWareUse() -> Bool
    func setGroupWareUse(_ groupWareUse:Bool)
    func getENV_DecLenManHour() -> Int
    func setENV_DecLenManHour(_ ENV_DecLenManHour:Int)
    func getM_NumPointType() -> String
    func setM_NumPointType(_ numPointType:String)
    func getNumSeparatorType() -> String
    func setNumSeparatorType(_ numSeparatorType:String)
    func getDateFormatType() -> String
    func setDateFormatType(_ dateFormatType:String)
    func getDateSeparatorType() -> String
    func setDateSeparatorType(_ dateSeparatorType:String)
    func getIsPgmEventSecu() -> String
    func setIsPgmEventSecu(_ isPgmEventSecu:String)
    func getIsServiceTimeLog() -> String
    func setIsServiceTimeLog(_ isServiceTimeLog:String)
    func getAccUnit() -> String
    func setAccUnit(_ accUnit:String)
    func getAccUnitName() -> String
    func setAccUnitName(_ accUnitName:String)
    func getCompanyName() -> String
    func setCompanyName(_ companyName:String)
    func getCompanySeq() -> Int
    func setCompanySeq(_ companySeq:Int)
    func getDevCustSeq() -> Int
    func setDevCustSeq(_ devCustSeq:Int)
    func getDsn() -> String
    func setDsn(_ dsn:String)
    func getEMail() -> String
    func setEMail(_ email:String)
    func getEmpId() -> String
    func setEmpId(_ empId:String)
    func getEmpName() -> String
    func setEmpName(_ empName:String)
    func getEmpSeq() -> Int
    func setEmpSeq(_ empSeq:Int)
    func getJpName() -> String
    func setJpName(_ jpName:String)
    func getLanguageSeq() -> Int
    func setLanguageSeq(_ languageSeq:Int)
    func getLoginDate() -> String
    func setLoginDate(_ loginDate:String)
    func getLoginDateDay() -> Int
    func setLoginDateDay(_ loginDateDay:Int)
    func getLoginDateMonth() -> Int
    func setLoginDateMonth(_ loginDateMonth:Int)
    func getLoginDateTime() -> String
    func setLoginDateTime(_ loginDateTime:String)
    func getLoginDateYear() -> Int
    func setLoginDateYear(_ loginDateYear:Int)
    func getPassword() -> String
    func setPassword(_ password:String)
    func getSiteInit() -> String
    func setSiteInit(_ siteInit:String)
    func getSlipUnit() -> String
    func setSlipUnit(_ slipUnit:String)
    func getSlipUnitName() -> String
    func setSlipUnitName(_ slipUnitName:String)
    func getSMUserType() -> Int
    func setSMUserType(_ smUserType:Int)
    func getUserID() -> String
    func setUserID(_ userID:String)
    func getUserName() -> String
    func setUserName(_ userName:String)
    func getUserSeq() -> Int
    func setUserSeq(_ userSeq:Int)
    func getConnInfo() -> String
    func setConnInfo(_ connInfo:String)
    func getMessage() -> String
    func setMessage(_ message:String)
    func getBgtUnit() -> String
    func setBgtUnit(_ bgtUnit:String)
    func getBgtUnitName() -> String
    func setBgtUnitName(_ bgtUnitName:String)
    func getBizUnit() -> String
    func setBizUnit(_ bizUnit:String)
    func getBizUnitName() -> String
    func setBizUnitName(_ bizUnitName:String)
    func getCustName() -> String
    func setCustName(_ custName:String)
    func getCustSeq() -> Int
    func setCustSeq(_ custSeq:Int)
    func getDeptName() -> String
    func setDeptName(_ deptName:String)
    func getDeptSeq() -> String
    func setDeptSeq(_ deptSeq:String)
    func getFactUnit() -> String
    func setFactUnit(_ factUnit:String)
    func getHPNo() -> String
    func setHPNo(_ hpNo:String)
    func getPosName() -> String
    func setPosName(_ posName:String)
    func getPosSeq() -> Int
    func setPosSeq(_ posSeq:Int)
    func getPuName() -> String
    func setPuName(_ puName:String)
    func getPuSeq() -> Int
    func setPuSeq(_ puSeq:Int)
    func getTaxName() -> String
    func setTaxName(_ taxName:String)
    func getTaxUnit() -> String
    func setTaxUnit(_ taxUnit:String)
    func getUMCostType() -> String
    func setUMCostType(_ umCostType:String)
    func getUMCostTypeName() -> String
    func setUMCostTypeName(_ umCostTypeName:String)
    func getWkDeptName() -> String
    func setWkDeptName(_ wkDeptName:String)
    func getWkDeptSeq() -> String
    func setWkDeptSeq(_ wkDeptSeq:String)
    func getPgmId() -> String
    func setPgmId(_ pgmId:String)
    func getPgmSeq() -> Int
    func setPgmSeq(_ pgmSeq:Int)
    func getActiveSheetControlName() -> String
    func setActiveSheetControlName(_ activeSheetControlName:String)
    func getHomeDir() -> String
    func setHomeDir(_ homeDir:String)
    func isIsJumpEventCancel() -> Bool
    func setIsJumpEventCancel(_ isJumpEventCancel:Bool)
    func getIsJumpInCancel_CloseButtonClick() -> Bool
    func setIsJumpInCancel_CloseButtonClick(_ isJumpInCancel:Bool)
    func getIsOpen() -> Bool
    func setIsOpen(_ isOpen:Bool)
    func isPgmMethodEventCancel() -> Bool
    func setPgmMethodEventCancel(_ pgmMethodEventCancel:Bool)
    func getJumpPgmId() -> String
    func setJumpPgmId(_ jumpPgmId:String)
    func getJumpPgmSeq() -> String
    func setJumpPgmSeq(_ jumpPgmSeq:String)
    func getLinkCreateID() -> String
    func setLinkCreateID(_ linkCreateID:String)
    func getRemoteAddress() -> String
    func setRemoteAddress(_ remoteAddress:String)
    func getJumpType() -> String
    func setJumpType(_ jumpType:String)
    func getPgmMethodSeq() -> Int
    func setPgmMethodSeq(_ pgmMethodSeq:Int)
    func getServiceAffair() -> Int
    func setServiceAffair(_ serviceAffair:Int)
    func setProgTableSeq(_ seq:Int)
    func getCurrDate() -> String
    func getCodeHelpData() -> DataSet?
    func setCodeHelpDataSet(_ codeHelpData: DataSet?)
    //20161205
    func getMobileLongitude()->String
    func getMobileLatitude()->String
    func getMobileLocation()->String
    //20170329
    func getCurrTime()->String
    //170621
    func getOSType() -> String
    //170705
    func getDeviceType() -> String
    func getBarCodeString()->String
    
    //17.07.17 hwon.kim
    func getProductType()->String
    func getWebViewResultString()->String
}
