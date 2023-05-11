//
//  AppDelegate.swift
//  OneLoveApp
//
//  Created by Ruslan Dalgatov on 05.04.2023.
//

import UIKit
import YandexMapsMobile

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        YMKMapKit.setApiKey("2b74c897-0400-4278-800e-54b57f68814f")
        YMKMapKit.sharedInstance().onStart()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }


}

