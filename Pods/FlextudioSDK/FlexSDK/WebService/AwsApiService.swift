//
//  AwsApiService.swift
//  Companity
//
//  Created by Subhaye on 11/4/19.
//

import Foundation
import UIKit

protocol AwsApiResult {
    func onAwsResult(result: [String:Any]?)
}
class AwsApiService {
    var delegate: AwsApiResult?
    
    init() {
    }
    
    func callAwsApi(path: String, requestJson: [String:Any], gatewayPath: String = "v2/") {
        let myURL = URL(string: "https://api.flextudio.com/"+gatewayPath+path)!
        var request = URLRequest(url: myURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestJson, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let task = URLSession.shared.dataTask(with: request) { (data: Foundation.Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("error=\(String(describing: error))")
                DispatchQueue.main.async {
                    self.delegate?.onAwsResult(result: nil)
                }
            } else {
                do {
                    var jsonData: Dictionary<String, Any>? = nil
                    if let fData  = data{
                        jsonData = try JSONSerialization.jsonObject(with: fData, options: []) as? [String:Any]
                    }
                    DispatchQueue.main.async {
                        self.delegate?.onAwsResult(result: jsonData)
                    }
                } catch let error {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        self.delegate?.onAwsResult(result: nil)
                    }
                }
            }
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        task.resume()
    }
}
