//
//  StringUtils.swift
//  ERPSheetPrototype
//
//  Created by Nepal KSystem on 8/28/15.
//  Copyright (c) 2015 김 희원. All rights reserved.
//

import Foundation

open class StringUtils{
    
    class func getRangeForSubString(_ string: String, start: Int,end: Int) -> Range<String.Index>{
        //return Range<String.Index>(start: string.startIndex.advancedBy(start), end: string.startIndex.advancedBy(end))
        let startIndex = string.index(string.startIndex, offsetBy: start)
        let endIndex = string.index(string.startIndex, offsetBy: end)
        let range = startIndex..<endIndex
        return range
    }

    class func getSubStringWithRange(_ string: String, start: Int, end: Int) -> String{
        return String(string[getRangeForSubString(string, start: start, end: end)])
    }
    
    open class func replaceAll(_ inString: String, replace: String, withStr: String) -> String{
        return inString.replacingOccurrences(of: replace, with: withStr, options: NSString.CompareOptions.literal, range: nil)
    }
    
    open class func getIndexOf(_ indexOf: Character, inString: String) -> Int{
        
        if inString.firstIndex(of: indexOf) != nil{
             return inString.distance(from: inString.startIndex, to: inString.firstIndex(of: indexOf)!)
        }else{
            return -1
        }
    }
    
    class func contains(originalString: String, searchString: String) -> Bool{
        if originalString.range(of: searchString) != nil{
            return true
        }else{
            return false
        }
    }
    
    // get the formatted value
    class func getFormattedDataFieldValue(_ dataFieldValue: String, decLength: Int)-> String {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.roundingMode = NumberFormatter.RoundingMode.down
        formatter.maximumFractionDigits = decLength
        formatter.minimumFractionDigits = decLength
        
        //            number = formatter.numberFromString(dataFieldValue)!
       
            var newString = dataFieldValue.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil)
            if !newString.isEmpty && StringUtils.contains(originalString: newString, searchString: ".") {
                
                let decimalIndex = StringUtils.getIndexOf(".", inString: newString)
                if decLength == 0 {
                    let tempNum: NSNumber = formatter.number(from: StringUtils.getSubStringWithRange(newString, start: 0, end: decimalIndex))!
                    let returnStr = formatter.string(from: tempNum)!
                    return returnStr
                }
                if newString.count > (decimalIndex + decLength + 1) {
                    //17.05.18 hwon.kim
                    //tpc 값이 "-0.5941228995860054" 일 때, pc에서는 0.6 모바일에서는 0.5로 보여짐
                    var returnValue = String(format: "%.\(decLength)f", Float(newString) ?? 0.0)//StringUtils.getSubStringWithRange(newString, start: 0, end: decimalIndex + decLength + 1)
                    let tempNum: NSNumber = formatter.number(from: returnValue)!
                    returnValue = formatter.string(from: tempNum)!
                    return returnValue
                }
            }
            if newString != "" && formatter.number(from: newString) != nil{
                let tempNum: NSNumber = formatter.number(from: newString)!
                newString = formatter.string(from: tempNum)!
                return newString
            }
            
            return newString

    }

}
