//
//  LocationModule.swift
//  Companity
//
//  Created by Sunil Luitel on 7/15/19.
//

import Foundation
import CoreLocation

enum LocErrorType {
    case noAuth,noData,offline,etc
}
class LocationModule: NSObject {
    
//    private var authRequestType:LocationAuthRequestType = .none
    func stop() {
        
    }
    func start() {
        
    }
    func fail(_ code: LocErrorType = .noData, _ message:String = "") {
        
    }
//    func getAuthRequestType()->LocationAuthRequestType{
//        return authRequestType
//    }
//    func setAuthRequestType(authType:LocationAuthRequestType){
//        authRequestType = authType
//    }
    func handleResult(result:AnyObject){
        
    }
//    func branchByAuth(isFirst:Bool){
//        let auth = LocationManager.shared.checkAuthorization()
//        switch auth {
//        case .yes:
//            start()
//            break
//        case .no :
//            if !isFirst {
//                fail(LocErrorType.noAuth)
//            }
//            else {
////                NotificationCenter.default.post(name: Notification.Name(rawValue: "requestLocationAuthorization"), object: nil)
////                locationManager.requestWhenInUseAuthorization()
//                LocationManager.shared.requestWhenInUseAuthorization()
//                print("didChangeAuthorization")
//            }
//            break
//        case .confuse :
//            if !isFirst {
//                fail(LocErrorType.noAuth)
//            }
//            else {
//                LocationManager.shared.requestWhenInUseAuthorization()
//                print("didChangeAuthorization")
//            }
//            break
//        }
//    }
}
