//
//  CustomTabbarView.swift
//  XKLD
//
//  Created by SonDT-D1 on 5/11/20.
//  Copyright © 2020 RikkeiSoft. All rights reserved.
//

import UIKit

class CustomTabbarView: UIView {

    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: - Properties
    private let numberOfItems: Int = 5
    private var subViewList: [CustomTabbarSubView] = []
    private var iconNameList: [String] = []
    private var tabNameList: [String] = []
    private var buttonList: [UIButton] = []
    var currentIndexSelected = 0
    
    // MARK: - Closures
    var didClickButton: ((Int) -> ())?
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Setup View
    private func setupView() {
        let nib = UINib(nibName: "CustomTabbarView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        iconNameList = ["ic_tabbar_0", "ic_tabbar_1", "ic_tabbar_2", "ic_tabbar_3", "ic_tabbar_3"]
        tabNameList = ["Trang chủ","Cá nhân", "Thêm lịch tư vấn", "Lịch hẹn", "Tin nhắn"]
        
        tapItemAction(index: currentIndexSelected, isInitItems: true)
    }
    
    private func tapItemAction(index: Int, isInitItems: Bool = false) {
        guard isInitItems || self.currentIndexSelected != index else {
            return
        }
        
        self.currentIndexSelected = index
        
        stackView.removeAllArrangedSubviews()
        subViewList.removeAll()
        
        for index in 0..<numberOfItems {
            let subView = CustomTabbarSubView()
            subView.index = index
            if index == currentIndexSelected {
                subView.widthSize = 1.0
                subView.setSelected()
            } else {
                subView.widthSize = 1.0
                subView.deSelected()
            }
            subView.configView(imageName: iconNameList[index], tabName: tabNameList[index])
            subView.didTapItem = {
                self.tapItemAction(index: index)
            }
            subViewList.append(subView)
        }
        
        DispatchQueue.main.async {
            self.subViewList.forEach { subView in
                self.stackView.addArrangedSubview(subView)
            }
        }
        
        didClickButton?(currentIndexSelected)
    }
}
