//
//  CommonConstants.swift
//  MobileERP
//
//  Created by Nikesh Jha on 10/30/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import Foundation
import UIKit

open class CommonConstants {
    
    /** The Constant USING_LOG for naming sharedPref File*/
    public static let USING_LOG = "UsingLog";
    /** The Constant USING_ACTION to use as key in UsingLog*/
    public static let USING_ACTION = "UsingAction";
    //    public static let NEW_LINE_SEPARATOR = "\n"
    /** The Constant USING_ACTION_SEPARATOR to use as Using Action separator*/
    public static let USING_ACTION_SEPARATOR = "~\n"
    
    public static var orgChartLevelColors = 6
    
    public static let ORG_PHOTOUPDATE_LASTUPDATETIME = "PhotoUpdateLastDateTime"
    //    public static let ORG_MYPHOTO_UPDATE_LASTUPDATETIME = "LastUpdateTime"
    public static let ORG_BACKGROUNDUPDATE_LASTDATETIME = "BackgroundUpdateLastDateTime"
    public static let ORG_BOOKMARKLIST = "Bookmark_EmpSeq"
    public static let ORG_FILENAME = "EmpSeq_"
    public static let JPG = ".jpg"
    
    //MARK: Companity
    static let maxVoteItemsToDisplay: CGFloat = 2.5
    
    // FixPaperPanel (Incoming Paper Menu)
    public static let receivedMenuData: [String] = [MainPaperType.all, MainPaperType.received, MainPaperType.official ,MainPaperType.iWrote, MainPaperType.hidden]
    //Paper action menu
    public static let paperActionMenuNames: [String] = [MainPaperCellAction.hide, MainPaperCellAction.copyAndCreate, MainPaperCellAction.replyPaper, MainPaperCellAction.edit, MainPaperCellAction.delete]
    public static let paperActionMenuImages: [String] = ["icon_more_hide", "icon_more_copy", "icon_reply", "icon_more_edit", "icon_more_delete"]
    
    // Database table names for COMPANITY
    public static let _CMPTY_Papers = "_TCAMobile_Papers";
    public static let _CMPTY_UserPapers = "_TCAMobile_UserPapers";
    public static let _CMPTY_PaperAttachments = "_TCAMobile_PaperAttachments";
    
    public static let _CMPTY_VoteItems = "_TCAMobile_VoteItems";
    public static let _CMPTY_VoteAttachments = "_TCAMobile_VoteAttachments";
    public static let _CMPTY_Voters = "_TCAMobile_Voters";
    public static let _CMPTY_Feedback = "_TCAMobile_Feedback";
    public static let _CMPTY_HashTags = "_TCAMobile_HashTags";
    
    public static let _CMPTY_Archived_UserPapers = "_TCAMobile_Archived_UserPapers";
    public static let _CMPTY_Archived_PaperAttachments = "_TCAMobile_Archived_PaperAttachments";
    public static let _CMPTY_Archived_VoteItems = "_TCAMobile_Archived_VoteItems";
    public static let _CMPTY_Archived_VoteAttachments = "_TCAMobile_Archived_VoteAttachments";
    public static let _CMPTY_Archived_Voters = "_TCAMobile_Archived_Voters";
    public static let _CMPTY_Archived_Feedback = "_TCAMobile_Archived_Feedback";
    
    
    // Strored procedure names for COMPANITY
    public static let _CMPTY_sp_getUsersInfo = "_SCAMobile_GetUsersInfo";
    public static let _CMPTY_sp_GetUserPapers = "_SCAMobile_GetUserPapers";
    public static let _CMPTY_sp_GetUserPinnedPapers = "_SCAMobile_GetUserPinnedPapers";
    public static let _CMPTY_sp_GetUserHiddenPapers = "_SCAMobile_GetUserHiddenPapers";
    public static let _CMPTY_sp_GetArchivedUserPapers = "_SCAMobile_GetArchivedUserPapers";
    public static let _CMPTY_sp_GetArchivedPaperFeedbacks = "_SCAMobile_GetArchivedPaperFeedbacks"
    
    public static let _CMPTY_sp_GetHashtexts = "_SCAMobile_GetHashtexts";
    public static let _CMPTY_sp_SearchUserPapers = "_SCAMobile_SearchUserPapers";
    
    public static let _CMPTY_sp_CreatePaper = "_SCAMobile_CreatePaper";
    public static let _CMPTY_sp_CreateVotePaper = "_SCAMobile_CreateVotePaper";
    public static let _SCAMobile_sp_CreateSchedulePaper = "_SCAMobile_CreateSchedulePaper";
    public static let _SCAMobile_UpdateSchedulePaper = "_SCAMobile_UpdateSchedulePaper";
    public static let _CMPTY_sp_ArchiveUserPaper = "_SCAMobile_ArchiveUserPaper";
    
    public static let _CMPTY_sp_SavePaperFeedback = "_SCAMobile_SavePaperFeedback";
    public static let _CMPTY_sp_GetPaper = "_SCAMobile_GetPaper"
    public static let _CMPTY_sp_VotePapers = "_SCAMobile_VotePapers"
    public static let _CMPTY_sp_UpdatePaper = "_SCAMobile_UpdatePaper";
    public static let _CMPTY_sp_DeletePaper = "_SCAMobile_DeletePaper";
    public static let _CMPTY_sp_DeleteArchivePaper = "_SCAMobile_DeleteArchivePaper";
    
    public static let _CMPTY_sp_HideUserPaper = "_SCAMobile_HideUserPaper";
    public static let _CMPTY_sp_UnHideUserPaper = "_SCAMobile_UnHideUserPaper";
    public static let _CMPTY_sp_PinUserPaper = "_SCAMobile_PinUserPaper";
    public static let _CMPTY_sp_UnPinUserPaper = "_SCAMobile_UnPinUserPaper";
    public static let _CMPTY_sp_GetPaperWithFeedback = "_SCAMobile_GetPaperWithFeedback";
    public static let _CMPTY_sp_GetVoterList = "_SCAMobile_GetVoterList";
    public static let _CMPTY_AddVoteItem = "_SCAMobile_AddVoteItem";
    public static let _CMPTY_sp_ClosePaperVote = "_SCAMobile_ClosePaperVote";
    public static let _SCAMobile_PaperSeen = "_SCAMobile_PaperSeen";
    public static let _SCAMobile_PaperSeenList = "_SCAMobile_GetPaperSeenList";
    public static let _SCAMobile_SaveCompanyBackground = "_SCAMobile_SaveCompanyBackground";
    public static let _SCAMobile_DeleteCompanyBackground = "_SCAMobile_DeleteCompanyBackground";
    public static let _SCAMobile_GetCompanyBackgroundImages = "_SCAMobile_GetCompanyBackgroundImages";
    
    public static let _SCAMobile_GetCompanyUnreadPaperCount = "_SCAMobile_GetUnreadPaperCount"
    
    public static let _CMPTY_sp_GetArchiveVoterList = "_SCAMobile_GetArchiveVoterList";
    public static let _SCAMobile_SavePaperRemarks = "_SCAMobile_SavePaperRemarks";
    public static let _SCAMobile_GetPaperRemarks = "_SCAMobile_GetPaperRemarks";
    public static let _SCAMobileQueryDemoMenu = "_SCAMobileQueryDemoMenu";
    
    public static let paperDateformat = "YYYY/MM/dd HH:mm"

    public static let voteTitleDateformat = "yyyy-MM-dd"
    public static let voteHeaderDateformat = "YYYY-MM-dd HH:mm"
    public static let voteDeadlineDateTimeFormat = "yyyy-MM-dd HH:mm:ss.SSZZZZZ"

    public static let SendToSQLDateTimeFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    public static let SQLDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    public static let SQLDateTimeFormat_short = "yyyy-MM-dd'T'HH:mm:ss"
    public static let BoardDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    public static let BoardDateTimeFormat_short = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    public static let inviteDateformat = "yyyy.MM.dd"
    public static let USER_INFO_LASTDATETIME = "UserInfoLastDateTime";

    
    // ChooseReceiverVC
    public static let RecentUserOrGroupSection = 0
    public static let AllUserSection = 1
    
    //SeenUnSeenUserListVC
    static let notifyUser = "notifyUser"
    
    public static let SCHEDULE_MODIFIED_FLAG = "1";
    public static let SCHEDULE_DEADLINE_MODIFIED_FLAG = "2";
    public static let REMARK_STATUS = "U"
    
    public static let BOOL_INTEGER_TRUE = 1
    public static let BOOL_INTEGER_FALSE = 0
    
    public static let BOOL_STRING_TRUE = "1"
    public static let BOOL_STRING_FALSE = "0"
}




















