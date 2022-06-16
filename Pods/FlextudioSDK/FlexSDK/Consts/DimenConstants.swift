//
//  DimenConstants.swift
//  MobileERP
//
//  Created by O Lim Kwon on 8/26/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import UIKit

class DimenConstants {
    
    /**
     Sunil Start
     */
    
    static let control_height: CGFloat = 52
    static let groupBox_titleBox_height: CGFloat = 44
    static let colSet_caption_text_size: CGFloat = 13.5
    static let toastHorizontalMargin: CGFloat  =   10.0
    static let toastVerticalMargin: CGFloat  =   10.0
    /**
     Sunil End
     */
    
    static let toast_bg_width: CGFloat = 330
    static let toast_bg_height: CGFloat = 80
    static let toast_lbl_width: CGFloat = 302
    static let toast_lbl_height: CGFloat = 48
    static let toast_padding: CGFloat = 12
    static let toast_lbl_width2: CGFloat = 240
    
    static let margin: CGFloat = min(SCREEN_WIDTH, SCREEN_HEIGHT)  * 3 / 100//8
    
    static let control_icon_size: CGFloat = 30
    
    static var loading_anim_size: CGFloat = 35
    static let fileStatus_gif_width: CGFloat = 140.0
    static let fileStatus_label_height: CGFloat = 24.0

    //for image control
    static let image_control_icon_size: CGFloat = 50
    
    //MARK: Companity
    //Menu Panel
    static let menuPanel_width: CGFloat = 85.0
    
    //FixPaperPanel View
    static let memberBtnWidth: CGFloat = 40.0
    
    //MainDetailTableViewCell
    static let MainDetailCell_Height: CGFloat = 452.0 - 32.0 //Subtracting Text description height initially
    static let MainDetailCell_DescriptionTextHeight: CGFloat = 108.0
    static let MainDetailCell_VoteTableHeight: CGFloat = 140.0 - 22.0 // subtracting 0.5 votteItem height to display 2.5 voteItems at max
    static let MainDetailCell_AttachmentHeight: CGFloat = 172.0
    static let MainDetailCell_MoreBtnHeight: CGFloat = 24.0
    static let MainDetailCell_BottomBarHeight: CGFloat = 30.0
    static let verticalMargin: CGFloat = 16.0
    static let leadTrailMargin: CGFloat = 16.0
    
    static let FullDetailCell_FeatureImgHeight: CGFloat = 240.0
    static let PinBtnWidth: CGFloat = 36.0

    //MainTitleInfoCell
    static let MainTitleInfoCell_Height: CGFloat = 120.0
    
    //MainBriefTableViewCell
    static let MainBriefCell_Height: CGFloat = 132.0
    static let MainBriefCell_DescriptionTextHeight: CGFloat = 50.0
    
    //VoteInfoTableViewCell
    static let VoteCell_Height: CGFloat = 40.0 + 8.0
    static let VoteAttachmentCell_height: CGFloat = 184.0
    static let CrownView_Height: CGFloat = 28.0
    static let VoteAttachment_Height: CGFloat = 140.0
    static let voteInfoCell_tickView_width: CGFloat = 16.0
    static let shadeView_minMultiplier: CGFloat = 0.0001
    
    //FeedbackEmoBarView
    static let FeedbackBarWidth: CGFloat = 330.0
    static let FeedbackBarHeight: CGFloat = 70.0
    static let FeedbackBtn_Size: CGSize = CGSize(width: 18, height: 18)
    
    //Dropdown Option
    static let IncomingPaperOption_Height: CGFloat = 32.0
    static let PaperActionOption_Height: CGFloat = 47.0
    static let DropDownOption_Width: CGFloat = 160.0
    static let ReceivedDropDown_width: CGFloat = 98.0

    //PinnedPaperCollectionViewCell
    static let PinnedCell_Dimens: CGSize = CGSize(width: 160, height: 60)
    
    //MARK: SearchViewController
    static let CloseBtn_Dimens: CGSize = CGSize(width: 9, height: 9)
    static let InsertBtn_Dimens: CGSize = CGSize(width: 9, height: 9)
    
    static let ProfileImageDimensions: CGSize = CGSize(width: 30, height: 30)

    //MARK: MainViewController
    static let SearchResultsCellHeight: CGFloat = 30.0
    static let FixPaperPanelMaxHeight: CGFloat = 168
    
    //MARK: VoteDatePicker
    static let fontForWeekDaysText: CGFloat = 11
    static let fontForDayText: CGFloat = 13

    //MARK: CreateWrite or EditWrite
    static let MediaAttachmentHeight : CGFloat = 200
    static let MediaAttachmentTopMargin : CGFloat = 10
    static let MapDetailsHeight : CGFloat = 40
    static let MapIconHeight : CGFloat = 22
    static let MapIconWidth : CGFloat = 22
    static let IconLabelMargin : CGFloat = 10
    static let CityLabelHeight : CGFloat = 20
    static let AddressLabelHeight : CGFloat = 18
    static let PlayButtonSize : CGSize = CGSize(width: 40, height: 40)
    static let UrlAttachmentHeight : CGFloat = 85
    static let UrlAttachImageDimension : CGSize = CGSize(width: 85, height: 85)
    static let UrlAttachmentLblLeadingMargin : CGFloat = 15
    static let UrlTitleLabelHeight : CGFloat = 14
    static let UrlTitleTopMargin : CGFloat = 15
    static let UrlDescriptionLabelHeight : CGFloat = 20
    static let UrlLinkLabelHeight : CGFloat = 15
    static let PlayButtonViewTagStart : Int = 1000
    static let OverlappingViewTagStart : Int = 2000
    static let PlayTimeLabelViewTagStart : Int = 3000
    static let PlayerControllerViewTagStart : Int = 4000
    static let TxtViewCombinedHeight : CGFloat = 200
    static let attachmentRemoveBtnSize : CGFloat = 32.0

    //MARK: BoardItemDetailView
    static let AttachmentViewMinHeight: CGFloat = 121.5
    static let AttachmentCellHeight: CGFloat = 39

    //FeedBackdetails
    static let FeedBackDetailCellHeight: CGFloat = 50

    //MARK VoterListView
    static let VotersProfileDefaultCollectionViewWidth: CGFloat = 50
    static let VotersProfileDefaultCollectionViewHeight: CGFloat = 86
    static let VoteItemInfoTableCellHeight: CGFloat = 189
    static let RemarksTableCellHeight: CGFloat = 84.0
    static let VotersProfileCollectionViewMinSpacing: CGFloat = 35
    
    //Create Vote
    static let OptionItemViewDefaultHeight : CGFloat = 36
    static let OptionLimitTxtDefaultWidth : CGFloat = 50
    static let OptionDatePickerViewHeight : CGFloat = 290
    static let OptionItemAttachmentImageViewWidth : CGFloat = 22
    static let LimitBtnCheckBoxWidth: CGFloat = 10
    static let LimitBtnCheckBoxHeight: CGFloat = 7.5
    
    //MARK VoteHeaderView
    static let VoteHeader_DeadlineHeight: CGFloat = 18.0
    static let VoteHeader_AnonymousLblWidth: CGFloat = 41.5
    static let VoteHeader_MultiSelectionLblWidth: CGFloat = 35.0
    static let VoteHeader_DeadlineLblWidth: CGFloat = 41.5
    static let VoteHeader_FirstSeperatorWidth: CGFloat = 6.0
    static let VoteHeader_SecondSeperatorWidth: CGFloat = 6.0
    static let VoteHeader_DeadlineIconWidth: CGFloat = 12.5
    
    //MARK URLContainerView
    static let UrlAttachImageSize: CGFloat = 85
    
    //MARK AddVoteItemView
    static let voteItemLimitTextFieldWidth: CGFloat = 50
    static let voteItemAttachmentImgviewWidth: CGFloat = 24

    //MARK Organizational Chart
    static let dept_node_size: CGFloat = 66
    static let dept_border_margin: CGFloat = 21
    static let dept_margin_x: CGFloat = 24
    static let dept_margin_y: CGFloat = 18
    static let dept_node_txt_size: CGFloat = 10
    static let dept_map_line_width: CGFloat = 0.5
    static let dept_node_padding: CGFloat = 4
    
    //MARK Organizational Detail
    static let OrgDetailCollectionViewCellWidth: CGFloat = 50
    static let OrgDetailCollectionViewCellHeight: CGFloat = 50
    static let OrgDetailCollectionViewMinSpacing: CGFloat = 10
    static let OrgDetailTableCellHeight: CGFloat = 96
    static let OrgDetailTableCellHeaderHeight: CGFloat = 30
    static let OrgDetailCollectionViewMargin: CGFloat = 14
    
    //MARK: Employee List View
    static let tblHeaderFontSize : CGFloat = 12
    static let listTblHeaderHeight : CGFloat = 20
    static let listEmployeeCellHeight : CGFloat = 67
    static let listDepartmentCellHeight : CGFloat = 50
    
    // Shadow specifics for drop down menu
    static let shadowOpacity: Float = 0.5
    static let shadowRadius: CGFloat = 2.5
    static let shadowOffset: CGSize = CGSize(width: 1.5, height: 1.5)
    
    //SeenUnSeenUserListVC
    static let resendBtnHeight: CGFloat = 54
    static let selectAllViewHeight: CGFloat = 55
    
    //ContactListCell
    static let userImageWidth: CGFloat = 40.0
    static let checkboxWidth: CGFloat = 32.0
    static let sideMargin: CGFloat = 8.0

    //CompanityPhotoRegisterVC
     static let firstPhotoRegisterCollectionCellHeight: CGFloat = 232
    
    static let deptSelectCheckIconWidth: CGFloat = 24.5
    static let deptSelectCheckIconHeight: CGFloat = 17.5
    
    // ScheduleRegisterView
    static let scheduleViewFull_Height: CGFloat = 340.0
    static let scheduleView_withoutRemarks_Height: CGFloat = 290.0
    static let remarks_TextView_Height: CGFloat = 68.0
    static let scheduleView_Height: CGFloat = 172.0
    static let deadlineView_defaultHeight: CGFloat = 40.0
    static let deadlineView_extendedHeight: CGFloat = 80.0

}

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let STATUSBAR_HEIGHT: CGFloat = UIApplication.shared.statusBarFrame.size.height

let SmallScreen_Width: CGFloat = 340











