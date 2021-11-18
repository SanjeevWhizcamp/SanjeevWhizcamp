//
//  CustomTabBarController.swift
//  ThumbRealEstate
//
//  Created by Raman Bhola on 25/08/21.
//

import UIKit

class CustomTabBarController: UITabBarController{

    let coustmeTabBarView:UIView = {
        
        //  daclare coustmeTabBarView as view
        let view = UIView(frame: .zero)
        
        // to make the cornerRadius of coustmeTabBarView
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        
        // to make the shadow of coustmeTabBarView
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 20
      //  self.tabBar.layer.borderWidth = 1.0
      //  self.tabBar.layer.borderColor = UIColor.red.cgColor
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        self.tabBar.layer.masksToBounds = false
//        self.tabBar.layer.shadowColor = UIColor.black.cgColor
//        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.tabBar.layer.shadowOpacity = 0.12
//        self.tabBar.layer.shadowRadius = 10.0
       // addcoustmeTabBarView()
        hideTabBarBorder()
        self.selectedIndex = 0
        
        
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
         coustmeTabBarView.frame = tabBar.frame
      }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    private func addcoustmeTabBarView() {
       coustmeTabBarView.frame = tabBar.frame
        view.addSubview(coustmeTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }
    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = false
        
    }
//    func hideBackground()
//    {
//        coustmeTabBarView.isHidden = true
//        coustmeTabBarView.removefro
//    }
    var count = 0
    
}
extension CustomTabBarController: UITabBarControllerDelegate  {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       // print(selectedIndex)
       
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
          return false // Make sure you want this as false
        }
        if fromView != toView {
          UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }

        return true
    }
    

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        //Tab tapped
        guard let viewControllers = tabBarController.viewControllers else { return }
        let tappedIndex = viewControllers.firstIndex(of: viewController)!
        if tappedIndex == 4
        {
        let role = UserDefaults.standard.value(forKey: "role") as! String
            
            let home = HomeVC.instantiate()
            let chat = ChatVC.instantiate()
            let pitch = CreatePitchVC.instantiate()
            pitch.type = "Idea"
            let notification = NotificationVC.instantiate()
            home.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "home-Tab"), selectedImage: UIImage(named: "home-Tab"))
            chat.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Chat-Tab"), selectedImage: UIImage(named: "Chat-Tab"))
            pitch.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tabCreate"), selectedImage: UIImage(named: "tabCreate"))
            pitch.tabBarItem.imageInsets = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
            notification.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "bell"), selectedImage: UIImage(named: "bell"))
        if role == "Artist"
        {
            let profile = ArtistProfileVC.instantiate()
            profile.tabSt = true
            let nav = UINavigationController.init(rootViewController: profile)
            
            nav.isNavigationBarHidden = true
            profile.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user-Tab"), selectedImage: UIImage(named: "user-Tab"))
            self.viewControllers = [home,chat,pitch,notification,nav]
            tabBarController.setViewControllers([home,chat,pitch,notification,nav], animated: true)
       
        }
        else if role == "Investor"
         {
             let profile = InvestorProfileVC.instantiate()
            profile.tabSt = true
            let nav = UINavigationController.init(rootViewController: profile)
            nav.isNavigationBarHidden = true
            profile.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user-Tab"), selectedImage: UIImage(named: "user-Tab"))
             self.viewControllers = [home,chat,pitch,notification,nav]
            tabBarController.setViewControllers([home,chat,pitch,notification,nav], animated: true)
         }
        else if role == "Organisation"
         {
             let profile = OrganisationProfileVC.instantiate()
            profile.tabSt = true
            let nav = UINavigationController.init(rootViewController: profile)
            nav.isNavigationBarHidden = true
            profile.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "user-Tab"), selectedImage: UIImage(named: "user-Tab"))
             self.viewControllers = [home,chat,pitch,notification,nav]
            tabBarController.setViewControllers([home,chat,pitch,notification,nav], animated: true)
         }
    }
    }
   
}
extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
