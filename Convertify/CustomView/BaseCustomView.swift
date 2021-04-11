//
//  BaseCustomView.swift
//  Rocket.Chat
//
//  Created by QuanNH-D1 on 8/29/19.
//  Copyright © 2019 Rocket.Chat. All rights reserved.
//

import UIKit

class BaseCustomView: UIView {
    
    var nibNameView: String?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initWithNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initWithNib()
    }
    
    func initWithNib() {
        guard let view = UINib(nibName: nibNameView ?? self.className() , bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        self.backgroundColor = .clear
    }

    func className() -> String {
        if let name = NSStringFromClass(type(of: self)).components(separatedBy: ".").last {
            return name
        } else {
            return ""
        }
    }
}
