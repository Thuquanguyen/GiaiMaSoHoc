//
//  Utils.swift
//  CTT_BN
//
//  Created by IchNV-D1 on 4/23/19.
//  Copyright © 2019 VietHD-D3. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import SafariServices
//import FBSDKLoginKit
//import FBSDKCoreKit
//import GoogleSignIn

class Utils {
    // Check sandbox enviroment or not
    #if DEVELOP || STAGING
    static let isSandboxEnviroment: Bool = true
    #else
    static let isSandboxEnviroment: Bool = false
    #endif
    
    // Sleep app with input time interval
    
    static func sleep(_ second: TimeInterval, completion: @escaping (() -> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + second, execute: {
            completion()
        })
    }
    
    static func mainQueue(closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
    
    static func openUrl(string: String) {
        guard let url = URL(string: string) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    static func needUpdate(remoteVer: String) -> Bool {
        guard let currentVer = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return false }
        if remoteVer.compare(currentVer, options: .numeric) == .orderedDescending {
            return true
        }
        return false
    }

    static func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    static func openSFSafariVC(urlString: String?) {
        guard let url = URL.init(string: urlString ?? "") else { return }
        
        let svc = SFSafariViewController(url: url)
        VCService.present(controller: svc)
    }
    
    
    class func getImage(filename:String) -> UIImage? {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath          = paths.first
        {
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(filename)
            let image    = UIImage(contentsOfFile: imageURL.path)
            return image
            // Do whatever you want with the image
        }
        return nil
    }
    
    
    // check file size
    // > 10mb return false else true
    
    static func readFileJson(_ nameFile: String) -> JSON? {
        let path = Bundle.main.bundleURL.appendingPathComponent(nameFile)
        let text = try? String(contentsOf: path)
        if text == nil { return nil }
        return JSON(parseJSON: text!)
    }
    
    static func getAllIndexPathsInSection(section : Int, count: Int) -> [IndexPath] {
        return (0..<count).map { IndexPath(row: $0, section: section) }
    }

    static func convertDate(date: String) -> String{
        let result = date.split(separator: "/")
        return "\(result[2])-\(result[1])-\(result[0])"
    }
    
    static func convertDate2(date: String) -> String{
        let result = date.split(separator: "/")
        return "\(result[2])-\(result[0])-\(result[1])"
    }
    
    static func removeUser() {
        URLCache.shared.removeAllCachedResponses()
        if let urlFB = URL(string: "https://facebook.com/"),let coookfb = HTTPCookieStorage.shared.cookies(for: urlFB) {
            for cookie in coookfb {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
    
    static func setEnabledViews(isEnabled: Bool, views: UIView... ) {
        views.forEach{
            $0.alpha = isEnabled ? 1 : 0.5
            $0.isUserInteractionEnabled = isEnabled
        }
    }
    
}
