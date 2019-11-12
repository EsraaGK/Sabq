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
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    let mainNavigationController = Router.getMainNavcontroller()
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = mainNavigationController
        
        GIDSignIn.sharedInstance().clientID = "443168031149-shpuail4ntko6os9sen3vgpn58263pvo.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        window?.makeKeyAndVisible()
        setupNetworking()
        return true
    }
    
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
       
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
//

        // Perform any operations on signed in user here.
        mainNavigationController.pushViewController(Router.getTabBar(), animated: false )
            //  print(user.profile.name)
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func setupNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults.defaults)
    }
    
}
