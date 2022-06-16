//
//  Toast.swift
//  MobileERP
//
//  Created by Sunil Luitel on 4/29/16.
//  Copyright © 2016 Sunil Luitel. All rights reserved.

import UIKit


func /(lhs: CGFloat, rhs: Int) -> CGFloat {
    return lhs / CGFloat(rhs)
}

/*
 *  Toast margin and Duration
 */
let HRToastDefaultDuration  =   2.0
let HRToastFadeDuration     =   0.2
let HRToastShortDuration  =   0.8




// label setting
let HRToastMaxWidth       :  CGFloat  = 0.8;      // 80% of parent view width
let HRToastMaxHeight      :  CGFloat  = 0.8;
let HRToastFontSize       :  CGFloat  = 16.0
let HRToastMaxMessageLines            = 0


let HRToastOpacity        : CGFloat   = 0.9
let HRToastCornerRadius   : CGFloat   = 10.0

var HRToastTimer: UnsafePointer<Timer>?          =   nil
var HRToastView: UnsafePointer<UIView>?            =   nil
var prevToastMessage: String?


extension UIView {
    
    
    
    func showToast(message msg: String) {
        let toast = self.viewForMessage(msg)
        self.showToast(toast: toast!, duration: HRToastDefaultDuration)
    }
    func showShortToast(message msg: String) {
        let toast = self.viewForMessage(msg)
        self.showToast(toast: toast!, duration: HRToastShortDuration)
    }
    fileprivate func showToast(toast: UIView, duration: Double) {
        let existToast = objc_getAssociatedObject(self, &HRToastView) as! UIView?
        if existToast != nil {
            if let timer: Timer = objc_getAssociatedObject(existToast as Any, &HRToastTimer) as? Timer {
                timer.invalidate();
            }
            self.hideToast(toast: existToast!, force: false);
        }
        
        toast.center = self.centerPointForPosition(toast)
        toast.alpha = 0.0
        
        
        self.addSubview(toast)
        objc_setAssociatedObject(self, &HRToastView, toast, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        
        UIView.animate(withDuration: HRToastFadeDuration,
                                   delay: 0.0, options: ([.curveEaseOut, .allowUserInteraction]),
                                   animations: {
                                    toast.alpha = 1.0
            },
                                   completion: { (finished: Bool) in
                                    let timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(UIView.toastTimerDidFinish(_:)), userInfo: toast, repeats: false)
                                    objc_setAssociatedObject(toast, &HRToastTimer, timer, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        })
    }
    
    
    
    /*
     *  private methods (helper)
     */
    
    func hideToast(toast: UIView, force: Bool) {
        let completeClosure = { (finish: Bool) -> () in
            toast.removeFromSuperview()
            objc_setAssociatedObject(self, &HRToastTimer, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        if force {
            completeClosure(true)
        } else {
            UIView.animate(withDuration: HRToastFadeDuration,
                                       delay: 0.0,
                                       options: ([.curveEaseIn, .beginFromCurrentState]),
                                       animations: {
                                        toast.alpha = 0.0
                },
                                       completion:completeClosure)
        }
    }
    
    @objc func toastTimerDidFinish(_ timer: Timer) {
        self.hideToast(toast: timer.userInfo as! UIView, force: false)
        prevToastMessage = nil
    }
    
    
    fileprivate func centerPointForPosition(_ toast: UIView) -> CGPoint {
        let toastSize = toast.bounds.size
        let viewSize  = self.bounds.size
        return CGPoint(x: viewSize.width/2, y: viewSize.height - toastSize.height/2 - 5 * DimenConstants.toastVerticalMargin)
    }
    
    fileprivate func viewForMessage(_ msg: String?) -> UIView? {
        if msg == nil { return nil }
        let combinedMessage: String?
        if prevToastMessage != nil {
            combinedMessage = prevToastMessage! + "\n" + msg!
        } else {
            combinedMessage = msg
        }
        prevToastMessage = combinedMessage
        var msgLabel: UILabel?
        let wrapperView = UIView()
        wrapperView.autoresizingMask = ([.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin])
        wrapperView.layer.cornerRadius = HRToastCornerRadius
        wrapperView.backgroundColor = UIColor.black.withAlphaComponent(HRToastOpacity)
        
        
        msgLabel = UILabel();
        msgLabel!.numberOfLines = HRToastMaxMessageLines
        msgLabel!.lineBreakMode = .byCharWrapping
        msgLabel!.textAlignment = .center
        msgLabel!.textColor = UIColor.white
        msgLabel!.backgroundColor = UIColor.clear
        msgLabel!.alpha = 1.0
        msgLabel!.text = combinedMessage
        
        let maxSizeMessage = CGSize(width: (self.bounds.size.width * HRToastMaxWidth) , height: self.bounds.size.height * HRToastMaxHeight)
        let expectedHeight = msg!.stringHeightWithFontSize(HRToastFontSize, width: maxSizeMessage.width)
        msgLabel!.frame = CGRect(x: DimenConstants.toastHorizontalMargin, y: DimenConstants.toastVerticalMargin, width: maxSizeMessage.width, height: expectedHeight)
        msgLabel!.sizeToFit()
        
        
        var msgWidth: CGFloat, msgHeight: CGFloat
        msgWidth = msgLabel!.bounds.size.width
        msgHeight = msgLabel!.bounds.size.height
        
        // set wrapper view's frame
        let wrapperWidth  = max(DimenConstants.toastHorizontalMargin * 2 + msgWidth,DimenConstants.toastHorizontalMargin)
        let wrapperHeight = max(DimenConstants.toastVerticalMargin * 2 + msgHeight, DimenConstants.toastVerticalMargin * 2)
        wrapperView.frame = CGRect(x: 0.0, y: 0.0, width: wrapperWidth, height: wrapperHeight)
        
        
        wrapperView.addSubview(msgLabel!)
        return wrapperView
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringKey(_ input: NSAttributedString.Key) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
	guard let input = input else { return nil }
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}
