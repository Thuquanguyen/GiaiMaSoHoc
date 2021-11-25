//
//  THAVC.swift
//  Convertify
//
//  Created by Apple on 4/11/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import UIKit
import WebKit

class THAVC: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.view.addSubview(webView)
            let url = URL(string: "https://dv599.jss77.net/")
            webView.load(URLRequest(url: url!))
        NotificationCenter.default.addObserver(self, selector: #selector(actionForward), name: NSNotification.Name(rawValue: "forward5"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(actionBack), name: NSNotification.Name(rawValue: "back5"), object: nil)
    }


    @objc func actionForward() {
        webView.goBack()
    }
    
    @objc func actionBack() {
        webView.goForward()
    }

}
