//
//  LocationManager.swift
//  Companity
//
//  Created by hwon.kim on 2021/05/11.
//

import Foundation
import CoreLocation
import UIKit

enum LocationAuthRequestType {
    case first, second, none
}

class LocationManager:NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var locationModule:LocationModule?
    static let shared = LocationManager()
    
    private override init() {
        super.init()
        
        locationManager.delegate = self
    }
    
    func initModule(locationModule : LocationModule){
        self.locationModule = locationModule
    }
    func deinitModule(){
        self.locationModule = nil
    }
    func start(isAccurate: Bool = false){
        locationManager.desiredAccuracy = isAccurate ? kCLLocationAccuracyBestForNavigation : kCLLocationAccuracyHundredMeters
//        let authRequestType = locationModule?.getAuthRequestType()
        if !CLLocationManager.locationServicesEnabled() {
//            if (authRequestType == .second){
//                locationModule?.setAuthRequestType(authType: .none)
//                locationModule?.fail(.noAuth)
//            }
//            else {
//                locationModule?.setAuthRequestType(authType: .first)
                locationModule?.fail(.etc, NSLocalizedString("LocationServiceOff", comment: "Please turn on Location Services in Settings > Privacy"))
//            }
            return
        }
        
        let auth = CLLocationManager.authorizationStatus()
        switch auth {
        case .authorizedAlways, .authorizedWhenInUse:
            //                locationModule?.setAuthRequestType(authType: .none)
            if #available(iOS 14.0, *) {
                if(locationManager.accuracyAuthorization == .reducedAccuracy) {
                    locationManager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "AccuracyRequired", completion: { (error) in
                        if error == nil {
                            if self.locationManager.accuracyAuthorization == .reducedAccuracy {
                                self.locationModule?.fail(.etc, NSLocalizedString("AccuracyRequired", comment: "This app needs accurate location"))
                            } else {
                                self.locationManager.requestLocation()
                            }
                        } else {
                            self.locationModule?.fail(.noAuth, error.debugDescription)
                        }
                    })
                } else {
                    locationManager.requestLocation()
                }
            } else {
                locationManager.requestLocation()
            }
            
            
            break;
        case .denied, .restricted:
//                if (authRequestType == .second){
//                    locationModule?.setAuthRequestType(authType: .none)
//                    locationModule?.fail(.noAuth)
//                }
//                else {
//                    locationModule?.setAuthRequestType(authType: .first)
                    locationModule?.fail(.noAuth)
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
//                }
                break;
            default:
//                if (authRequestType == .second){
//                    locationModule?.setAuthRequestType(authType: .none)
//                    locationModule?.fail(.noAuth)
//                }
//                else {
//                    locationModule?.setAuthRequestType(authType: .first)
                    locationModule?.fail(.noAuth)
                    locationManager.requestWhenInUseAuthorization()
//                }
                break;
        }
    }
    
    func stop(){
        deinitModule()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationModule?.fail()
        deinitModule()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        self.locationModule?.handleResult(result: userLocation)
        
        deinitModule()
    }
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        guard let authRequestType = locationModule?.getAuthRequestType() else {return}
//        if authRequestType == .none {return}
//        if (authRequestType == .first){
//            locationModule?.setAuthRequestType(authType: .second)
//        }
//        start()
//    }
}
