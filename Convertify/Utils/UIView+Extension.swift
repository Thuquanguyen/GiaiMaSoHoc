//
//  UIView+Extension.swift
//  Convertify
//
//  Created by Apple on 4/10/21.
//  Copyright © 2021 apple001. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func setShadow( c color: UIColor, oW offSetW: CGFloat, oH offSetH: CGFloat, r radius: CGFloat, o opacity: CGFloat = 1) {
        let offSet = CGSize(width: offSetW, height: offSetH)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = Float(opacity)
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
    }
}
