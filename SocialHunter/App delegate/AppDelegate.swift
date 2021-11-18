//
//  AppDelegate.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 07/10/21.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point fo\r customization after application launch.
        GMSServices.provideAPIKey("AIzaSyD3p2Hf0NbpxYt5HZmTUsnGRM9O1XzxtGg")
        sleep(2)
        IQKeyboardManager.shared.enable = true
        setRootController(vcId: .loginNav, stroybordName: .Login, animation: .transitionFlipFromRight)
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

