//
//  YlwMessageBox.swift
//  MobileERP
//
//  Created by osbaek on 2015. 11. 9..
//  Copyright (c) 2015년 Sunil Luitel. All rights reserved.
//

/*
//MARK:- USE example!
var msgBox: YlwMessageBox = YlwMessageBox()
if let result = msgBox.showDialog(message, title: "", msgBoxType: msgType, isSyncMode: true) {
return result
} else {
return nil
}
*/
import UIKit

class YlwMessageBox: UIView, UIAlertViewDelegate {
    var alertView: UIView?
    var mButtonIndex = -1
    
    var alertMessage: String = ""
    var isSyncMode: Bool = false
    var alertTitle: String = ""
    var alertType: String = ""
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    // variables for MessageBox design
    var containerView: UIView?
    var buttonHeight: CGFloat = 32
    var buttonsDividerHeight: CGFloat = 1
    var cornerRadius: CGFloat = 5
    
    var paddingSide = CGFloat(35)
    let paddingBottom = CGFloat(20)
    
    var useMotionEffects: Bool = true
    var motionEffectExtent: Int = 10
    
    var buttonTitles: [String]? = ["Close"]
    var buttonColor: UIColor?
    var buttonColorHighlighted: UIColor?
    
    //    var delegate: YlwMessageBoxDelegate?
    // Call the delegates
    
    @objc func buttonTouchUpInside(_ sender: UIButton!) {
        //        delegate?.ylwMessageBoxResult(self, buttonIndex: sender.tag)
        sender.layer.backgroundColor = UIColor.white.cgColor

        mButtonIndex = sender.tag
        CFRunLoopStop(CFRunLoopGetMain())
        close(nil)
    }
    
    @objc func buttonTouchCancel(_ sender: UIButton!) {
        sender.layer.backgroundColor =  UIColor.white.cgColor

        
    }
    
    @objc func buttonTouchDown(_ sender: UIButton!) {
        sender.layer.backgroundColor = YLWColorUtils.getThemeColor().cgColor

    }
    
    func showDialog(_ message: String, title: String, msgBoxType: String, isSyncMode: Bool) -> Int? {
        NotificationCenter.default.addObserver(self, selector: #selector(YlwMessageBox.RotatedYlwMessageBox(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        //0808 show message during scan mode
        NotificationCenter.default.post(name: Notification.Name(rawValue: "removeCodeReaderForMessage"), object: nil)

        alertMessage = message
        alertTitle = title
        alertType = msgBoxType
        
        self.isSyncMode = isSyncMode
        mButtonIndex = 0
        
        buttonTitles = getButtonTitles(msgBoxType)
        
        alertView = createCustomAlertView()
        
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
        
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        self.addSubview(alertView!)
        
        //        // Attach to the top most window
        //        switch (UIApplication.sharedApplication().statusBarOrientation) {
        //        case UIInterfaceOrientation.LandscapeLeft:
        //            self.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi * 270 / 180))
        //
        //        case UIInterfaceOrientation.LandscapeRight:
        //            self.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi * 90 / 180))
        //
        //        case UIInterfaceOrientation.PortraitUpsideDown:
        //            self.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi * 180 / 180))
        //
        //        default:
        //            break
        //        }
        
        self.frame = CGRect(x: 0, y: 0, width: calculateScreenSize().width, height: calculateScreenSize().height)
        
        //180329기존 LoginViewController에서 비밀번호 변경 화면 안뜸
//        UIApplication.shared.windows.first?.addSubview(self)
        UIApplication.shared.keyWindow?.addSubview(self)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.backgroundColor = UIColor(white: 0, alpha: 0.7)
            self.alertView!.layer.opacity = 1
            self.alertView!.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }, completion: nil)
        
        
        //사용자가 대화 상자를 닫을때까지 기다린다.
        if isSyncMode {
            
            CFRunLoopRun()
            
        }
        return returnResultValue()
    }
    
    
    @objc func RotatedYlwMessageBox(_ notification: Notification) {
        self.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        alertView!.center = self.center
    }
    
    func returnResultValue() -> Int? {
        
        let ok = NSLocalizedString("OK", comment: "OK")
        let cancel = NSLocalizedString("Cancel", comment: "Cancel")
        let yes = NSLocalizedString("YES", comment: "YES")
        let no = NSLocalizedString("NO", comment: "NO")
        
        if let resultValue = buttonTitles?[mButtonIndex] {
            if alertType == "MsgBoxTypeOK" {
                return 1
            } else if alertType == "MsgBoxTypeYesNo" {
                if resultValue == yes {
                    return 1
                } else if resultValue == no {
                    return 0
                }
            } else if alertType == "MsgBoxTypeOKCancel" {
                //크리오 : OK, Cancel -> '확인', '취소'
                if resultValue == ok {
                    return 1
                } else if resultValue == cancel {
                    return 2
                }
            } else if alertType == "MsgBoxTypeYesNoCancel" {
                if resultValue == yes {
                    return 1
                } else if resultValue == no {
                    return 0
                } else if resultValue == cancel {
                    return 2
                }
            }
        }
        return nil
    }
    func getButtonTitles(_ msgBoxType: String) -> [String]? {
        
        let ok = NSLocalizedString("OK", comment: "OK")
        let cancel = NSLocalizedString("Cancel", comment: "Cancel")
        let yes = NSLocalizedString("YES", comment: "YES")
        let no = NSLocalizedString("NO", comment: "NO")
        
        if msgBoxType == "MsgBoxTypeOK" {
            return [ok]
        } else if msgBoxType == "MsgBoxTypeYesNo" {
            return [yes,no]
        } else if msgBoxType == "MsgBoxTypeOKCancel" {
            //크리오 : OK, Cancel -> '확인', '취소'
            return [ok,cancel]
        } else if msgBoxType == "MsgBoxTypeYesNoCancel" {
            return [yes,no,cancel]
        } else {
            return [cancel]
        }
    }
    
    
    
    func createCustomAlertView() -> UIView {
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 150))
        let screenSize = self.calculateScreenSize()
        let dialogSize = self.calculateDialogSize()
        
        let view = UIView(frame: CGRect(x: (screenSize.width - dialogSize.width)/2, y: (screenSize.height - dialogSize.height)/2, width: dialogSize.width, height: dialogSize.height))
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = UIColor.white
        
        view.addSubview(containerView!)
        self.addButtonsToView(view)
        // Apply motion effects
        if useMotionEffects {
            applyMotionEffects(view)
        }
        if alertTitle.isEmpty == false {
            let titleLabel = UILabel(frame: CGRect(x: paddingSide, y: paddingBottom*2/3, width: view.frame.size.width - paddingSide*2, height: CGFloat(15.0)))
            titleLabel.text = alertTitle
            titleLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            titleLabel.textAlignment = .center
            titleLabel.font = UIFont.systemFont(ofSize: 12.5)
            titleLabel.backgroundColor = UIColor.clear
            titleLabel.numberOfLines = 0
            
            view.addSubview(titleLabel)
            
            let msgLabel = UITextView(frame: CGRect(x: paddingSide/2, y: paddingBottom*4/3 + CGFloat(15.0), width: view.frame.size.width - paddingSide, height: view.frame.size.height - paddingBottom*10/3 - buttonHeight))
            msgLabel.isEditable = false
            msgLabel.isSelectable = false
            msgLabel.text = alertMessage
            msgLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            msgLabel.font = UIFont.systemFont(ofSize: 13.0)
            msgLabel.backgroundColor = UIColor.clear

            view.addSubview(msgLabel)
            
        } else {
            let msgLabel = UITextView(frame: CGRect(x: paddingSide, y: paddingBottom, width: view.frame.size.width - paddingSide*2, height: view.frame.size.height - paddingBottom*3 - buttonHeight))
            msgLabel.isEditable = false
            msgLabel.isSelectable = false
            msgLabel.isScrollEnabled = true
            msgLabel.text = alertMessage
            msgLabel.textColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
            msgLabel.textAlignment = .center
            msgLabel.font = UIFont.systemFont(ofSize: 15.0)
            msgLabel.backgroundColor = UIColor.clear
//            msgLabel.numberOfLines = 0
            
            view.addSubview(msgLabel)
        }
        view.layer.opacity = 0.5
        view.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1)
        
        
        
        return view
    }
    
    // Add the buttons to the containerView
    fileprivate func addButtonsToView(_ container: UIView) {
        if buttonTitles == nil || buttonTitles?.count == 0 {
            return
        }
        let paddingBottom = CGFloat(20.0)
        paddingSide = paddingSide/CGFloat(buttonTitles!.count)
        
        let buttonWidth = (container.bounds.size.width - (CGFloat(buttonTitles!.count) + CGFloat(1)) * paddingSide) / CGFloat(buttonTitles!.count)
        
        for buttonIndex in 0...(buttonTitles!.count - 1) {
            let button = UIButton(type: UIButton.ButtonType.custom)
            
            button.frame = CGRect(
                x: paddingSide * (CGFloat(buttonIndex)+CGFloat(1)) + CGFloat(buttonIndex) * CGFloat(buttonWidth),
                y: container.bounds.size.height - buttonHeight - paddingBottom,
                width: buttonWidth,
                height: buttonHeight
            )
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
            button.layer.borderColor = YLWColorUtils.getThemeColor().cgColor
            button.layer.borderWidth = 1.0
            button.layer.cornerRadius = buttonHeight/2
            button.tag = buttonIndex
            button.addTarget(self, action: #selector(YlwMessageBox.buttonTouchUpInside(_:)), for: UIControl.Event.touchUpInside)
            button.addTarget(self, action: #selector(YlwMessageBox.buttonTouchDown(_:)), for: UIControl.Event.touchDown)
            button.addTarget(self, action: #selector(YlwMessageBox.buttonTouchCancel(_:)), for: UIControl.Event.touchDragOutside)
             button.addTarget(self, action: #selector(YlwMessageBox.buttonTouchCancel(_:)), for: UIControl.Event.touchCancel)
            let colorNormal = buttonColor != nil ? buttonColor :  YLWColorUtils.getThemeColor()
            let colorHighlighted = buttonColorHighlighted != nil ? buttonColorHighlighted : UIColor.white
            button.setTitle(buttonTitles![buttonIndex], for: UIControl.State())
            button.setTitleColor(colorNormal, for: UIControl.State())
            button.setTitleColor(colorHighlighted, for: UIControl.State.highlighted)
            button.setTitleColor(colorHighlighted, for: UIControl.State.disabled)
            
            container.addSubview(button)
            
        }
    }
    

    
    // Generate the view for the buttons divider
    fileprivate func generateButtonsDivider(_ bounds: CGRect) -> UIView {
        let divider = UIView(frame: CGRect(
            x: 0,
            y: bounds.size.height - buttonHeight - buttonsDividerHeight,
            width: bounds.size.width,
            height: buttonsDividerHeight
            ))
        
        divider.backgroundColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1)
        
        return divider
    }
    
    // Add motion effects
    fileprivate func applyMotionEffects(_ view: UIView) {
        let horizontalEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -motionEffectExtent
        horizontalEffect.maximumRelativeValue = +motionEffectExtent
        
        let verticalEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -motionEffectExtent
        verticalEffect.maximumRelativeValue = +motionEffectExtent
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [horizontalEffect, verticalEffect]
        
        view.addMotionEffect(motionEffectGroup)
    }
    
    // Generate the gradient layer of the alertView
    fileprivate func generateGradient(_ bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        
        gradient.frame = bounds
        gradient.cornerRadius = cornerRadius
        
        gradient.colors = [
            UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha:1).cgColor,
            UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha:1).cgColor,
            UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha:1).cgColor
        ]
        
        return gradient
    }
    
    // Calculate the size of the screen
    fileprivate func calculateScreenSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        //        if orientationIsLandscape() {
        //            return CGSizeMake(height, width)
        //        } else {
        return CGSize(width: width, height: height)
        //        }
    }
    func close(_ completion: ((Bool) -> Void)?) {
        NotificationCenter.default.removeObserver(self)
        let currentTransform = self.alertView!.layer.transform
        
        let startRotation = (alertView!.value(forKeyPath: "layer.transform.rotation.z")! as AnyObject).floatValue
        let rotation = CATransform3DMakeRotation(CGFloat(-startRotation!) + CGFloat(Double.pi * 270 / 180), 0, 0, 0)
        
        self.alertView!.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1))
        self.alertView!.layer.opacity = 1
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.backgroundColor = UIColor(white: 0, alpha: 0)
            self.alertView!.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6, 0.6, 1))
            self.alertView!.layer.opacity = 0
            }, completion: { (finished: Bool) in
                for view in self.subviews {
                    view.removeFromSuperview()
                }
                
                self.removeFromSuperview()
                completion?(finished)
        })
    }
    
    // Calculate the size of the dialog
    fileprivate func calculateDialogSize() -> CGSize {
        return CGSize(
            width: self.containerView!.frame.size.width,
            height: self.containerView!.frame.size.height
        )
    }
    // Whether the UI is in landscape mode
    fileprivate func orientationIsLandscape() -> Bool {
        return UIApplication.shared.statusBarOrientation.isLandscape
    }
    
}
