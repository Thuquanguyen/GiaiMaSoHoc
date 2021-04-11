//
//  CustomTabbarSubView.swift
//  XKLD
//
//  Created by SonDT-D1 on 5/12/20.
//  Copyright © 2020 RikkeiSoft. All rights reserved.
//

import UIKit

class CustomTabbarSubView: BaseCustomView {

    // MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tabLabel: UILabel!
    @IBOutlet weak var tabButton: UIButton!
    
    // MARK: - Closures
    var didTapItem: (() -> ())?
    
    // MARK: - Properties
    var index: Int = 0
    var widthSize: CGFloat = 1.0
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: widthSize, height: 0)
//    }
    
    override func initWithNib() {
        super.initWithNib()
        
        tabButton.layer.cornerRadius = tabButton.bounds.height / 2
    }
    
    func configView(imageName: String, tabName: String) {
        iconImageView.image = UIImage(named: imageName)
        tabLabel.text = tabName
        
    }
    
    func setSelected() {
        tabButton.backgroundColor = UIColor.white.alpha(0.2)
//        tabLabel.isHidden = false
    }
    
    func deSelected() {
        tabButton.backgroundColor = UIColor.white.alpha(0.0)
//        tabLabel.isHidden = true
//        tabLabel.translatesAutoresizingMaskIntoConstraints = false
//        tabLabel.widthAnchor.constraint(equalToConstant: 0).isActive = true
    }
    
    // MARK: - Actions
    @IBAction func tapItemAction(_ sender: Any) {
        didTapItem?()
    }
}
