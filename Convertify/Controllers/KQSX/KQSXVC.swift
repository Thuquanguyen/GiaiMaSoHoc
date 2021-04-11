//
//  KQSXVC.swift
//  Convertify
//
//  Created by Apple on 4/11/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import UIKit
import WebKit

class KQSXVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
            let url = URL(string: "https://giaimasohoc.net/?fbclid=IwAR24e6TtVY4Pm1BH7GpsKEhvCV1o1_FBVCbXLgQaIkcdK9E28bLJokIFE3g")
            webView.load(URLRequest(url: url!))
        
        NotificationCenter.default.addObserver(self, selector: #selector(actionForward), name: NSNotification.Name(rawValue: "forward3"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(actionBack), name: NSNotification.Name(rawValue: "back3"), object: nil)
    }
    
    @objc func actionForward() {
        webView.goBack()
    }
    
    @objc func actionBack() {
        webView.goForward()
    }
}
