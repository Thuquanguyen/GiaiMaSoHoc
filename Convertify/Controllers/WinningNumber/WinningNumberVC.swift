//
//  WinningNumberVC.swift
//  Convertify
//
//  Created by Apple on 4/11/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import UIKit
import WebKit

class WinningNumberVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.webView.frame.size.height))
            self.view.addSubview(webView)
            let url = URL(string: "https://giaimasohoc.com/forums/ban-tin-cao-thu.62/")
            webView.load(URLRequest(url: url!))
    }


}
