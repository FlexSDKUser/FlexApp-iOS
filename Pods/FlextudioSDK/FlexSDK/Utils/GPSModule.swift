//
//  GPSModule.swift
//  Companity
//
//  Created by Sunil Luitel on 7/15/19.
//

import Foundation
import CoreLocation

class GPSModule : LocationModule {
    struct GPSDataType {
        static let address = "address"
        static let latitude = "latitude"
        static let longitude = "longitude"
    }
    private let GPSErrorType:[LocErrorType:String] = [
        .noAuth : "noGPSAuth",
        .noData : "noGPSData",
        .offline : "offlineMsg"
    ]
    
    var delegate:CLLocationManagerDelegate!

    private var systemCallback : String = ""
    private var param : [String:Any] = [:]
    private var id:String = ""
    private var isAccurate: Bool = false
//    GPSModule(callback:callback.function, delegate:self as CLLocationManagerDelegate)
    init(id:String,systemCallback:String,param:[String:Any]?, isAccurate: Bool = false) {
        super.init()
        LocationManager.shared.initModule(locationModule: self)
        self.systemCallback = systemCallback
        self.param = param ?? [:]
        self.id = id
        self.isAccurate = isAccurate
    }
    override func start(){
        LocationManager.shared.start(isAccurate: isAccurate)
    }
    override func stop(){
        LocationManager.shared.stop()
    }
    
    override func fail(_ code: LocErrorType = .noData, _ message:String = "") {
        let afterEventName = (self.param["afterEventName"] as? String) ?? ""
        let errorMsg = GPSErrorType[code] ?? message
        let script = systemCallback + "('\(id)',{'status':{'succeed' : false,'message':'\(errorMsg)'},'data':{'afterEventName':'\(afterEventName)'}});"
        NotificationCenter.default.post(name: Notification.Name(rawValue: "locationUpdated"), object: script)
    }
    override func handleResult(result:AnyObject){
        getLocationInfo(location: result)
    }
    func getLocationInfo(location:AnyObject){
        if let loc = location as? CLLocation {
            let fail = self.fail
            let geo = CLGeocoder()
            geo.reverseGeocodeLocation(loc, completionHandler: {(placemarks, error) in
                if error == nil && placemarks != nil {
                    if placemarks!.count > 0 {
                        let pm = placemarks![0]
                        let area = pm.administrativeArea ?? ""
                        let local = pm.locality ?? ""
                        let tf = pm.thoroughfare ?? ""
                        let subtf = pm.subThoroughfare ?? ""
                        let addr = "\(area) \(local) \(tf) \(subtf)"
                        
                        var script = self.systemCallback + "('\(self.id)',{'status':{'succeed' : true},'data':"
                        
                        let latitude = String(location.coordinate.latitude)
                        let longitude = String(location.coordinate.longitude)
                        
                        script += "{"
                        script += "'\(GPSDataType.address)':'\(addr)',"
                        script += "'\(GPSDataType.latitude)':'\(latitude)',"
                        script += "'\(GPSDataType.longitude)':'\(longitude)'"
                        script += "},"
                        
                        let afterEventName = (self.param["afterEventName"] as? String) ?? ""
                        script += "'afterEventName':'\(afterEventName)'}"
                        
                        script += ");"
                        
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "locationUpdated"), object: script)
                    }
                    else {
                        fail(.noData, "")
                    }
                    
                }
                else {
                    fail(.noData, "")
                }
            })
        }
        else {
            fail()
        }
    }
}

