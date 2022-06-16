//
//  ColorConstants.swift
//  MobileERP
//
//  Created by O Lim Kwon on 8/26/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import UIKit

class ColorConstants {
    
    /*******************************************************************
     ADDED BY NIKESH
     ********************************************************************/
    
    static let WHITE = 0xffffff
    static let BLACK = 0x000000
    static let ylwGreen = 0x56B95B
    static let cloudzOrange = 0xfa6f00
    static let grayIconBtnBg = 0xf1f1f1
    static let kbBtn_bg = 0xc6c6c6
    static let kbEnterBg = 0x1d7bfb
    static let kbEnterTouchBg = 0xdbeaff
    static let ylwBorderColor_numberKb = 0xc6c6c6
    static let kb_normal_text_color = 0x333333
    //      static let kb_grayBtnBg = 0xf1f1f1
    static let ylw_touch_bg = 0xdbeaff
    static let numberKb_number_touch  = 0x85b9ff
    static let CommonInputController_buttonBox_bg = 0x434a56
    static let CommonInputController_button_touch = 0x1d7bfb
    static let CommonInputController_dragIcon_bg = 0x727880
    static let CommonInputController_dragIcon_border = 0x727880
    static let ylw_black_text = 0x333333
    
    // for sheet
    static let sheetToolbarBox_bg = 0xf9f9f9
    static let sheetToolbarBox_border = 0xc6c6c6
    static let sheetToolbarBox_btnTextColor = 0x999999
    static let ylw_unSelectedBorderColor = 0xeeeeee
    static let ylw_selectedBorderColor = 0x527cd3
    static let ylw_ColIndexView_text = 0x999999
    static let ylw_ColIndexView_text_selected = 0x000000
    static let viewbox_selected_circle_color = 0xee6b5d
    static let viewbox_unselected_circle_color = 0x999999
    static let use_viewbox_background = 0xe0e0e0
    static let ylw_selected_text = 0x333333
    static let ylw_red_text = 0xee6b5d
    static let SheetSettings_selectedBox_text = 0x333333
    static let SheetSettings_unSelectedBox_text = 0x999999
    static let SheetSettings_isRequired_text = 0xee6b5d
    static let Sheet_pvcViewModel_bg = 0xf9f9f9
    static let Sheet_pvcViewModel_border = 0x999999
    static let Sheet_pvcViewModel_existBG = 0x999999
    static let Sheet_pvcViewModel_selectedBG = 0x50D2C2
    static let sheet_actionToolbar_bg = 0x999999
    static let sheet_actionToolbar_border = 0xc6c6c6
    static let caption_text_required = 0xee6b5d
    static let sheet_total_bg = 0xece5f6
    static let sheet_total_text = 0x8b65cc
    static let caption_text = 0x666666
    
    // for pgmHeader
    static let pgmListTouch = 0x4da651
    static let color_set_green = 0x56b95b
    
    /* ******************************************************************
     END - NIKESH
     ******************************************************************* */
    
    static let ylw_loadingView_gray = 0xc6c6c6
    static let ylw_loadingView_red = 0xFA6B6B
    static let ylw_loadingView_green = 0x41ED3B
    
    class func getThemeColorConstant() -> Int{
        let userDef = UserDefaults.standard
        
        if userDef.object(forKey: Const.KEY_ColorString) != nil {
            let colorHex = userDef.object(forKey: Const.KEY_ColorString) as! String
            let colorCode = colorHex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            let scanner = Scanner(string: colorCode)
            var result : UInt32 = 0
            if scanner.scanHexInt32(&result) {
                print(result) // 37331519
            }
            return Int(result)
        }else {
            //180202 hwonkim add sk cloudz color
            if LoginUtil.checkBizroad(){
                return cloudzOrange
            }
            else {
                return ylwGreen
            }
        }
    }
    
    //MARK: Companity
    //Menu Panel
    static let moduleView_bg_selected = 0x705FF8
    
    //Hashtag Colors
    static let hashtag_textColor = 0x3091ff
    static let vote_option_btn_normal = 0xE8E8E8
    static let vote_option_btn_Text_normal = 0x999999
    static let vote_option_btn_selected = 0x07c3bd
    
    //MSRK: Organization Chart
     //   <!-- color collection for org charts -->
    static let org_color_level_0 = 0xfa8853
    static let org_color_level_1 = 0xfaab54
    static let org_color_level_2 = 0x50d2c2
    static let org_color_level_3 = 0x41c6e2
    static let org_color_level_4 = 0x8f90c5
    static let org_color_level_5 = 0x888e94
    
    static let dept_map_line_color = 0xcccccc
    static let tab_selectedColor = 0x393940
    static let tab_disabledColor = 0xd1d1d2
    
    //Organizational detail
    static let orgDetailTableCellBorder = 0xe8e8e9
    
    static let profilePhotoDlgHeaderBgColor = 0xe50d2c2
    
    static let attachmentRemoveBtnBgColor = 0x50d2c2
    
    static let menusearchButtonBackgroundColor = 0x00C3BD
    static let menuBottomBarSelectedColor = 0x0031FF
    static let menuTextColor = 0x4C5264
    
    static let submoduleTableViewCell_bgColor = 0xFBFBFB
    
    //Invitation View Controller
    static let invitationBGColor = 0x705FF8
    static let invitationRadioBorderColor = 0xAAAAAA
    
}


//MARK: Companity
extension UIColor {
    //MARK: Media Picker Controller
    static let mediaPickerCameraCell: UIColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0)
    static let mediaPickerCellSelected: UIColor = UIColor(red: 88.0/255.0, green: 192.0/255.0, blue: 188.0/255.0, alpha: 1.0)
    
    //MARK: PinnedPaperCollectionViewCell
    static let pinnedPaperCell_border: UIColor = UIColor(red: 229/255.0, green: 229/255.0, blue: 229/255.0, alpha: 1.0)
    
    //MARK: MainDetailTableViewCell
    static let voteCell_bgColor: UIColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
    
    //MARK: AllPaperViewController
    static let tableView_border: UIColor = UIColor(red: 216/255.0, green: 216/255.0, blue: 216/255.0, alpha: 1.0)
    static let tableView_cellText: UIColor = UIColor(red: 68/255.0, green: 68/255.0, blue: 68/255.0, alpha: 1.0)
    
    //SearchViewController
    static let textHighlight: UIColor = UIColor(red: 60/255.0, green: 120/255.0, blue: 255/255.0, alpha: 1.0)
    
    //MARK: VoteDatePickerView
    static let datePickerBgColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    static let detailTxtViewPlaceHolderTxtColor:UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.3)
    static let detailTxtViewTxtColor:UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    static let dateLblSelectedColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    static let dateLblUnselectedColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.4)
    static let textLblSelectedColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    static let textLblUnselectedColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.4)
    
    //MARK: VoterListView
    static let voterListSelectedColor: UIColor  = UIColor(red: 0/255.0, green: 195/255.0, blue: 189/255.0, alpha: 1)
    static let voterListUnSelectedColor: UIColor  = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1)
    
    //MARK: AddVoteItemview
    static let newVoteItemBoxBorderColor: UIColor = UIColor(red: 221/255.0, green: 221/255.0, blue: 221/255.0, alpha: 1)
    static let selectedTypeTextColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    static let unSelectedTypeTextColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.4)
    
    //MARK: BoardItemDetailView
    static let selectedAttachmentCellColor: UIColor = UIColor(red: 71/255.0, green: 148/255.0, blue: 247/255.0, alpha: 1)
    static let unSelectedAttachmentCellColor: UIColor = UIColor(red: 249/255.0, green: 249/255.0, blue: 249/255.0, alpha: 1)
    
    //MARK: URLContainerView
    static  let containerBorderColor: UIColor = UIColor(red: 204/255.0, green: 204/255.0, blue: 204/255.0, alpha: 1)
    
    //MARK: CreateWriteView
    static  let pageTitleTextColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
    static  let pageDescriptionTextColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.7)
    static  let pageLinkTextColor: UIColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 0.4)
    static  let cityLabelTextColor: UIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
    static  let addressLabelTextColor: UIColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 0.4)
    
    static let lockScreenDark50: UIColor = UIColor(red: 29.0 / 255.0, green: 29.0 / 255.0, blue: 38.0 / 255.0, alpha: 0.5)
    static let lockScreenDark70: UIColor = UIColor(red: 29.0 / 255.0, green: 29.0 / 255.0, blue: 38.0 / 255.0, alpha: 0.5)
    static let lockScreenDark: UIColor = UIColor(red: 29.0 / 255.0, green: 29.0 / 255.0, blue: 38.0 / 255.0, alpha: 0.7)
    static let textColor333 = UIColor(red: CGFloat(51.0/255.0), green: CGFloat(51.0/255.0), blue: CGFloat(51.0/255.0), alpha: 1.0)
    static let officalBtnBorderColor = UIColor(red: CGFloat(226.0/255.0), green: CGFloat(226.0/255.0), blue: CGFloat(226.0/255.0), alpha: 1.0)
    static let officalBtnSelectedColor = UIColor(red: CGFloat(80.0/255.0), green: CGFloat(210.0/255.0), blue: CGFloat(194.0/255.0), alpha: 1.0)
    
    //SeenUnSeenUserListVC
    static let SeenUnSeenTabTextNormalColor: UIColor = UIColor(red: 51.0 / 255.0, green: 51.0 / 255.0, blue: 51.0 / 255.0, alpha: 0.8)
    static let SeenUnSeenTabTextSelectedColor: UIColor = UIColor(red: 0.0 / 255.0, green: 195.0 / 255.0, blue: 181.0 / 255.0, alpha: 0.8)
    static let SeenUnSeenTabBorderNormalColor: UIColor = UIColor(red: 221.0 / 255.0, green: 221.0 / 255.0, blue: 221.0 / 255.0, alpha: 1)
    static let SeenUnSeenTabBorderSelectedColor: UIColor = UIColor(red: 0.0 / 255.0, green: 195.0 / 255.0, blue: 181.0 / 255.0, alpha: 1)
    
    static let VoteTextColor: UIColor = UIColor(red: 0.0 / 255.0, green: 195.0 / 255.0, blue: 189.0 / 255.0, alpha: 1)
    
    static let limitBtnSelectedBorder: UIColor = UIColor(red: 0.0 / 255.0, green: 195.0 / 255.0, blue: 189.0 / 255.0, alpha: 1)
    
    static let departmentSelectBgColor: UIColor = UIColor(red: 29.0 / 255.0, green: 29.0 / 255.0, blue: 37.0 / 255.0, alpha: 0.7)
    static let OrgChartBtnBorderColor: UIColor = UIColor(red: 221.0 / 255.0, green: 221.0 / 255.0, blue: 221.0 / 255.0, alpha: 1)
    
    //ScheduleRegisterView
    static let scheduleViewBorderColor: UIColor = UIColor(red: 221.0 / 255.0, green: 221.0 / 255.0, blue: 221.0 / 255.0, alpha: 1)
     static let scheduleViewHighLightBorderColor: UIColor = UIColor(red: 13.0 / 255.0, green: 195.0 / 255.0, blue: 189.0 / 255.0, alpha: 1)
    
   
}

//MARK: For FeedbackEmoBarView options(button) colors
class FeedbackEmoColor {
    //MARK: Media Picker Controller
    static let good: UIColor = UIColor(red: 255/255, green: 63/255, blue: 69/255, alpha: 1.0)
    static let confirmed: UIColor = UIColor(red: 245/158, green: 158/255, blue: 55/255, alpha: 1.0)
    static let celebrate: UIColor = UIColor(red: 92/255, green: 188/255, blue: 66/255, alpha: 1.0)
    static let sad: UIColor = UIColor(red: 22/255, green: 115/255, blue: 186/255, alpha: 1.0)
    static let neutral: UIColor = UIColor(red: 148/255, green: 85/255, blue: 206/255, alpha: 1.0)
}
