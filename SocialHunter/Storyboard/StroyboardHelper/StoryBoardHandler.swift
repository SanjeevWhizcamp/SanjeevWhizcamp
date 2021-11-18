//
//  StoryBoardHandler.swift
//  Marco Ritacca
//
//  Created by Harmandeep Singh on 15/09/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
         
protocol Instantiatable {
    static var instanceValue: AppStoryboard { get }
}

enum VCID {
    case loginNav
    case homeTab
    case admin

    var id: String {
        switch self {
        case .loginNav:
            return "loginNav"
        case .homeTab:
            return "HomeTab"
        
        case .admin :
            return "Admin"
        }
    }
}

enum AppStoryboard : String {
    
    case main = "Main"
    case Login = "Login"
    case Profile = "Profile"
    case admin = "Admin"
    case user = "User"
    case dashboard = "Dashboard"
    case pitch = "Pitch"
    case chat = "Chat"
    case task = "Task"
    case menu = "Menu"
    var instance : UIStoryboard {

        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func tabBarController<T : UITabBarController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UITabBarController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID:  String {

        return "\(self)"
    }
}

extension Instantiatable where Self: UIViewController {
    
    static func instantiate() -> Self {
        return self.instanceValue.viewController(viewControllerClass: self)
    }
}

extension Instantiatable where Self: UITabBarController {
    
    static func instantiateTabBar() -> Self {
        return self.instanceValue.tabBarController(viewControllerClass: self)
    }
}
