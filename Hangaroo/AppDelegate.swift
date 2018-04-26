//
//  AppDelegate.swift
//  Hangaroo
//
//  Created by Sayat Orazkulov on 13.06.17.
//  Copyright © 2018 Sayat. All rights reserved.
//

import UIKit
import Sugar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = UINavigationController(rootViewController: ThemesViewController())
        homeViewController.view.backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isHidden = true
        window!.rootViewController = homeViewController
        window?.makeKeyAndVisible()
        return true
    }
}

