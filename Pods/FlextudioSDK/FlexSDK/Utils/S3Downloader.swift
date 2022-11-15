//
//  S3Downloader.swift
//  Companity
//
//  Created by Subhaye on 8/3/22.
//

import Foundation
import UIKit
protocol DownloadDelegate {
    func downloadEnd(isSuceed: Bool, message: String?)
}

class S3Downloader {
    var totalParts = 0
    var pendingDownloads = 0
    let partSeekLocations: [UInt64]?
    weak var uiViewController: UIDocumentInteractionControllerDelegate?
    var queue:OperationQueue = OperationQueue()
    var delegate: DownloadDelegate
    
    init(downloadUrls : [String], filename : String, partPositions: [UInt64]?, uivc: UIDocumentInteractionControllerDelegate, concurrentCount: Int? = 5, delegate: DownloadDelegate) {
        totalParts = downloadUrls.count
        pendingDownloads = totalParts
        uiViewController = uivc
        partSeekLocations = partPositions
        self.delegate = delegate
        if let fileURL = getLocalFileUrl(filename) {
            queue.qualityOfService = .utility
            queue.maxConcurrentOperationCount = min(totalParts, concurrentCount!)
            for i in 0..<totalParts {
                let bo = AsyncOperation()
                bo.addExecutionBlock {// [unowned self] in
                    self.downloadPart(url : downloadUrls[i], part : i, localUrl: fileURL, operation: bo)
                }
                queue.addOperation(bo)
            }
        }
    }
    
    init(key: String, range: [String], filename : String, partPositions: [UInt64]?, uivc: UIDocumentInteractionControllerDelegate, concurrentCount: Int? = 5, delegate: DownloadDelegate) {
        totalParts = range.count
        pendingDownloads = totalParts
        uiViewController = uivc
        partSeekLocations = partPositions
        self.delegate = delegate
        if let fileURL = getLocalFileUrl(filename) {
            queue.qualityOfService = .utility
            queue.maxConcurrentOperationCount = min(totalParts, concurrentCount!)
            for i in 0..<totalParts {
                let bo = AsyncOperation()
                bo.addExecutionBlock {// [unowned self] in
                    self.downloadRange(key:key, range : range[i], part : i, localUrl: fileURL, operation: bo)
                }
                queue.addOperation(bo)
            }
        }
    }
    
    fileprivate func getLocalFileUrl(_ filename: String) -> URL? {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            var fileURL = documentDirectory.appendingPathComponent(filename)
            if (FileManager.default.fileExists(atPath: fileURL.path)) {
                var count = 0;
                var name: String? = nil
                var ext: String? = nil
                if let dotIndex = filename.lastIndex(of: ".") {
                    name = String(filename[..<dotIndex])
                    ext = String(filename[filename.index(dotIndex, offsetBy: 1)...])
                }
                repeat {
                    count+=1
                    fileURL = documentDirectory.appendingPathComponent((name != nil) ? "\(name!)(\(count)).\(ext!)" : "\(filename)(\(count)")
                } while (FileManager.default.fileExists(atPath: fileURL.path))
            }
            return fileURL
        } else {
            return nil
        }
    }

    func downloadRange(key: String, range : String, part : Int, retryCount : Int = 0, localUrl: URL, operation: AsyncOperation) {

        let urlObj = URL(string: "https://service.flextudio.com/flexfile/downloadRange")
        guard let requestUrl = urlObj else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.timeoutInterval = TimeInterval(60 + 60 * retryCount)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("base64", forHTTPHeaderField: "Accept-Encoding")
        let cmdParams: [String: Any] =  ["key":key, "range" : range]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: cmdParams)
        } catch let error {
            print(error.localizedDescription)
            }
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let task = URLSession(configuration: config).dataTask(with: request) { (data, response, error) in
            if let error = error {
                if (error as NSError).code == -1001 {
                    if retryCount < 5 {
                        self.downloadRange(key: key, range : range, part : part, retryCount : retryCount + 1, localUrl: localUrl, operation: operation)
                        return
                    }
                }
                print("Error took place \(error)")
                self.cancelDownload(localUrl)
                return
            }
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("\(part) Response HTTP Status code: \(response.statusCode)")
            }
            do {
                if self.totalParts > 0, let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any], let encodedStr = jsonData["data"] as? String,
                    let decodedBlob = Foundation.Data(base64Encoded: encodedStr, options: .ignoreUnknownCharacters) {
                    self.writePartToFile(localUrl, data: decodedBlob, part: part)
                    operation.isExecuting = false
                    operation.isFinished = true
                } else {
                    self.cancelDownload(localUrl)
                }
            } catch let err {
                print("JSONSerialization Error took place \(err)")
                self.cancelDownload(localUrl)
            }
        }
        task.resume()

    }
    
    func downloadPart(url : String, part : Int, retryCount : Int = 0, localUrl: URL, operation: AsyncOperation) {

        let urlObj = URL(string: url)
        guard let requestUrl = urlObj else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = TimeInterval(60 + 60 * retryCount)
        //request.waitsForConnectivity = true
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        let task = URLSession(configuration: config).dataTask(with: request) { (data, response, error) in
            if let error = error {
                if (error as NSError).code == -1001 {
                    if retryCount < 5 {
                        self.downloadPart(url : url, part : part, retryCount : retryCount + 1, localUrl: localUrl, operation: operation)
                        return
                    }
                }
                print("Error took place \(error)")
                self.cancelDownload(localUrl)
                //operation.cancel()
                return
            }
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("\(part) Response HTTP Status code: \(response.statusCode)")
            }
            
            self.writePartToFile(localUrl, data: data, part: part)
            operation.isExecuting = false
            operation.isFinished = true

        }
        task.resume()

    }
    
    func writePartToFile(_ fileURL:URL, data: Foundation.Data?, part:Int) {
        do {
            if totalParts > 0, let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
                try fileHandle.seek(toOffset: partSeekLocations![part])
                fileHandle.write(data!)
                pendingDownloads -= 1
                if pendingDownloads == 0 {
                    DispatchQueue.main.async {
                        let documentInteractionController = UIDocumentInteractionController()
                        documentInteractionController.url = fileURL
                        documentInteractionController.uti = fileURL.uti
                        documentInteractionController.delegate = self.uiViewController
                        documentInteractionController.presentPreview(animated: true)
                        self.delegate.downloadEnd(isSuceed: true, message: nil)
                    }
                }
            } else {
                try "".write(to: fileURL, atomically: false, encoding: .utf8)
                writePartToFile(fileURL, data: data, part:part)
            }
        } catch {
            print("writePartToFile error:", error)
            cancelDownload(fileURL)
        }
    }
    
    fileprivate func cancelDownload(_ localUrl: URL) {
        if totalParts > 0 {
            delegate.downloadEnd(isSuceed: false, message: "Download failed")
            queue.cancelAllOperations()
            totalParts = 0
            do {
                try FileManager.default.removeItem(at: localUrl)
            } catch let err {
                print("File delete err: \(err)")
            }
        }
    }
    
    deinit {
        print("Deinitializing....")
    }
    
    class AsyncOperation: BlockOperation {
        override var isAsynchronous: Bool {
            return true
        }
        
        private var _isExecuting: Bool = false
        override var isExecuting: Bool {
            set {
                willChangeValue(forKey: "isExecuting")
                _isExecuting = newValue
                didChangeValue(forKey: "isExecuting")
            }
            get { return _isExecuting } }
        var _isFinished: Bool = false
        override var isFinished: Bool {
            set {
                willChangeValue(forKey: "isFinished")
                _isFinished = newValue
                didChangeValue(forKey: "isFinished")
            }
            get { return _isFinished } }
    }
}
