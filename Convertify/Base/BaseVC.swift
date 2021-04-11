//
//  BaseVC.swift
//  iOS Structure MVC
//
//  Created by vinhdd on 10/9/18.
//  Copyright © 2018 vinhdd. All rights reserved.
//

import UIKit

protocol SubviewsLayoutable {
    func addSubviews()
    func setupAutolayoutForSubviews()
    func addGestureForSubviews()
}

protocol SubviewsLocalizable {
    func setTextLocalized()
}

protocol SubviewsConfiguable {
    func configSubviews()
}


protocol UpdatePreviousVCDelegate: AnyObject {
    func didUpdatePreviousVC()
}

class BaseVC: UIViewController {
    
    // MARK: - Variables
   
    var appSettingSlug: String = ""
    var isLoadedData = false
    
    // MARK: - Variables
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    // MARK: - Init & deinit
    required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
    }
    
    // MARK: - ViewController's life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        baseConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !isLoadedData {
            isLoadedData = true
            callAPI()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            // Detect current controller is being dismissed
        }
    }
    
    func callAPI() {
        
    }

    // MARK: - Setup
    private func baseConfig() {
        edgesForExtendedLayout = []
    }
    
    // MARK: - Action
    
    // MARK: - Builder
    func addBaseViewBackground() {
        let imageView = UIImageView(image: UIImage(named: "base_view_bg"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = -10000
        view.addSubview(imageView)
        
        let topConstr = AutoLayoutHelper.relatedConstraint(imageView, superView: view, attribute: .top, relatedBy: .equal)
        let leftConstr = AutoLayoutHelper.relatedConstraint(imageView, superView: view, attribute: .left, relatedBy: .equal)
        let rightConstr = AutoLayoutHelper.relatedConstraint(imageView, superView: view, attribute: .right, relatedBy: .equal)
        view.addConstraints([topConstr, leftConstr, rightConstr])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return statusBarStyle
    }
}
