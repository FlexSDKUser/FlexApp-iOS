//
//  Const.swift
//  MobileERP
//
//  Created by Sunil Luitel on 9/3/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import Foundation
import UIKit
class Const {
    
    static  var KEY_DSN = "key_DSN";
    static  var KEY_USERSEQ = "key_UserSeq";
    static  var KEY_LANGUAGESEQ = "key_LanguageSeq";
    static  var KEY_SERVERIP = "key_ServerIP";
    static  var KEY_PGMSEQ = "key_PgmSeq";
    
    static let FRAMEWORK_URL_VALUE = "AppBaseFramework.svc"
    static let FRAMEWORK_SOAPACTION_VALUE = "http://tempuri.org/IAppBaseFramework/"
    static let METHODSVR_URL_VALUE = "AppBaseService.svc"
    static let METHODSVR_SOAPACTION_VALUE = "http://tempuri.org/IAppBaseService/"
    
    // **********  oksil Added start 
    
    static let WT_ADD = "A" // WorkingTag : Add
    static let WT_UPT = "U" // WorkingTag : Update
    static let WT_DEL = "D" // WorkingTag : Delete
    static let WT_EXT = "E" // WorkingTag : Except
    static let WT_DEF = "" // WorkingTag : Default
    
    static let LIMIT_DATABLOCK_LENGTH = "LimitDataBlock_Length"
    static let PGM_METHOD_SEQ = "PgmMethodSeq"
    static let EXECUTE_SEQ = "ExecuteSeq"
    static let EVENT_SEQ = "EventSeq"
    
    static let LOGIN_INFO_LASTDATETIME = "login_info_lastdatetime"
    static let LOGIN_DSN_OPER_VALUE = "login_dsnOper"
    static let LOGIN_DSN_BIS_VALUE = "login_dsnBis"
    static let LOGIN_SERVER_SETTING_ID = "login_serverSettingId"
    static let LOGIN_COMPANY_INFO_ID = "login_companyInfoId"
    
    static let LOGIN_LANGUAGE = "login_language"
    static let LOGIN_SERVER = "login_server"
    static let LOGIN_ID = "login_id"
    static let LOGIN_PW = "login_pw"
    
    //hwon.kim 180322
    //remove auto login
    static let LOGIN_ISAUTO = "isAutoLogin"
    static let LOGIN_COMPANYSEQ_IDX = "login_company_idx"
    static let LOGINSVC_ERR = "LOGINSVCERR"

    //hwon.kim 180508
    static let LOGIN_ISESS = "isEssCheck"
    
    static let SERVICE_QUERYEXECUTE = "QueryExecuteMobileApp"
    static let SERVICE_QUERYEXECUTE_JSON = "QueryExecuteMobileApp_json"
    static let SERVICE_EXECUTESQLCOMMAND = "ExecuteSqlCommandMobileApp"
    static let SERVICE_GETFORMINFO = "GetFormInfoMobileApp"
    static let SERVICE_GETFORMINFO_SCHEMA = "GetFormInfoSchemaMobileApp"
    static let SERVICE_GETFORMINFO_JSON = "GetFormInfoMobileApp_json"
    static let SERVICE_GETFORMINFO_SCHEMA_JSON = "GetFormInfoSchemaMobileApp_json"
    static let SERVICE_GETLOGIN = "GetLoginMobileApp"
    static let SERVICE_SQLWF = "ExecuteMethodSQLWFMobileApp"
    static let SERVICE_KWF = "ExecuteMethodKWFMobileApp"
    static let SERVICE_SQLWF_JSON = "ExecuteMethodSQLWFMobileApp_json"
    static let SERVICE_KWF_JSON = "ExecuteMethodKWFMobileApp_json"
    // static let SERVICE_GETCODEHELP = "GetCodeHelp"
    static let SERVICE_GETCODEHELPFORMQUERYTITLE = "GetCodeHelpFormQueryTitleMobileApp"
    static let SERVICE_GETCODEHELPFORMQUERY = "GetCodeHelpFormQueryMobileApp"
    static let SERVICE_GETCODEHELPQUERY = "GetCodeHelpQueryMobileApp"
    static let SERVICE_LOGININFOANDMESSAGE = "LoginInfoAndMessageMobileApp"
    static let SERVICE_GETMAINMODULE = "GetMainModuleMobileApp"
    static let SERVICE_EXECUTEMETHODOPTION = "ExecuteMethodOptionMobileApp"
    /// CommonSvcCaller_QueryExecute SP name
    static let PGM_SEARCH_SP = "_SCARecentPgmQuery"
    static let DICTIONARY_MSG_SP = "_SCAGetDictionary"
    static let PGM_JUMP_SP = "_SCAGetPageJumpQuery"
    static let ACTION_SECU_SP = "_SCAGetActionSecuCheck"
    static let GET_PAGE_CODE_SECU_SP = "_SCAGetPageCodeSecu"
    static let GETPGMSEQ_BYPGMID = "_SCAMobileGetPgmSeq"
    static let GET_DIRECT_TABLE_SP = "_SCACustomSP_MobileApp"
    //17.12.12 hwon.kim
    static let GET_AttachFileSeq = "_SCAMaxAttachFileSeqQuery"
    
    static var GET_DEMO_SCENARIO_SP = "_SCAMobileDemoScenario";
    static var GET_DEMO_MENULIST_SP = "_SCAMobileDemoMenuList";
    static let GET_DEMO_HELP_SP = "_SCAMobileDemoPgmHelp_MobileApp"
    static var GET_DEMO_SAVE_REVIEW_SP = "_SCAMobileDemoReviewResultSave";
    static var GET_DEMO_MOVIELIST_QUERY_SP = "_SCAMobileDemoMovieListQuery"
    
    //17.04.24 for default chart value test.
    static var CHANGE_DEFAULT_CHART_VALUE_FOR_TEST = "_SCAChangeDefaultChartValue_MobileApp"
//    static let GET_DEMO_SCENARIO_SP = "_SCAMobileDemoScenario";
//    static let GET_DEMO_MENULIST_SP = "_SCAMobileDemoMenuList";
//    static let GET_DEMO_HELP_SP = "_SCAMobileDemoPgmHelp_MobileApp"
//    static let GET_DEMO_SAVE_REVIEW_SP = "_SCAMobileDemoReviewResultSave";
//    static let GET_DEMO_MOVIELIST_QUERY_SP = "_SCAMobileDemoMovieListQuery"
    // Default Values:
    //        ScaleToDefaultIndex : 2
    //        RowControlCountIndex : 0
    //        SheetColumnCountIndex : 0
    //        CodeHelpCountIndex : 0
    //        ColorString : 0
    
    static let KEY_ScaleToDefault = "ScaleToDefault"
    static let KEY_RowControlCountPortrait = "RowControlCountPortrait"
    static let KEY_RowControlCountLand = "RowControlCountLand"
    static let KEY_SheetColumnCount = "SheetColumnCount"
    static let KEY_CodeHelpCount = "CodeHelpCount"
    static let KEY_ColorString = "ColorString"
    static let KEY_numberOfCtrlInARow = "numberOfCtrlInARow"
    static let KEY_numberOfCtrlInARowLand = "numberOfCtrlInARowLand"
    static let KEY_numberOfCtrlInARowAtOrientation = "numberOfCtrlInARowAtOrientation"
    static let KEY_UserDisableLand = "UserDisableLand"
    
    // **********  oksil Added end
    
    // **********  hwon Added start
//    static let PatternYN = "PatternYN"
//    static let IsUsePattern = "IsUsePattern"
    static let LoginType = "LoginType"
    static let DebugMode = "DebugMode"
    static let BreakPoint = "/*BREAK_POINT*/"
    // **********  hwon Added end
    
    /**20160311 hwon.kim add start - ExecuteMethodSync **/
    static let EMS_ONESTEP = 1
//    static let EMS_ONESTEP_EXECUTE = 1
//    static let EMS_ONESTEP_STOP = 2
    static let EMS_ALLSTEP = 3
    /**20160311 hwon.kim add end**/
    
    /**20160331 hwon.kim add start - commonCaller **/
    static let CONFIRM_PROC_SP = "_SWCOMConfirmProc";
    static let STOP_PROC_SP = "_SWCOMStopProc";
    /**20160331 hwon.kim add end**/
    
    /**20160510 hwon.kim add start - webService **/
    
    #if (arch(i386) || arch(x86_64)) && os(iOS)
    static let DEVICE_ID = "D3493023-83FD-4FE5-B8B9-0C2F89055F3g"
    #else
    static let DEVICE_ID = "\(UIDevice.current.identifierForVendor!.uuidString)"
    #endif
    static let DEVICE_TYPE = "271003"
    //"D3493023-83FD-4FE5-B8B9-0C2F89055F3f" //UIDevice.currentDevice().identifierForVendor!.UUIDString
    
    static let AUTO_LOGOUT_TIME = "AutoLogOutTime"
    /**20160510 hwon.kim add end**/
    
    static let PARSING_VERSION = "PARSING_VERSION"
    static let IsSearchBlock = "IsSearchBlock"
    //hwon.kim 180322
    //remove auto login
    static let IsUseAutoLogin = "IsUseAutoLogin"
    static let IsUsePattern = "IsUsePattern"
    static let IS_USE_PGM_SETTING_BLOCK = "IsUserPgmSettingBlock"
    //hwon.kim 180508
    static let IsESSUser = "IsESSUser"
    static let LicenseType = "LicenseType"
    static let LT_ESS_USER = "1112002"
    static let LT_ERP_USER = "1112001"
    
    //hwon.kim 180611
    static let ProductType = "ProductType"
   
    // 18.05.31 dpjang added condition in if, 282001 : Genuine , 282002 Ever , 282003 GenuineW
    static let PT_Genuine = "282001"
    static let PT_Ever = "282002"
    static let PT_GenuineW = "282003"
    
    //171024
    static let IsUseBoard = "IsUseBoard"
    static let IsUseCompanity = "IsUseCompanity"
    static let IsUseOrgChart = "IsUseOrgChart"
    static let IsUseAttendance = "IsUseAttendance"
    
    static let IsDEMO = "demostatus"
    static let TEMP_DSN_BIS = "temp_DSN_bis";
    static let TEMP_DSN_OPER = "temp_DSN_oper";
    static let TEMP_LANGUAGESEQ = "temp_LanguageSeq";
    static let TEMP_SERVERIP = "temp_ServerIP";
    static let TEMP_ID = "tempid";
    static let IsDEMOIng = "IsDEMOIng"
    
    static let IsERPDemo = "ISERPDEMO"
    static let IsGetFormInfoSchema = "ISGETFORMINFOSCHEMA"
    static let BugReport = "BugReport"
    
    // 16.10.20 dpjang ERROR REPORT - YLW GEN
    static let BUG_REPORT_SERVERIP_VALUE = "http://ylwout.ksystem.co.kr:8585/KSystemSvc/";
    static let BUG_REPORT_CONN_INFO = "ylwgn_bis|1|0|1|0|0|mobile : iphone_crashreport||ylwgn_bis|/0/0/0/0/0/0/0/0/ylwgn_oper//////"
    
    // 15.12.14 dpjang ERROR SCRIPT REPORT - WBS
    static let CRASH_SCRIPT_SERVERIP_VALUE = "http://wbs.ksystem.co.kr:8889/";
    static let CRASH_SCRIPT_CONN_INFO = "wbs_bis|1|50345|1|0|0|mobile : iphone_crashreport|dpjang|wbs_bis|/1293/0/2041/0/0/0/0/0/wbs_oper//////"
    
    // String connInfo = "wbs_bis" + "|" + 1 + "|" + 50345 + "|" + 1 + "|" + 0
    // + "|" + 0 + "|" + 0 + "|dpjang|wbs_bis";
    // connInfo += "|" + "" + "/" + 1293 + "/" + 0 + "/" + 2041 + "/" + 0
    // + "/" + 0 + "/" + 0 + "/" + 0 + "/" + 0 + "/" + "wbs_oper"
    // + "/";
    // connInfo += "" + "/" + "" + "/" + "" + "/" + "" + "/" + "" + "/";
    static let CRASHSCRIPT_ENTER = "#_enter_#";
    
    static let SAVE_SCRIPT_ERR_SP = "_SCASaveMobileAppScriptErrReport";
    // 16.10.20 dpjang - ONLY YLW Gen SERVER
    static let BUG_LIST_ACCESS_AUTH_CHECK_SP = "_SCAMobileBugListAccessAuthCheck";
    static let BUG_REPORT_QUERY_SP = "_SCAMobileBugReportQuery";
    static let BUG_REPORT_SAVE_SP = "_SCAMobileBugReportSave";
    static let BUG_RESPONSE_RESULT_SAVE_SP = "_SCAMobileBugResponseSave";
    // 16.10.20 dpjang - client server
    static let BUG_REPORT_QUERY_CLIENT_SP = "_SCAMobileBugReportQuery_Client";
    static let BUG_REPORT_SAVE_CLIENT_SP = "_SCAMobileBugReportSave_Client";
    static let BUG_RESPONSE_RESULT_SAVE_CLIENT_SP = "_SCAMobileBugResponseSave_Client";
    
    //service mode
    static let MethodServiceMode = 1
    static let BaseFrameMode = 0
    static let CrashScriptReportMode = 2
    static let BugReportMode = 3
    
    static let JSON_SEPARATOR = "<!--JSON--!>"
    static let SCHEMA_SEPARATOR = "<!--SPLIT--!>"
    
    static let CHECK_VERSION = "CHECK_VERSION"
    
    static let PW_AES_KEY = "23*323,dfms+2392dka@!@98fslf$(d6"
    static let QR_AES_KEY = "uEVtunxiUIKwYVIKsamVZ8V6CY40DAjx"
    // 18.02.22 dpjang des key
    static let DES_KEY = "a4#%df2q";
    static let UTF_8 = "UTF-8";

    
    static let InitializeDate = "InitializeDate"
    
//    static let SAVE_SCRIPT_ERR_SP = "_SCASaveMobileAppScriptErrReport"
    
    //share json data
    static let SHARE_QUERY_SP = "_SCAMobileMsgQuery"
    static let SHARE_SAVE_SP = "_SCAMobileMsgSave"
    static let DEVELOPMENT_BUNDLE_ID = "kr.co.ksystem.MobileERP"
    static let PRODUCTION_BUNDLE_ID = "com.store.YLW.MobileERP"
    static let ANDROID_BUNDLE_ID = "kr.co.ksystem.forms"
    static let SHAREURL_LINK = "https://www.ksystems.co.kr/?ylwseq="
    static let DYNAMIC_LINK_DOMAIN =  "eew4k.app.goo.gl"
    static let CUSTOM_SCHEME = "ylwMobileErp"
    static let APPSTORE_ID = "1130920848"
   
    //0822 beacon
    static let BEACON_STATUS = "BEACON_STATUS"
    static let BEACON_STATUS_ENTER = true
//    static let BEACON_STATUS_STAY = 1
    static let BEACON_STATUS_EXIT = false
//    static let BEACON_STATUS_NONE = "BEACON_STATUS_NONE"
//    static let BEACON_STATUS_ENTER = "BEACON_STATUS_ENTER"
//    static let BEACON_STATUS_STAY = "BEACON_STATUS_STAY"
    //    static let BEACON_STATUS_EXIT = "BEACON_STATUS_EXIT"
    
    //0905 beacon
    static let BEACONKEY = "_YLWBEACON_"
    static let BEACON_LastUpdateTime = "\(BEACONKEY)LastUpdateTime"
    static let BEACON_UpdateTime = "\(BEACONKEY)UpdateTime"
    static let BEACON_LastEvent = "\(BEACONKEY)LastEvent"
    static let BEACON_TimeKeyList = "\(BEACONKEY)TimeKeyList"
    
    //0919 change password
    static let SERVICE_EXECUTESQLCOMMAND_DBTYPE_JSON = "ExecuteSqlCommandDBTypeMobileApp_json"
    static let SERVICE_EXECUTESQLCOMMAND_DBTYPE = "ExecuteSqlCommandDBTypeMobileApp"
    static let SERVICE_EXECUTE_CHANGE_PASSWORD_JSON = "ExecuteChangePassWordMobileApp_json"
    static let SERVICE_EXECUTE_CHANGE_PASSWORD = "ExecuteChangePassWordMobileApp"
    static let _SCAGetPolicy = "_SCAGetPolicy"
//    serverDllVersion = 1 : added password authentication so user can register pattern in lockscreen. 패스워드확인(인증)
//    serverDllVersion = 2 : added companity, added bio
    static let SERVER_DLL_VERSION = "ServerDllVersion"
    static let IsUsePwdChange = "IsUsePwdChange"
    static let LOGIN_PW_EXPIRED = "LOGIN_PW_EXPIRED"
    
    //1120 companyName
    static  var LOGIN_COMPANYNAME = "LOGIN_COMPANYNAME";
    
    //1128 file service sp name
    static var AttachFileSave = "_SCAAttachFileSave";
    static var AttachFileConstQuery = "_SCAAttachFileConstQuery"
    static var AttachFileDownHistorySave = "_SCAAttachFileDownHistorySave"
    static var AttachFileQuery = "_SCAAttachFileQuery"
    
    // 17.12.01 dpjang
    static var FB_SESSION_TBL = "_FireBaseSession";
    static var FB_SESSION_COLUMN = "key";
    static var FB_SESSION_PREF = "FireBaseSession_KEY";
    
    //17.11.24 dpjang
    static let SERVICE_GETLOGINWITHFIREBASE = "GetLoginWithFbMobileApp";
    static let SERVICE_GETCERTLOGINWITHFIREBASE = "GetCertLoginWithFbMobileApp";
    
    //17.12.01 hwon
    static let COMPANITY_SERVER_ID = "ServerID"

    //171213
    static let FileServiceURL = "FileServiceUrl"
    //181017
    static let NotiServiceURL = "NotiServiceUrl"

    static let EMPINFO_LASTDATETIME = "EmpInfo_LastDateTime";
    static let SAVE_TOKEN_SP = "_SCAMobileDeviceTokenSave";
    static let GET_COMPANITY_USERINFO_SP = "_SCAMobileUserInfoQuery";

    //180131
    static let LOGO_bizroad = "bizroad_logo";
    static let LOGO_ksystem = "ksystem_logo";
    
    //        SK 도메인 전달드립니다.
    //            * 개발서버
    //            - IP: http://169.56.80.133
    //        - 도메인 : https://erpseed.cloudz.co.kr/
    //
    //        * Live 서버
    //        - IP: http://169.56.90.117
    //        - 도메인 : https://erp.cloudz.co.kr
    static let SK_cloudz_domain = "cloudz.co.kr"
    static let SK_cloudz_dev_ip = "http://169.56.80.133"
    static let SK_cloudz_live_ip = "http://169.56.90.117"
    
    //180201
    static let bizroad_ThemeColor = "#fa6f00"
    static let ksystem_ThemeColor = "#56b95b"

    static let USER_FB_ID = "UserFBId"
    static let SAVE_FBID_SP = "_SCAMobileSaveUserFbId"
    
    //18.02.08 skyung fb account
    static let FB_ID = "FbId";
    static let FB_EMAIL = "FB_Email";
    static let FB_PASSWORD = "FB_Password";
    static let QUERY_FB_ACCOUNT_SP = "_SCAMobileUserFbAccountSaveAndQuery";
    static let IS_USE_FB_AUTH = "IsUseFBAuth";
    
    //LockScreen
    //정책
    static let IsUseBio = "IsUseBio"
    static let IsPatternEnabled = "IsPatternEnabled" // 20180111 PatternYN -> IsPatternEnabled osbaek
    static let IsBioEnabled = "IsBioEnabled"
    
    //180124
    static let SERVICE_EXECUTE_CHECKPASSWORD = "ExecuteCheckPassWordMobileApp"
    static let SERVICE_EXECUTE_CHECKPASSWORD_JSON = "ExecuteCheckPassWordMobileApp_json"
    
    //180129
    static let IS_LOGIN = "is_login"
    
    //180411 Analytics constants Sunil
    
    
    
    //Events For UISettings
    static let EventUISettingsBtnClicked = "UISettingsClicked";
    static let passwordChanged = "PasswordChanged";
    static let EventTextSizeOpened = "UISettingsTextSizeOpened";
    static let EventTextSizeSelected = "UISettingsTextSizeSelected";
    static let ControlCountPortraitOpened = "ControlCountPortraitOpened";
    static let ControlCountPortraitSelected = "ControlCountPortraitSelected";
    static let ControlCountLandscapeOpened = "ControlCountLandscapeOpened";
    static let ControlCountLandscapeSelected = "ControlCountLandscapeSelected";
    static let ColumnCountOpened = "ColumnCountOpened";
    static let ColumnCountSelected = "ColumnCountSelected";
    static let CodehelpItemCountOpened = "CodehelpItemCountOpened";
    static let CodehelpItemCountSelected = "CodehelpItemCountSelected";
    static let EventColorOpened = "UISettingsColorOpened";
    static let EventColorSelected = "UISettingsColorSelected";
    static let PatternLockSelected = "PatternLockSelected";
    static let BiometricLockSelected = "BiometricLockSelected";
    
    //Event Parameters for UISettings
    static let SelectedFontSizeKey = "Selected_Font_Size"
    static let ControlCountPortraitKey = "Control_Count_Portrait"
    static let ControlCountLandKey = "Control_Count_Landscape"
    static let ColumnCountKey = "Column_Count"
    static let CodehelpItemCountKey = "Codehelp_Item_Count"
    static let SelectedColorKey = "Selected_Color"
    static let UsePattern = "Using_Pattern"
    static let NotUsePattern = "Not_Using_Pattern"
    
    //Events for Sheet
    static let SheetExpanded = "SheetExpanded"
    static let SheetSettingChanged = "SheetSettingChanged"
    
    //Program Header button Events
    static let SetPgmFavoriteFromHeader = "SetPgmFavoriteFromHeader"
    static let RemovePgmFavoriteFromHeader = "RemovePgmFavoriteFromHeader"
    static let ShareDataFromHeader = "ShareDataFromHeader"
    static let PgmSettingOpened = "PgmSettingOpened"
    static let PgmSettingChanged = "PgmSettingChanged"
    static let DataCaptureFromHeader = "DataCaptureFromHeader"
    static let SetDataCaptureValue = "SetDataCaptureValue"
    
    //Logout Event
    static let LogOutEvent = "LogOutEvent"
    static let LogInEvent = "LogInEvent"
    
    //PgmExecuteEvents
    static let EventFormOpen = "FormOpen"
    static let EventFormOpenDemo = "FormOpenDemo"
    static let EventFormEvent = "FormEvent";
    static let EventFormEventDemo = "FormEventDemo";
    
    //PgmExecuteEvent Parameters
    static let OpenedPgmName = "OpenedPgmName"
    static let FormEventName = "FormEventName";
    
    //Other Events and parameters
    static let FirebaseEventSet = "FirebaseEventSet"
    static let CodehelpInfoDialogOpened = "CodehelpInfoDialogOpened"
    static let ScannerOpenedEvent = "ScannerOpenedEvent"
    static let OpenScannerAuto = "AutoOpen"
    static let OpenScannerManual = "OpenFromButtonClick"
    static let FromControlSettings = "From_Control_Setting"

    static let EventOrigin = "EventOrigin"
    static let OpenTypeDemo = "FromDemo";
    static let OpenTypeNormal = "FromProgram";
    
    
    //GroupWare constants
    static let GROUPWARE_SERVICE_URL = "GroupWareUrl"
    static let GW_APP = "GWApp"
    static let GW_VIEW = "GWView"

    //180516 hwon.kim
    //for org
    static let FILESERVICE_ORG_PROFILE_UPLOAD_PATH = "\\Org\\Profile\\"
    static let FILESERVICE_ORG_THUMB_UPLOAD_PATH = "\\Org\\Thumbnail\\"
    static let FILESERVICE_ORG_BACKGROUND_UPLOAD_PATH = "\\Org\\Background\\"
    
    struct ORG_FILE_TYPE {
        static let PROFILE = "PROFILE"
        static let THUMB = "THUMB"
        static let BACKGROUND = "BACKGROUND"
        static let ALL = "ALL"
    }
    
    //180523 Download\\
    static let ORG_THUMBNAIL_DIR = "MobileERP/Org/ThumbNail";
    static let ORG_PROFILE_DIR = "MobileERP/Org/Profile";
    static let ORG_BACKGROUND_DIR = "MobileERP/Org/Background";
    
    static let FILESERVICE_COMPANITY_BACKGROUND_DOWNLOAD_PATH = "\\Companity\\"
    static let COMPANITY_BACKGROUND = "COMPANITY_BACKGROUND"
    
    static let FIRST_VISIBLE_PGMSEQ = "FirstVisiblePgmSeq"
    
    
    
    //Sunil 2019.07.12
    static let REQUEST_VERIFICATION_SERVICE = "RequestVerificationMobileApp_json"
    static let VERIFY_CODE_SERVICE = "CheckVerificationMobileApp_json"
    
    static var DEVICE_TOKEN = "token"
}
