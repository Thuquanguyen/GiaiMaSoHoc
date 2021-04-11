//
//  TabbarVC.swift
//  XKLD
//
//  Created by SonDT-D1 on 5/11/20.
//  Copyright © 2020 RikkeiSoft. All rights reserved.
//

import UIKit
import Alamofire

class TabbarVC: BaseVC {
    
    // MARK: - Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabbarView: TabbarView!
    
    // MARK: - Properties
    var topVC: UIViewController? {
        return currentIndexSelected < self.subScreenList.count
            ? (self.subScreenList[currentIndexSelected] as? UINavigationController)?.viewControllers.last
            : nil
    }
    var currentIndexSelected = 0
    var subScreenList: [UIViewController] = []
    
    lazy var vc1: UIViewController = {
        let vc = HomeVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        return nav
    }()
    
    lazy var vc2: UIViewController = {
        let vc = KUVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        return nav
    }()
    
    lazy var vc3: UIViewController = {
        let vc = KQSXVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        return nav
    }()
    
    lazy var vc4: UIViewController = {
        let vc = YoutubeVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        return nav
    }()
    
    lazy var vc5: UIViewController = {
        let vc = THAVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        return nav
    }()
    
    // MARK: - ViewController's life cycles
    deinit {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func networkStatusChange(_ notification: Notification) {
        
    }

    private func setup() {
        subScreenList = [vc1, vc2, vc3, vc4, vc5]
        
        self.setSubView(index: currentIndexSelected)
        tabbarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabbarView.didClickButton = { [unowned self] index in
            if self.currentIndexSelected == index && index == 0 {
                self.subScreenList[index].popToRoot(animated: true)
            } else {
                self.setSubView(index: index)
            }
        }
    }
    
    private func setSubView(index: Int) {
        self.removeView(removeView: self.subScreenList[self.currentIndexSelected])
        self.switchView(toView: self.subScreenList[index])
        self.currentIndexSelected = index
    }
    
    func switchView(toView: UIViewController){
        toView.willMove(toParent: self)
        self.addChild(toView)
        self.contentView.addSubview(toView.view)
        toView.didMove(toParent: self)
        toView.view.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: self.contentView.frame.height)
    }
    
    func removeView(removeView: UIViewController){
        removeView.willMove(toParent: nil)
        removeView.view.removeFromSuperview()
        removeView.removeFromParent()
        removeView.didMove(toParent: nil)
    }
    
    @IBAction func actionForward(_ sender: Any) {
        print("kdldlamfdskmflds : \(currentIndexSelected)")
        switch currentIndexSelected {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "forward1"), object: nil)
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "forward2"), object: nil)
        case 2:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "forward3"), object: nil)
        case 3:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "forward4"), object: nil)
        case 4:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "forward5"), object: nil)
        default:
            break
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        print("kdldlamfdskmflds : \(currentIndexSelected)")
        switch currentIndexSelected {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back1"), object: nil)
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back2"), object: nil)
        case 2:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back3"), object: nil)
        case 3:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back4"), object: nil)
        case 4:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "back5"), object: nil)
        default:
            break
        }
    }
}
