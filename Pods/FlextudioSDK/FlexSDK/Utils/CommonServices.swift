//
//  CommonServices.swift
//  MobileFriendlyChat
//
//  Created by Om Prakash Shah on 12/14/16.
//  Copyright © 2016 ksystem. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CommonServices {
    static func showAlert(_ message: String, alertStyle: UIAlertController.Style, refViewController: UIViewController) {
        let alert = UIAlertController(title: AlertTitle.alert, message: message, preferredStyle: alertStyle)
        alert.addAction(UIAlertAction(title: AlertTitle.ok, style: UIAlertAction.Style.default, handler: nil))
        refViewController.present(alert, animated: true, completion: nil)
    }
    
    //Dismiss current view on clicking OK 
    static func showAlertWithDismissVC(_ message: String, alertStyle: UIAlertController.Style, refViewController: UIViewController) {
        let alert = UIAlertController(title: AlertTitle.alert, message: message, preferredStyle: alertStyle)
        alert.addAction(UIAlertAction(title: AlertTitle.ok, style: UIAlertAction.Style.default, handler: { Void in
            refViewController.dismiss(animated: true, completion: nil)
        }))
        refViewController.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertAndPopVC(_ message: String, alertStyle: UIAlertController.Style, refViewController: UIViewController) {
        let alert = UIAlertController(title: AlertTitle.alert, message: message, preferredStyle: alertStyle)
        alert.addAction(UIAlertAction(title: AlertTitle.ok, style: UIAlertAction.Style.default, handler: { Void in
            refViewController.navigationController?.popViewController(animated: true)
        }))
        refViewController.present(alert, animated: true, completion: nil)
    }
    
    static func newLoadingAlert() -> UIAlertController {
        let loadingAlert = UIAlertController(title: nil, message: AlertTitle.pleaseWait, preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 80, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()
        loadingAlert.view.addSubview(loadingIndicator)
        
        return loadingAlert
    }
    
//    //Method for notification generation
//    static func scheduleLocalNotification(_ message: String) {
//        let localNotification = UILocalNotification()
//        localNotification.fireDate = Date() //.dateByAddingTimeInterval(1.0)
//        localNotification.alertBody = "\(message)"
//        //localNotification.alertAction = "View List"
//        //localNotification.category = "ChatMessage"
//        localNotification.timeZone = TimeZone.current
//        localNotification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
//
//        UIApplication.shared.scheduleLocalNotification(localNotification)
//    }
    
    //Creating profile picture with name initials
    static func createProfileImgWithName(_ fullName: String) -> UIImage {
        let lblNameInitialize = UILabel()
        lblNameInitialize.frame.size = DimenConstants.ProfileImageDimensions
        lblNameInitialize.textColor = UIColor.white
        
        var fullNameArr =  fullName.split{$0 == " "}.map(String.init)
        if(fullNameArr.count == 1){
            let firstName: String = fullNameArr[0]
            lblNameInitialize.text = String(firstName.first!)
        } else if (fullNameArr.count == 2){
            let firstName: String = fullNameArr[0]
            let lastName: String = fullNameArr[1]
            lblNameInitialize.text = String(firstName.first!) + String(lastName.first!)
        } else if (fullNameArr.count == 3){
            let firstName: String = fullNameArr[0]
            let middleName: String = fullNameArr[1]
            let lastName: String = fullNameArr[2]
            lblNameInitialize.text = String(firstName.first!) + String(middleName.first!) + String(lastName.first!)
        }
        
        lblNameInitialize.textAlignment = NSTextAlignment.center
        lblNameInitialize.backgroundColor = UIColor.lightGray //getRandomColor()
        
        UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
        lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
        let profileImg: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return profileImg
    }
    
    /// Method takes video url and return thumbnail to display as option for vote
    ///
    /// - Parameter url: video url
    /// - Returns: thumbnail image
    static func thumbnailForVideo(atURL url: URL, callback: @escaping (UIImage?) -> ()){
        DispatchQueue.global(qos: .default).async(execute: { 
        
            let asset = AVAsset(url: url)
            let assetImageGenerator = AVAssetImageGenerator(asset: asset)
            assetImageGenerator.appliesPreferredTrackTransform = true
            
            var time = asset.duration
            time.value = min(time.value, 2)
            
            do {
                let imageRef = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
                callback(UIImage(cgImage: imageRef))
            } catch {
                print("error")
                callback(nil)
            }
        })
    }
    
    static func drawImage(image foreGroundImage: UIImage, inImage backgroundImage: UIImage, atPoint point: CGPoint) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(backgroundImage.size, false, 0.0)
        backgroundImage.draw(in: CGRect(x: 0,y: 0, width: backgroundImage.size.width, height: backgroundImage.size.height))
        foreGroundImage.draw(in: CGRect(x: point.x, y: point.y, width: foreGroundImage.size.width, height: foreGroundImage.size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    static func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
}
