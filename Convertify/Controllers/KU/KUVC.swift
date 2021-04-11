//
//  KUVC.swift
//  Convertify
//
//  Created by Apple on 4/11/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import UIKit
import WebKit

class KUVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
            let url = URL(string: "https://bit.ly/2LdX7x7")
            webView.load(URLRequest(url: url!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(actionForward), name: NSNotification.Name(rawValue: "forward2"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(actionBack), name: NSNotification.Name(rawValue: "back2"), object: nil)
    }
    
    @objc func actionForward() {
        webView.goBack()
    }
    
    @objc func actionBack() {
        webView.goForward()
    }
}
