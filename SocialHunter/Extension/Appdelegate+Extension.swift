//
//  Appdelegate+Extension.swift
//  GTSA-IOS
//
//  Created by Manpreet Singh on 12/08/21.
//

import Foundation
import  UIKit

extension UIApplication {
    static func getAppdelegate() -> AppDelegate? {
        if let appdelegate = UIApplication.shared.delegate as? AppDelegate {
            return appdelegate
        }
        return nil
    }
    
    static func getWindow() -> UIWindow? {
        // let windowScene = UIApplication.shared.connectedScenes.first { $0.delegate != nil }
        let window = UIApplication.shared.keyWindow
        //    if let sd : SceneDelegate = (windowScene?.delegate as? SceneDelegate) {
        //      return sd.window
        //    }
        return window
    }
}


extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

extension AppDelegate {
    
    func setRootController(vcId:VCID, stroybordName: AppStoryboard, animation: UIView.AnimationOptions = .transitionFlipFromRight){
        let storyboard = UIStoryboard(name: stroybordName.rawValue, bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: vcId.id)
        guard let window = self.window else {
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
            return }
        UIView.transition(with: window, duration: 0.5, options: animation, animations: {
            self.window?.rootViewController = nav
        }, completion: nil)
        self.window?.makeKeyAndVisible()
    }
}

