//
//  AppDelegate.swift
//  Banking
//
//  Created by Balaganesh S on 22/05/19.
//  Copyright © 2019 Juspay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Appearance.setGlobalAppearance()
        let initialController = window?.rootViewController as! UINavigationController
        let accountsController = initialController.viewControllers.first as! AccountsViewController
        accountsController.stateController = StateController(storageController: StorageController())
        return true
    }

    struct Appearance {
        static func setGlobalAppearance() {
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().barTintColor = .littleDarkBlue
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }

}

