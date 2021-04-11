//
//  TabbarView.swift
//  ATMCard
//
//  Created by SnowLuvQ on 4/7/19.
//  Copyright © 2019 quannh. All rights reserved.
//

import UIKit

class TabbarView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var label0: UILabel!
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    // MARK: - Properties
    var listButton: [UIButton] = []
    var listLabel: [UILabel] = []
    var listTitle: [String] = ["DIỄN ĐÀN", "KUDV", "KQXS", "YOUTOBE", "THA"]
    private let highlightColor = UIColor.white
    private let normalColor = UIColor.gray
    private let font = UIFont(name: "Roboto-Bold", size: 8)
    
    // MARK: - Closures
    var didClickButton: ((_ index: Int) -> Void) = {_ in}
    
    // MARK: - ViewController's life cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    private func loadXib() {
        guard let view = UINib(nibName: "TabbarView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        self.listButton = [button0,button1,button2,button3,button4]
        self.listLabel = [label0,label1,label2,label3,label4]
        view.backgroundColor = UIColor.clear
        
        //Set Shadow
        self.setShadow(c: UIColor.black.alpha(0.2), oW: 0, oH: 4, r	: 5)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for index in 0..<self.listLabel.count {
            self.listButton[index].tag = index
            self.listLabel[index].text =  self.listTitle[index]
            self.listLabel[index].textColor = normalColor
            self.listLabel[index].font = font
        }
        self.listLabel[0].textColor = highlightColor
    }
    
    func setClickAtIndex(index: Int, changeStateOnly: Bool = false) {
        let button = UIButton()
        button.tag = index
        setState(indexSelect: index)
        if !changeStateOnly {
            didClickButton(button)
        }
    }
    
    // MARK: - Actions
    @IBAction func didClickButton(_ sender: UIButton) {
        setState(indexSelect: sender.tag)
        self.didClickButton(sender.tag)
    }
    
    private func setState(indexSelect: Int) {
        for index in 0..<self.listLabel.count {
            self.listLabel[index].textColor = normalColor
        }
        self.listLabel[indexSelect].textColor = highlightColor
    }
}
