//
//  AppDelegate.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import Foundation
import SkeletonView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = Router.getTabBar()
        window?.makeKeyAndVisible()
        
      //  if #available(iOS 13, *) {
         //   let traitCollection = UITraitCollection()
         //   if traitCollection.userInterfaceStyle == .dark {
                SkeletonAppearance.default.tintColor = .concrete
       
//            } else {
//                // use defaults
//                print("skipped")
//            }
//        }
        setupNetworking()
        return true
    }
    
    func setupNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults.defaults)
    }
    
}
