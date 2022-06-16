//
//  YLWColorUtils.swift
//  MobileERP
//
//  Created by Sunil Luitel on 8/26/15.
//  Copyright (c) 2015 Sunil Luitel. All rights reserved.
//

import UIKit

class YLWColorUtils {
    class func changeHexToUIColor(_ hexCode: Int, opacity: CGFloat) -> UIColor{
        let red = (hexCode >> 16) & 0xff
        let green = (hexCode >> 8) & 0xff
        let blue = hexCode & 0xff
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
    
    class func changeHexToCGColor(_ hexCode: Int, opacity: CGFloat) -> CGColor{
        return changeHexToUIColor(hexCode, opacity: opacity).cgColor
    }
    
    class func getThemeColor() -> UIColor{
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: Const.KEY_ColorString) != nil {
            return UIColor.red
        }else {
            let isBizRoad = LoginUtil.checkBizroad()
            if isBizRoad {
                return UIColor.red
            }
            else {
                return changeHexToUIColor(ColorConstants.color_set_green, opacity: 1)
            }
        }
    }
    class func getThemeColorString() -> String{
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: Const.KEY_ColorString) != nil {
            return userDefaults.object(forKey: Const.KEY_ColorString) as! String
        }else {
            let isBizRoad = LoginUtil.checkBizroad()
            if isBizRoad {
                return Const.bizroad_ThemeColor
            }
            else {
                return Const.ksystem_ThemeColor
            }
        }
    }
}

