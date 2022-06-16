//
//  StringConstants.swift
//  MobileERP
//
//  Created by Nikesh Jha on 10/12/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import Foundation

open class StringConstants{
    static let YLWDateKb_KeyList = [["1","2","3",NSLocalizedString("First day", comment: "First day"),NSLocalizedString("Last day", comment: "Last day")],["4","5","6","Year","Month"],["7","8","9","Day","←"],[NSLocalizedString("increase", comment: "increase"),NSLocalizedString("decrease", comment: "decrease"),"0",NSLocalizedString("Date", comment: "Date"),NSLocalizedString("Today", comment: "Today"),NSLocalizedString("Enter", comment: "Enter")]]
    
//    static let YLWNumberkb_KeyList = [["7","8","9","*","/"], ["4","5","6","+","-"], ["1","2","3","=","←"], ["00","0",".","Enter"]]
    
    static let YLWNumberkb_KeyList = [["1","2","3","*","/"], ["4","5","6","+","-"], ["7","8","9","=","←"], ["00","0",".",NSLocalizedString("Enter", comment: "Enter")]]
    
    static let YLWYyyyMMDateKb_KeyList = [["1","4","7","10"], ["2","5","8","11"], ["3","6","9","12"], [NSLocalizedString("Year", comment: "Year"),NSLocalizedString("Year", comment: "Year"),NSLocalizedString("Enter", comment: "Enter")]]
    
    static let error = NSLocalizedString("Error", comment: "Error")
    static let success = NSLocalizedString("Success", comment: "Success")
    static let Edit = NSLocalizedString("Edit", comment: "Edit")
    
    static let Sheet_Settings = NSLocalizedString("Sheet Settings", comment: "Sheet Settings")
    
    static let Column_Name = NSLocalizedString("Column Name", comment: "Column Name")
    
    static let Fixed = NSLocalizedString("Fixed", comment: "Fixed")
    
    static let Hidden = NSLocalizedString("Hidden", comment: "Hidden")
    
    static let Sheet_Fix_limit = NSLocalizedString("Sheet Fix limit", comment: "Only 3 columns can be fixed")
    
    static let copy = NSLocalizedString("Copy", comment: "Copy")
    static let paste = NSLocalizedString("Paste", comment: "Paste")
    static let delete = NSLocalizedString("Delete", comment: "Delete")
    static let cancel = NSLocalizedString("Cancel", comment: "Cancel")
    static let controls_not_Registered = NSLocalizedString("Controls not Registered", comment: "Controls not Registered")
    static let wait_text = NSLocalizedString("Wait text", comment: "Please Wait...")
    static let noCaptureData = NSLocalizedString("NoCaptureData", comment: "There is no Captured Data.")
    static let input_mode_event_cancel = NSLocalizedString("Input mode event cancel", comment: "Cannot execute this event on input mode")
    static let pgm_loaded = NSLocalizedString("Pgm loaded", comment: "Program Already Loaded")
    static let pls_select_text = NSLocalizedString("Pls select text", comment: "There's no selected item. \n Please, select item on <b>SelectedItem</b> list") //선택된 항목이 없습니다. \n <b>보이는 항목</b>에서 선택하세요.
    
    static let noActiveRow = NSLocalizedString("NoActiveRow", comment: "There is no active row.")
    static let noCheckedRow = NSLocalizedString("NoCheckedRow", comment: "There is no checked row.")
    static let noSelectedRow = NSLocalizedString("NoSelectedRow", comment: "There is no selected row.")
    static let noDblClickedRow = NSLocalizedString("NoDblClickedRow", comment: "There is no double clicked row.")
    
    static let svc_err = NSLocalizedString("Svc err", comment: "Service error")
    static let time_out = NSLocalizedString("Time out", comment: "Time-out")
    static let time_out_retry = NSLocalizedString("Time out retry", comment: "Time-out! Try again?")
    static let data_capture_success = NSLocalizedString("Data capture success", comment: "Data captured successfully")
    static let data_limit_title = NSLocalizedString("Data limit title", comment: "Too many Queried data")
    static let data_limit_message_1 = NSLocalizedString("Data limit message 1", comment: "Total ")
    static let data_limit_message_2 = NSLocalizedString("Data limit message 2", comment: "s of data is queried. But, due to size, only ")
    static let data_limit_message_3 = NSLocalizedString("Data limit message 3", comment: "s of data is received. \nPlease change the query conditionn to receive adaptable size of data.")
    static let data_limit_message = NSLocalizedString("Data limit message", comment: " [Warning] too much data is queried. \n Please change the query condition to receive adaptable size of data. \n ")
    static let camera_not_supported = "The camera is not supported."
    
    static let NoJumpDataBlock = "No Progress Jump DataBlock"
    static let NoProgressService = "No Seq for Progress Service"
    static let noDataSet = "No DataSet"
    static let invalid_entry = "Invalid Entry"
    static let clear_confirm = "Do you want to clear all text?"
    static let notExistRow = "no data reflect"
    static let NotProperProgressService = "Not proper Progress Service"
    static let NoDataToJump = NSLocalizedString("NoDataToJump", comment: "No Data to jump!")
     static let noQueryData = NSLocalizedString("noQueryData", comment: " There is no queried item ")
    
    static let sheetSettingFixedColumnsIssue = NSLocalizedString("sheetSettingFixedColumnsIssue", comment: " Too many records are there in grid, creating fixed columns will cause instability to the sheet functionality ")

    static let multiCombo_selectedValueConfirm =  NSLocalizedString("multiCombo_selectedValueConfirm", comment: "Do you want to apply the selected values?")
    static let multiCodehelp_resetValuesConfirm = NSLocalizedString("multiCodehelp_resetValuesConfirm", comment: "Prompt dialog asking user to reset all the selected values for current codehelp component")
    
    
    //       <!-- chart setting -->
    static let Chart_select_hint = "Select Chart Type"
    static let Chart_select_date = "Select the basic date"
    static let Chart_select_quantity = "Select quantity column"
    static let Chart_select_group = "Select item group"
    static let sheet = "Sheet"
    static let barChart = "Bar Chart"
    static let lineChart = "Line Chart"
    static let pieChart = "Pie Chart"
    static let areaChart = "Area Chart"
    static let bubbleChart = "Bubble chart"
    static let chooseAxis = "Choose axis"
    static let etcHeader = "Etc Content"

    
    //line chart
    static let chooseDate = "Choose Date"
    
    // bar chart
    static let multiplebarchart_default_title = "Index Values"
    
    
    /** osbaek added **/
    
    static let YLWDateKbCtrlSetting_KeyList = [[NSLocalizedString("Before 1 year", comment: "Before 1 year"),NSLocalizedString("Before 1 month", comment: "Before 1 month"),NSLocalizedString("Before 1 week", comment: "Before 1 week"),NSLocalizedString("Before 1 day", comment: "Before 1 day")], [NSLocalizedString("After 1 year", comment: "After 1 year"),NSLocalizedString("After 1 month", comment: "After 1 month"),NSLocalizedString("After 1 week", comment: "After 1 week"),NSLocalizedString("After 1 day", comment: "After 1 day")], [NSLocalizedString("First Month", comment: "First Month"),NSLocalizedString("First day", comment: "First day"),NSLocalizedString("The very date", comment: "The very date"),NSLocalizedString("date dialog", comment: "date dialog")], [NSLocalizedString("Last month", comment: "Last month"),NSLocalizedString("Last day", comment: "Last day"),"Back step","Enter"]]
    
    static let Control_Settings = NSLocalizedString("Control Settings", comment: "Control Settings")
    static let Control_Settings_Hidden = NSLocalizedString("Control Settings Hidden", comment: "Control Settings Hidden")
    static let Control_Settings_ColName = NSLocalizedString("Control Settings ColName", comment: "Control Settings ColumnName")
    static let Control_Settings_DefValue = NSLocalizedString("Control Settings DefValue", comment: "Control Settings Default Value")
    static let Setting = NSLocalizedString("Setting", comment: "Setting")
    static let Done = NSLocalizedString("Done", comment: "Done")

    
    //Sunil Added for Demo
    static let painList = NSLocalizedString("ERP Pain", comment: "ERP Pain")
    static let moduleList = NSLocalizedString("Modules", comment: "Modules")
    static let guide = NSLocalizedString("Guide", comment: "Guide")
    static let noscenario = "There is no Scenario data"
    static let nostep = "There is no Step data"
    static let unsuccessful = NSLocalizedString("Unsuccessful", comment: "Unsuccessful")
    static let noStep = "There is no Step Data"
    static let noScenario = "There is no scenario Data"
    static let experience = NSLocalizedString("Experience", comment: "Experience")
    static let startExperience = "Start Experience"
    static let endExperience = "End Experience"
    static let demo_save_msg = NSLocalizedString("demo_save_msg", comment: "Because it's Demo version, data can't be modified.")
    //MARK: Demo Feedback Dialog Strings
    static let demo_feedbackDialog_askingExperience = NSLocalizedString("demo_feedbackDialog_askingExperience", comment: "How was the experience?")
    static let demo_feedbackDialog_reviewAsGood = NSLocalizedString("demo_feedbackDialog_reviewAsGood", comment: "Good!")

    static let demo_feedbackDialog_reviewAsSoso = NSLocalizedString("demo_feedbackDialog_reviewAsSoso", comment: "Soso!")

    static let demo_feedbackDialog_reviewAsBad = NSLocalizedString("demo_feedbackDialog_reviewAsBad", comment: "Bad!")

    static let demo_feedbackDialog_Submit = NSLocalizedString("demo_feedbackDialog_Submit", comment: "Submit")

    static let demo_feedbackDialog_askingDetails = NSLocalizedString("demo_feedbackDialog_askingDetails", comment: "Want more details!")

    
    /*********************************
     Added by - OM PRAKASH -> START */
    
    //MARK: BUG REPORT FORM LABELS STRING
    static let BugReportForm_Label_FormHeading = NSLocalizedString("Bug Report", comment: "Form Heading")
    static let BugReportForm_Label_BugDescription = NSLocalizedString("Bug Description", comment: "Bug Description")
    static let BugReportForm_Label_Email = NSLocalizedString("Email", comment: "Email")
    static let BugReportForm_Label_PhoneNumber = NSLocalizedString("Phone Number", comment: "Phone Number")
    static let BugReportForm_Label_RequestCall = NSLocalizedString("Req Call", comment: "Request Call")
    static let BugReportForm_Label_Agreement = NSLocalizedString("Do you agree to terms?", comment: "Agreement")
    
    static let BugReportForm_Placeholder_Email = NSLocalizedString("*Email Required", comment: "Email required")
    
    static let BugReportForm_TelephoneNote = NSLocalizedString("This if may be for request call", comment: "Telephone Note")
    
    static let BugReportForm_ButtonTitle_Cancel = NSLocalizedString("Cancel", comment: "Cancel bug reporting")
    static let BugReportForm_ButtonTitle_Report = NSLocalizedString("Report", comment: "Reporting")
    
    
    
    /* by - OM PRAKASH -> END
     **********************************/
    
    //bugreportlistview
    static let bugreportlist_menutitle = NSLocalizedString("Service Reception History", comment: "Service Reception History")
    static let bugreportlist_titletext = NSLocalizedString("No Bug Report History ", comment: "There is no bug report history")
    static let bugreportlist_subtext = NSLocalizedString("Register Bug Report", comment: "You can register bug report in ERP program")
    static let bug_waiting = NSLocalizedString("ProcessStatusText_0", comment: "Waiting")
    static let bug_inprogress = NSLocalizedString("ProcessStatusText_1", comment: "In Progress")
    static let bug_done = NSLocalizedString("ProcessStatusText_2", comment: "Done")
    static let bug_doneImmediately = NSLocalizedString("ProcessStatusText_3", comment: "Done-Immediately")
    static let bug_unreplicated = NSLocalizedString("ProcessStatusText_5", comment: "Unreplicated")
    static let bug_not_supported = NSLocalizedString("ProcessStatusText_4", comment: "Not Supported")
    static let bug_other = NSLocalizedString("ProcessStatusText_6", comment: "Other")
    
    
    //detailbugreportview
    static let detailbugreport_title = NSLocalizedString("BugReportDetailTitleText", comment: "Bug Report Detail")
    static let detailbugreport_editBtnText = NSLocalizedString("BugReportUpdateText", comment: "Update")
    static let  detailbugreport_DateText = NSLocalizedString("CompletedDateText", comment: "Completed Date")
    static let detailbugreport_versiontext = NSLocalizedString("AppliedVersionText", comment: "Applied Version")
    static let detailbugreport_pgmNamePrePositionTxt = NSLocalizedString("PgmNamePrePositionText", comment: "In")
    static let unsucessful =  NSLocalizedString("Unsucessful", comment: "Unsucessful")
    static let releaseDateTitle = NSLocalizedString("ReleaseDateTitleText", comment: "Release Date Title")
    static let releaseVersionTitle = NSLocalizedString("ReleaseVersionTitleText", comment: "Release Version Title")
    
    //17.02.15 mobile demo
    static let demoStartButtonTitle = NSLocalizedString("demoStartButtonTitle", comment: "Getting Started")
    
    //17.02.15 
    static let welcome = NSLocalizedString("Welcome", comment: "Welcome")
    static let explain_start = NSLocalizedString("explain_start", comment: "If you have an account\nTry it right away.")
    static let explain_experience = NSLocalizedString("explain_experience", comment: "ERP, Why hesitate?\nExperience and Resolve.")
    
    static let data_changed_check_1 = NSLocalizedString("data_changed_check_1", comment: "Content has changed. Would you like to save it?")
    static let data_changed_check_2 = NSLocalizedString("data_changed_check_2", comment: "All input data will be lost, you still want to clear the form")
    static let alert_sheetcut = NSLocalizedString("alert_sheetcut", comment: "Are you sure you want to delete the selected row?")
    static let alert_before_save = NSLocalizedString("alert_before_save", comment: "Do you want to save?")
    static let alert_after_save = NSLocalizedString("alert_after_save", comment: "It has been saved.")
    static let alert_before_delete = NSLocalizedString("alert_before_delete", comment: "Are you sure you want to delete?")
    static let alert_after_delete = NSLocalizedString("alert_after_delete", comment: "It has been deleted.")
    static let login_demo_txt = NSLocalizedString("login_demo_txt", comment: "login_demo_txt_en")
    static let serverSettingChangedMsg = NSLocalizedString("serversetting_changed", comment: "Server setting will be changed. Do you want to continue?")
    static let shareWaitMessage = NSLocalizedString("shareWaitMessage", comment: "Preparing data for sharing, please wait")
    static let shareSuccessfulMessage = NSLocalizedString("shareSuccessfulMessage", comment: "Program data on ERP is shared")
    static let loginText = NSLocalizedString("Login Text", comment: "Login")
    
    

    //18.08.31
    static let apiOpenError = NSLocalizedString("apiOpenError", comment: "This is unavailable.")
    
    //0919 change password
    static let password_check_rules_msg = NSLocalizedString("password_check_rules_msg", comment: "Please check password rules.")
    static let password_no_respond_msg = NSLocalizedString("password_no_respond_msg", comment: "Server not responding.")
    static let password_check_loginpassword_msg = NSLocalizedString("password_check_loginpassword_msg", comment: "Please check your login password.")
    static let password_change_success = NSLocalizedString("password_change_success", comment: "Your password has been changed.")
    static let password_notmatch_msg = NSLocalizedString("password_notmatch_msg", comment: "The new password does not match.")
    static let password_encrypt_error_msg = NSLocalizedString("password_encrypt_error_msg", comment: "The password does not encrypt.")
    
    static let confirmText = NSLocalizedString("ConfirmText", comment: "Confirm")
    static let password_change_title = NSLocalizedString("password_change_title", comment: "Change Password")
    static let password_prev_text = NSLocalizedString("password_prev_text", comment: "Previous password")
    static let password_prev_input = NSLocalizedString("password_prev_input", comment: "input previous password")
    static let password_new_text = NSLocalizedString("password_new_text", comment: "New password")
    static let password_new_input = NSLocalizedString("password_new_input", comment: "input new password")
    static let password_confirm_text = NSLocalizedString("password_confirm_text", comment: "Confirm new password")
    static let password_confirm_input = NSLocalizedString("password_confirm_input", comment: "input new password")
    static let password_rules_text = NSLocalizedString("password_rules_text", comment: "password rules")
    static let password_expired_text = NSLocalizedString("password_expired_text", comment: "Password is expired.")
    static let password_askchange_text = NSLocalizedString("password_askchange_text", comment: "Password change")
    
    //Image control .
    static let image_text = NSLocalizedString("image_text", comment: "Image")
    static let camera_text = NSLocalizedString("camera_text", comment: "Camera")
    
    //File Input control .
    static let attached_text = NSLocalizedString("attached_text", comment: "File text")
    static let fileUploading = NSLocalizedString("fileUploading", comment: "File upload status")
    static let fileDownloading = NSLocalizedString("fileDownloading", comment: "File download status")
    
    static let success_Uploading = NSLocalizedString("Success_Uploading", comment: "Success Uploading msg")
    static let success_Downloading = NSLocalizedString("Success_Downloading", comment: "Success Downloading msg")
    static let success_Deleting = NSLocalizedString("Success_Deleting", comment: "Success Deleting msg")
    
    static let error_Uploading = NSLocalizedString("Error_Uploading", comment: "Error Uploading msg")
    static let error_Downloading = NSLocalizedString("Error_Downloading", comment: "Error Downloading msg")
    static let error_Deleting = NSLocalizedString("Error_Deleting", comment: "Error Deleting msg")
    
    static let uploadLimit_Exceeded = NSLocalizedString("UploadLimit_exceeded", comment: "Upload limit exceeds msg")
    static let noFileService = NSLocalizedString("NoFileService", comment: "No File Service")
    static let noFileServerDir = NSLocalizedString("NoFileServerDir", comment: "No File Server Directory")
    
    
    //MARK: ------------- COMPANITY MODULE -----------------
    static let PinSuccessMsg = NSLocalizedString("PinnedMsg", comment: "Paper Pin Successful")
    
    static let archivesVCTitle = NSLocalizedString("ArchivesVCTitle", comment: "Archive papers")
    static let hiddenVCTitle = NSLocalizedString("HiddenVCTitle", comment: "Hidden papers")
    
    static let hidePaperSuccessMsg = NSLocalizedString("hidePaperSuccessMsg", comment: "Paper hide Successful")
    static let unhidePaperSuccessMsg = NSLocalizedString("unhidePaperSuccessMsg", comment: "Paper unhide successful")
    static let archivePaperSuccessMsg = NSLocalizedString("archivePaperSuccessMsg", comment: "Paper archive Successful")
    static let deletePaperSuccessMsg = NSLocalizedString("deletePaperSuccessMsg", comment: "Paper delete successful")
    
    static let deletePaperFailMsg = NSLocalizedString("deletePaperFailMsg", comment: "Paper delete failed")
    static let deletePaperPermissionDeniedMsg = NSLocalizedString("deletePaperPermissionDeniedMsg", comment: "Paper permission denied")
    
    static let writeToPlaceholder =  NSLocalizedString("writeToPlaceholder", comment: "Name of receipent group") //"UX Design WG"
    static let descriptionPlaceholder = NSLocalizedString("Description", comment: "Paper description")
    
    static let hashTagRegularExpression = "#(\\w+)"
    

    //FeedBackDetails
    static let All_title_text = NSLocalizedString("All", comment: "All")
    
    static let searchResultsUnavailable = NSLocalizedString("SearchResultsUnavailable", comment: "Results not found.")
    static let programSearchPlaceholder = NSLocalizedString("ProgramSearchPlaceholder", comment: "Program search keyword")
    static let myMenu = NSLocalizedString("MyMenu", comment: "My Menu Option")


    //MARK: VoteListView
    static let profileLoading = "Loading..."
    static let addVoteItem = NSLocalizedString("AddVoteItem", comment: "Adding a vote item")
    
    static let board = NSLocalizedString("Board", comment: "Board")
    static let companity = NSLocalizedString("Companity", comment: "Companity")
    static let contact = NSLocalizedString("Contact", comment: "Contact")
    static let noVoters = NSLocalizedString("noVoters", comment: "No Voters")
    static let attendance = NSLocalizedString("Attendance", comment: "Attendance")
    

    //MainDetailTableViewCell
    static let paper_moreBtnText = NSLocalizedString("More", comment: "View more")
    static let voter_info_disable_msg = NSLocalizedString("voter_info_disable_msg", comment: "Voter Information cannot be Displayed.")
    
    //SearchViewController
    static let noSearchResults = NSLocalizedString("NoResult", comment: "There is no search results.")
    
    //PaperViewController
    static let noPapers = NSLocalizedString("NoPapers", comment: "No papers.")
    
    //MARK: VoteHeaderView
    static let VoteHeader_DeadlineText = NSLocalizedString("Deadline", comment: "Deadline text")
    static let VoteHeader_multiSelection = NSLocalizedString("MultiSelection", comment: "Multiple Selection")
    static let VoteHeader_anonymousText = NSLocalizedString("AnonymousText", comment: "Anonymous Vote")
    static let VoteHeader_hideVotersText = NSLocalizedString("HideVotersText", comment: "Hide Voters")
    static let VoteHeader_hideCountText = NSLocalizedString("HideCountText", comment: "Hide Count")

    //MARK: CreateVoteView
    static let no_option_item = NSLocalizedString("NoOptions", comment: "No option items")
    static let attachment_and_no_text = NSLocalizedString("AttachmentNoText", comment: "Attachments but no text present")
    static let deadline_error = NSLocalizedString("DeadlineError", comment: "Deadline must be atleast 15 minutes more than current time.")
    static let select_closing_date_time = NSLocalizedString("SelectClosinDateTime", comment: "Please select the vote closing date and time")
    static let limit = NSLocalizedString("Limit", comment: "Limit")
    static let enterTheContent = NSLocalizedString("enterTheContent", comment: "enterTheContent placeholder")
    static let ReceiveGroup = NSLocalizedString("ReceiveGroup", comment: "Receive Group")
    static let limitGreaterThanZero = NSLocalizedString("limitGreaterThanZero", comment: "Limit Greater Than Zero")
    static let limitCannotBeEmpty = NSLocalizedString("limitCannotBeEmpty", comment: "Limit  Cannot Be Empty")
    
    static let atLeastTwoVoteOptionsRequired = NSLocalizedString("atLeastTwoVoteOptionsRequired", comment: "AtLeast Two Vote Options Required")
    static let NoOptions = NSLocalizedString("NoOptions", comment: "No option items")
    static let AttachmentNoText = NSLocalizedString("AttachmentNoText", comment: "Attachments but no text present")
    
    static let DeadlineError = NSLocalizedString("DeadlineError", comment: "Deadline must be atleast one hour more than current time.")
    
    static let SelectClosinDateTime = NSLocalizedString("SelectClosinDateTime", comment: "Please select the vote closing date and time")
    static let and = NSLocalizedString("and", comment: "and")
    static let other = NSLocalizedString("other", comment: "other")
    static let others = NSLocalizedString("others", comment: "others")
    static let andOthers = NSLocalizedString("andOthers", comment: "and others")
    
    //VoteDatePickerView 
    static let dateAlreadySelected = NSLocalizedString("DateSelected", comment: "Date already selected")
    static let minDateToday = NSLocalizedString("MinDayToday", comment: "Minimum day is today")

    //Paper and Vote attachments errors
    static let urlLoadError = NSLocalizedString("UrlLoadError", comment: "Cannot load URL!")

    //email singup and signin
    static let email_already_linked = NSLocalizedString("EmailAlreadyLink", comment: "This email id is linked with another account")
    
    //MARK: ChooseReceiverViewController
    static let selectReceivers = NSLocalizedString("selectReceivers", comment: "select recipients")
    static let receiverLblTxt = NSLocalizedString("receiverLblTxt", comment: "Recepient text")
    static let receiverSearchPlaceHolderText =  NSLocalizedString("receiverSearchPlaceHolderText", comment: " receipent group placeholder text")
    static let recentUsersTxt = NSLocalizedString("recentUsersTxt", comment: "Recent receipients")
    static let allUsersText = NSLocalizedString("allUsersText", comment: "All Users")
    
    //edit paper
    static let updatePaperConfirmMsg = NSLocalizedString("updatePaperConfirmMsg", comment: "Paper update congirmation dialog")
    static let updatePaperSuccessMsg = NSLocalizedString("updatePaperSuccessMsg", comment: "Paper update successful")
    static let updatePaperWithMissingAttach = NSLocalizedString("updatePaperWithMissingAttach", comment: "Paper update successful with missing attachment")
    static let paperNotChangeMsg  = NSLocalizedString("paperNotChangeMsg", comment: "No Changes made.")
    static let votePaperEditNotAllowed  = NSLocalizedString("votePaperEditNotAllowed", comment: "cannot edit vote paper")
    static let paperEditByOwnerMsg = NSLocalizedString("paperEditByOwnerMsg", comment: "Only sender can edit paper")
    static let editPaperTitleTxt = NSLocalizedString("editPaperTitleTxt", comment: "edit paper title text")
    
    static let changedFingerprint = NSLocalizedString("changedFingerprint", comment: "The fingerprint is changed on the device.")
    
    //Employee List View
    static let noEmployeeData = NSLocalizedString("noEmployeeData", comment: "No employees found.")
    
    //PhotoChangeView
    static let org_empinfo_dialog_profilephoto = NSLocalizedString("ProfilePhoto", comment: "Profile photo")
    static let org_empinfo_dialog_album_choice = NSLocalizedString("AlbumPhoto", comment: "Choice photo in album.")
    static let org_empinfo_dialog_camera = NSLocalizedString("TakePhoto", comment: "Take photo")
    static let org_empinfo_dialog_init = NSLocalizedString("DeleteMyPhoto", comment: "Delete my photo")
    static let org_empinfo_dialog_backgroundphoto = NSLocalizedString("BackgroundPhoto", comment: "Background photo")
    
    //Map Viewcontroller
    static let mapTitleMsg = NSLocalizedString("mapTitleMsg", comment: "Map Title Text")
    static let mapSearchBoxPlaceHolderMsg = NSLocalizedString("mapSearchBoxPlaceHolderMsg", comment: "Map Search Box empty text")
    static let selectLocation = NSLocalizedString("selectLocation", comment: "Select a location")
    static let unknownLocation = NSLocalizedString("unknownLocation", comment: "Unknown location")
    
    //ArchiveViewController
    static let unarchiveAllPaperConfirmMsg = NSLocalizedString("unarchiveAllPaperConfirmMsg", comment: "all instance of archive paper delete message ")
    static let unarchiveConfirmMsg = NSLocalizedString("unarchiveConfirmMsg", comment: "archive paper delete  message")
    
    //EmpProfileManageViewController
    static let  org_profile_ment = NSLocalizedString("ProfileDefaultMsg", comment: "Please register profile message.")
    
    static let org_member_detail = NSLocalizedString("OrgMemberDetail", comment: "Member details")
    // Path for file server
    static let companity_paperAttachments_path = "\\Companity\\PaperAttachments\\"
    static let companity_voteAttachments_path = "\\Companity\\VoteAttachments\\"
   
    
    //mainviewcontroller
    static let companyName = NSLocalizedString("companyName", comment: "Company Name")

    //AttachmentPreviewController
    static let attachmentPreviewTitleTxt = NSLocalizedString("attachmentPreviewTitleTxt", comment: "Title Text")

    static let paperNotiTitle = NSLocalizedString("paperNotiTitle", comment: "Paper Notification Title")
    static let currentUser = NSLocalizedString("currentUser", comment: "me")
    
    static let dateFormatLocalizedCompanity = NSLocalizedString("dateFormatLocalizedCompanity", comment: "date format for companity")
    static let dateTimeFormatLocalizedCompanity = NSLocalizedString("dateTimeFormatLocalizedCompanity", comment: "date time format for companity")
    
    //AddVoteItemView
    static let addVoteItemRequestText = NSLocalizedString("addVoteItemRequest", comment: "Please add VoteItem first.")
    
    static let deletePaperAlert = NSLocalizedString("deletePaperAlert", comment: "Do you want to delete the paper?")
    
    static let selectAll = NSLocalizedString("all", comment: "Select All")
    
    //SeenUnSeenUserListVC
    static let SeenUnSeenUserListTitleTxt = NSLocalizedString("SeenUnSeenUserListTitleTxt", comment: "Seen/UnSeen User List")
    static let SeenTabLblTxt = NSLocalizedString("SeenTabLblTxt", comment: "Seen")
    static let UnSeenTabLblTxt = NSLocalizedString("UnSeenTabLblTxt", comment: "UnSeen")
    static let RemarksLblTxt = NSLocalizedString("RemarksLblTxt", comment: "Remarks")
    static let selectedPeopleCounttxt = NSLocalizedString("selectedPeopleCounttxt", comment: "Selected People Count")
    static let totalPeopleCountTxt = NSLocalizedString("totalPeopleCountTxt", comment: "total people count")
    static let selectAllBtnTxt = NSLocalizedString("selectAllBtnTxt", comment: "Select All")
    static let unSelectAllBtnTxt = NSLocalizedString("unSelectAllBtnTxt", comment: "UnSelect All")
    static let resendBtnTxt = NSLocalizedString("resendBtnTxt", comment: "resend")
    static let voteText = NSLocalizedString("voteText", comment: "Vote text")
    static let selectedUserNotifyTxt = NSLocalizedString("selectedUserNotifyTxt", comment: "Selected user notified")
    
    static let readTxt = NSLocalizedString("readTxt", comment: "Read")
    static let unReadTxt = NSLocalizedString("unReadTxt", comment: "Unread")
    static let receiverTxt = NSLocalizedString("receiverTxt", comment: "Receiver Count")

    static let newPapers = NSLocalizedString("newPapers", comment: "New Papers")
    static let officialAllTxt = NSLocalizedString("officialAllTxt", comment: "All")
    
    static let modifiedText = NSLocalizedString("modifiedTxt", comment: " - modified")
    static let schedule_modifiedText = NSLocalizedString("schedule_modifiedText", comment: " - schedule modified")
    static let deadline_modifiedText = NSLocalizedString("deadline_modifiedText", comment: " - deadline modified")
    static let deleteAttachment = NSLocalizedString("delete_attachment", comment: "delete success")
    
    //ReceiversListVC
    static let ReceiverListTitle = NSLocalizedString("ReceiverListTitle", comment: "ReceiverList")
    
    //CompanityPhotoRegisterVC
    static let photoUploadWithMissingAttach = NSLocalizedString("photoUploadWithMissingAttach", comment: "Some photos upload failed")
    static let photoUploadSuccess = NSLocalizedString("photoUploadSuccess", comment: "photo uploaded successfully")
    static let deletePhotoConfirm = NSLocalizedString("deletePhotoConfirm", comment: "Are you sure you want to delete photos?")
    
    //ReceiverInterfaceChooseView
    static let ContactListText = NSLocalizedString("ContactListText", comment: "Contact List")
    static let OrgChartTitleTxt = NSLocalizedString("OrgChartTitleTxt", comment: "Organization Chart")
    
    static let LogoutConfirmMsg = NSLocalizedString("LogoutConfirmMsg", comment: "Log out will prevent you from receiving message notifications.\nAre you sure you want to log out?")
    
    
    // ScheduleRegisterView
    static let noEventTitle = NSLocalizedString("noEventTitle", comment: "No Event Title")
    static let invalidScheduleDate = NSLocalizedString("invalidScheduleDate", comment: "Invalid Schedule Date")
    static let inputStartDate = NSLocalizedString("inputStartDate", comment: "Input Start Date")
    static let inputEndDate = NSLocalizedString("inputEndDate", comment: "Input End Date")
    static let inputStartTime = NSLocalizedString("inputStartTime", comment: "Input Start Time")
    static let inputEndTime = NSLocalizedString("inputEndTime", comment: "Input End Time")
    
    static let inputGreaterEndDateTime = NSLocalizedString("inputGreaterEndDateTime", comment: "Input Greater End Time")
    static let inputGreaterThanCurrentTime = NSLocalizedString("inputGreaterThanCurrentTime", comment: "Input Greater End Time")
    
    static let attendOptionNotSelected = NSLocalizedString("attendOptionNotSelected", comment: "Attend Option Not Selected")
    
    static let scheduleInUse = NSLocalizedString("scheduleInUse", comment: "Already Schedule added")
    
    static let attending = NSLocalizedString("attending", comment: "attending")
    static let notAttending = NSLocalizedString("notAttending", comment: "notAttending")
    static let late = NSLocalizedString("late", comment: "late")
    static let early = NSLocalizedString("early", comment: "early")
    
    
    static let enterEventTitle = NSLocalizedString("enterEventTitle", comment: "Enter Event")
    static let allDay = NSLocalizedString("allDay", comment: "All Day")
    static let chooseAttend = NSLocalizedString("chooseAttend", comment: "Choose Attend")
    static let enterRemarks = NSLocalizedString("enterRemarks", comment: "Enter Remarks")
    static let noPlaceText = NSLocalizedString("noPlaceText", comment: "Place")
    
    static let calenderAccessNotGranted = NSLocalizedString("calenderAccessNotGranted", comment: "access not granted")
    
    //SelectDepartmentVC
    static let noMembersInDept = NSLocalizedString("noMembersInDept", comment: "No Members In Dept")
    
    // Companity Login
    static let serverSettingTitle = NSLocalizedString("serverSettingTitle", comment: "Server connection information")
    static let serverSettingSubtitle = NSLocalizedString("serverSettingSubtitle", comment: "Please set up connection information.")
    
    // SubModuleTableViewCell
    static let recentAndFavorites = NSLocalizedString("recentAndFavorites", comment: "Recent And Favorites")
    static let noModulesAvailable = NSLocalizedString("noModulesAvailable", comment: "No Modules Available")

}

//CreatVote
struct Vote {
    static let option = NSLocalizedString("Option", comment: "Option")
    static let detailTxtViewPlaceHolderTxt = NSLocalizedString("VoteDetailPlaceHolderTxt", comment: "vote paper Description PlaceHolder text")
    
    static let voteConfirmTitle = NSLocalizedString("VoteConfirmTitle", comment: "vote confirmation")
    static let closeVoteConfirmTitle = NSLocalizedString("CloseVoteConfirmTitle", comment: "vote close confirmation")
    
    static let voteConfirmMsg = NSLocalizedString("VoteConfirmMsg", comment: "vote confirmation")
    static let closeVoteConfirmMsg = NSLocalizedString("CloseVoteConfirmMsg", comment: "vote close confirmation")
    
    static let cannotCloseVote = NSLocalizedString("cannotCloseVote", comment: "vote close not allowed")
    
    static let voteClosed = NSLocalizedString("voteClosed", comment: "vote closed")
    static let eventClosed = NSLocalizedString("eventClosed", comment: "event closed")
    static let deadlineCrossed = NSLocalizedString("deadlineCrossed", comment: "Deadline Crossed")
    static let readOnly_cantVote = NSLocalizedString("readOnly_cantVote", comment: "read only cant vote")
    static let noTitleInVoteItem = NSLocalizedString("noTitleInVoteItem", comment: "no Title In VoteItem")
    
    static let voteLimitExceeded = NSLocalizedString("voteLimitExceeded", comment: "Vote Limit Exceeded")
}

//MARK: Companity
struct FirebaseSignupAndLoginMessages {
    static let emailFieldEmpty = NSLocalizedString("EmailFieldEmpty", comment: "Email Field Empty")
    static let emailInvalid = NSLocalizedString("EmailInvalid", comment: "Email Invalid")
    
    static let passwordEmpty = NSLocalizedString("PasswordEmpty", comment: "Password Empty")
    static let passwordMismatch = NSLocalizedString("PasswordMismatch", comment: "Password Mismatch")

    static let loginCredentialsWrong = NSLocalizedString("LoginCredentialsWrong", comment: "Wrong Login Credentials")
    
}

struct CreateWriteMsg {
    static let requestPaperDescription = NSLocalizedString("RequestPaperDescription", comment: "Request Paper Description")
    static let requestMembers = NSLocalizedString("RequestMembers", comment: "Request Members")
    static let imageUploadFailed = NSLocalizedString("ImageUploadFailed", comment: "Image Upload Failed")
    static let serverNotReachable = NSLocalizedString("ServerNotReachable", comment: "Server Not Reachable")
    static let paperCreateSuccess = NSLocalizedString("PaperCreateSuccess", comment: "Paper Create Success")
    static let paperCreatedWithMissingAttach = NSLocalizedString("paperCreatedWithMissingAttach", comment: "Some items upload failed")
    static let createPaperTitleTxt = NSLocalizedString("createPaperTitleTxt", comment: "create paper title text")
}

struct Feedback {
    //FeedbackEmoBarView
    static let good = NSLocalizedString("good", comment: "Good feedback!")
    static let confirm = NSLocalizedString("confirm", comment: "Confirmed feedback!")
    static let celebrate = NSLocalizedString("celebrate", comment: "Celebrate feedback!")
    static let sad = NSLocalizedString("sad", comment: "Sad feedback!")
    static let neutral = NSLocalizedString("neutral", comment: "Neutral feedback!")
}

struct FeedbackDBValue {
    //Feedback Value from Database
    static let good = "Good"
    static let confirm = "Confirm"
    static let celebrate = "Celebrate"
    static let sad = "Sad"
    static let neutral = "Neutral"
}

struct FeedBackValue {
    static let  ALL = 0
    static let  Good = 1
    static let  Confirm = 2
    static let  Celebrate = 3
    static let  Sad = 4
    static let  Neutral = 5
}

struct FeedbackImgSmall {
    //Feedback Icon image name
    static let good = "icon_good_small"
    static let confirm = "icon_check_small"
    static let celebrate = "icon_celebrate_small"
    static let sad = "icon_sad_small"
    static let neutral = "icon_go_small"
}

//For floating action buttons
struct FloatingActionButtonsTitle {
    //Feedback Icon image name
    static let notice = NSLocalizedString("Notice", comment: "Notice")
    static let create = NSLocalizedString("Create", comment: "Create")
    static let official = NSLocalizedString("Official", comment: "Official Board")
    static let vote = NSLocalizedString("Vote", comment: "Vote")
    static let choose = NSLocalizedString("Choose", comment: "Choose between two")
    static let schedule = NSLocalizedString("Schedule", comment: "Schedule Paper")
}

struct MainPaperType {
    //FeedbackEmoBarView
    static let all = NSLocalizedString("AllPaper", comment: "All papers")
    static let received = NSLocalizedString("ReceivedPaper", comment: "All received papers")
    static let official = NSLocalizedString("OfficialPaper", comment: "Official papers")
    static let iWrote = NSLocalizedString("IWrotePaper", comment: "Self written papers")
    static let hidden = NSLocalizedString("Hidden", comment: "Hidden")
    static let archive = NSLocalizedString("Archive", comment: "Archive")
}

struct MainPaperCellAction {
    //FeedbackEmoBarView
    static let archive = NSLocalizedString("Archive", comment: "Archive")
    static let unArchive = NSLocalizedString("Unarchive", comment: "Unarchive")
    static let hide = NSLocalizedString("Hide", comment: "Hide paper")

    static let unhide = NSLocalizedString("Unhide", comment: "Unhide paper")
    static let copyAndWrite = NSLocalizedString("CopyAndWrite", comment: "Copy and write")

    static let copyAndCreate = NSLocalizedString("CopyAndCreate", comment: "Copy and create paper")
    static let replyPaper = NSLocalizedString("replyPaper", comment: "Reply paper")
    static let edit = NSLocalizedString("Edit", comment: "Edit paper")
    static let delete = NSLocalizedString("Delete", comment: "Delete paper")

}

struct AlertTitle {
    static let alert = NSLocalizedString("Alert", comment: "Title")

    static let yes = NSLocalizedString("YES", comment: "yes")
    static let ok = NSLocalizedString("Ok", comment: "ok")
    static let confirm = NSLocalizedString("ConfirmText", comment: "confirm")

    static let no = NSLocalizedString("NO", comment: "no")
    static let cancel = NSLocalizedString("Cancel", comment: "cancel")

    
    static let mapPicker = NSLocalizedString("MapPicker", comment: "Map picker")
    static let mapAccessMsg = NSLocalizedString("MapAccessMsg", comment: "Map Access permission")

    
    static let imagePicker = NSLocalizedString("ImagePicker", comment: "Image picker")
    static let imageAccessMsg = NSLocalizedString("ImageAccessMsg", comment: "Image Access permission")
    
    static let videoPicker = NSLocalizedString("VideoPicker", comment: "Video picker")
    static let videoAccessMsg = NSLocalizedString("VideoAccessMsg", comment: "Video Access permission")
    
    static let noCamera = NSLocalizedString("NoCamera", comment: "No Camera Title")
    static let noCameraMsg = NSLocalizedString("NoCameraMsg", comment: "No Camera Message")
    
    static let pleaseWait = NSLocalizedString("PleaseWait", comment: "Please wait...")
    
    static let videoSaveSuccessMsg = NSLocalizedString("VideoSaveSuccessMsg", comment: "Video was successfully saved")
    static let videoCorrupt = NSLocalizedString("VideoCorrupt", comment: "Video corrupt")
    static let videoUnavailableMsg = NSLocalizedString("VideoUnavailableMsg", comment: "Video unavailable message")
    
    static let officialReceiversDisabled = NSLocalizedString("officialReceiversDisabled", comment: "Official Paper receivers diabled")
 
}

struct VoteVisibility {
    static let defaultVal = 0
    static let secret = 1
    static let hideVoter = 2
    static let hideCount = 3
}

//Companity DB Node Names
struct CompanityDB {
    struct Companity {
        static let root = "Companity"

        static let photo = "photo"
    }
    
    struct CompanyToHash {
        static let root = "CompanyToHash"
    }
    
    struct MessageReceivers {
        static let root = "MessageReceivers"
    }
    
    struct MessageToVote {
        static let root = "MessageToVote"
        
        static let voteName = "name"
        static let voters = "voters"
    }
    

    struct Papers {
        static let root = "Papers"
        
        static let attachments = "attachments"
        static let sender = "sender"
        static let text = "text"
        
        static let feedback = "feedback"

        static let voteItems = "voteItems"
        static let voteName = "name"
        static let voteCount = "count"
        static let voteLimit = "limit"
        static let voteItemType = "voteItemType"
        static let itemAttachment = "attachment"
        
        static let voteClosingTime = "voteClosingTime"
        static let updateTime = "updateTime"
        static let createdDate = "createdDate"
        
        static let multipleSelection = "multipleSelection"
        static let canAddItem = "canAddItem"
        static let visibilityType = "visibilityType"
        static let hasVoteLimit = "hasVoteLimit"

        static let location = "location"
        static let label = "label"
        static let lat = "lat"
        static let lon = "lon"
        
        static let url = "url"
        static let pageTitle = "pageTitle"
        static let pageUrl = "pageUrl"
        static let pageSnippet = "pageSnippet"
        static let pageThumbnail = "pageThumbnail"
        
        static let pending = "pending"
        
        static let remarks = "Remarks"
        static let remarkScript = "RemarkScript"
    }
    
    struct UserPapers {
        static let root = "UserPapers"
        
        //Paper types
        static let hidden = "hidden"
        static let sendReceive = "sendReceive"
        static let archive = "archive"
        
        //Paper properties
        static let fix = "fix"
        static let official = "official"
        static let receivedTime = "receivedTime"
        static let updateTime = "updateTime"
        static let hash = "hash"
        static let feedback = "feedback"
        static let feedbackSync = "feedbackSync"
        static let voted = "voted"
        static let isVoted = "isVoted"
        static let voteCount = "count"
        
        //Archived Paper properties
        static let rootPaperID = "rootPaperID"
        static let archivedTime = "archivedTime"
        static let paper = "paper"
        static let archivedCount = "archivedCount"
    }
    
    struct Users {
        static let root = "Users"
        
        static let email = "email"
        static let phoneNo = "phoneNo"
        static let userName = "userName"
        static let userPhoto = "userPhoto"
        static let userid = "userId"
        static let userSeq = "userSeq"
    }
    
    struct UserToDevice {
        static let root = "UserToDevice"
        
    }
    
    struct FbToUserKey {
        static let root = "FbToUserKey"
        
    }
    
    struct FIRE_ID_TO_YLW_ID {
         static let root = "FbUidToYlwUid"
    }
    
    struct ElasticKey {
        static let root = "ElasticKey"
    }
    
    struct referencePath {
        static let root = "referencePath"
    }
    
    struct AttachmentRefs {
        static let root = "AttachmentRefs"
    }
}

enum AttachType: Int {
    case image = 1, video = 2, map = 3, url = 4, schedule = 5
}

//Companity Storage folder Names
struct StorageFolder {
    static let photo = "Photo";
    static let thumbnail = "Thumbnail";
}

//Companity DB Node Names
struct CompanityStorage {
        static let attachments = "Attachments"
        static let thumbnail = "Thumbnail"
}

let ImageExtensionList = ["jpg","png"]
let VideoExtensionList = ["mov","mp4"]






