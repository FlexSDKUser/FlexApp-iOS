//
//  AssetsSchemeHandler.swift
//  Companity
//
//  Created by Subhaye on 5/31/22.
//

import Foundation
import UniformTypeIdentifiers
import WebKit

class AssetsSchemeHandler: NSObject, WKURLSchemeHandler {
    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        guard let url = urlSchemeTask.request.url,
              let fileUrl = fileUrlFromUrl(url),
              let mimeType = mimeType(ofFileAtUrl: fileUrl),
              let data = try? Foundation.Data(contentsOf: fileUrl) else { return }
        
        let response = HTTPURLResponse(url: url,
                                       mimeType: mimeType,
                                       expectedContentLength: data.count, textEncodingName: nil)

        urlSchemeTask.didReceive(response)
        urlSchemeTask.didReceive(data)
        urlSchemeTask.didFinish()
    }

    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {

    }

    private func fileUrlFromUrl(_ url: URL) -> URL? {
        //guard let assetName = url.host else { return nil }
        let assetName = url.lastPathComponent
        guard let resourceBundleURL = Bundle.main.url(forResource: "FlexSDKAssets", withExtension: "bundle")
            else { fatalError("FlexSDKAssets not found!") }
        guard let resourceBundle = Bundle(url: resourceBundleURL)
            else { fatalError("Cannot access FlexSDKAssets!") }
        return resourceBundle.url(forResource: assetName,
                               withExtension: "")
    }

    private func mimeType(ofFileAtUrl url: URL) -> String? {
        if #available(iOS 14.0, *) {
            guard let type = UTType(filenameExtension: url.pathExtension) else {
                return nil
            }
            return type.preferredMIMEType
        } else {
            return nil
        }
    }
}
