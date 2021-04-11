//
//  HomeVC.swift
//  Convertify
//
//  Created by Apple on 4/11/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import UIKit
import WebKit
import StoreKit
import AVFoundation
import OneSignal
import StoreKit
import GoogleMobileAds

class HomeVC: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    
    let vc = HomeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.view.frame = viewContainer.bounds
        viewContainer.addSubview(vc.view)
        NotificationCenter.default.addObserver(self, selector: #selector(actionForward), name: NSNotification.Name(rawValue: "forward1"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(actionBack), name: NSNotification.Name(rawValue: "back1"), object: nil)
    }
    
    @objc func actionForward() {
        vc.webView.goBack()
    }
    
    @objc func actionBack() {
        vc.webView.goForward()
    }
}

