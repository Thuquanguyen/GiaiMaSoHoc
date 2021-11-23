
import UIKit
import OneSignal
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared = UIApplication.shared.delegate as! AppDelegate
    var window: UIWindow?
    var mainTabbarController: TabbarVC?
    var orientationLock = UIInterfaceOrientationMask.all
    public var userID:String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.makeMainTabbar()
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        let current = UNUserNotificationCenter.current()

        current.getNotificationSettings(completionHandler: { (settings) in
            if settings.authorizationStatus == .notDetermined {
                // Notification permission has not been asked yet, go for it!
            } else if settings.authorizationStatus == .denied {
                print("denied called")
                UserDefaults.standard.set(false, forKey: "isAllowed")
                Settings.PUSH_ENABLED = false
            } else if settings.authorizationStatus == .authorized {
                print("granted called")
                UserDefaults.standard.set(true, forKey: "isAllowed")
                Settings.PUSH_ENABLED = true
            }
        })
        print("opened again")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let isallowed = UIApplication.shared.isRegisteredForRemoteNotifications
               print(isallowed)
        print("opened again")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let suffix = url.absoluteString.components(separatedBy: "//")[1]
        var passingURL = ""
        if suffix != "" {
            passingURL = composeURL(url: url.absoluteString)
            print("new url is: \(Settings.URL)")
        }
    
        DispatchQueue.main.async {
//            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeController") as? ContainerController
//            if passingURL != "" {vc?.passingURL = passingURL}
//            self.window?.rootViewController = vc
            self.makeMainTabbar()
        }
        return true
    }
    
    func composeURL(url: String)-> String {
        let httpsPart = Settings.URL.components(separatedBy: "//")[0]
        let domain = Settings.URL.components(separatedBy: "//")[1]
        var mainDomain = ""
        if domain.contains("/"){
            mainDomain = domain.components(separatedBy: "/")[0]
        } else {
            mainDomain = domain
        }
        let suffix = url.components(separatedBy: "//")[1]
        
        return httpsPart + "//" + mainDomain + "/" + suffix
    }
    
}

extension AppDelegate{
    func setRootView(vc: UIViewController) {
        let nav = NavigationController(rootViewController: vc)
        nav.navigationBar.isHidden = true
        nav.modalPresentationStyle = .fullScreen
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    // MARK: Public
    func makeMainTabbar() {
        let mainTab = TabbarVC()
        self.mainTabbarController = mainTab
        let nc = UINavigationController(rootViewController: mainTab)
        nc.modalPresentationStyle = .fullScreen
        nc.navigationBar.isHidden = true
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}

class NavigationController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        if let topVC = viewControllers.last {
            return topVC.preferredStatusBarStyle
        }
        return .default
    }
}
