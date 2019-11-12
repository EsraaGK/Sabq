//
//  TabBar.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
import UIKit

class Router {
    private let tabBar = UITabBarController()
    private let mainNavigationController = UINavigationController(rootViewController: LoginScreenViewController())
    private let homeNavigationController = UINavigationController(rootViewController:
        HomeModule.getHomeViewController())

    private func initializeTabBar() -> UITabBarController {
         
        let search = SearchViewController()
        let title = NSLocalizedString("Search", comment: "")
        let  image = #imageLiteral(resourceName: "ic_search")
        let barItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        search.tabBarItem = barItem
        tabBar.viewControllers = [homeNavigationController, search]
        
        if #available(iOS 11.0, *) {
            tabBar.tabBar.barTintColor = UIColor(named: "TabbarBGColor")
            tabBar.tabBar.isTranslucent = false
            homeNavigationController.navigationBar.barTintColor = UIColor(named: "TabbarBGColor")
            homeNavigationController.navigationBar.isTranslucent = false
        } else {
            // Fallback on earlier versions
        }
        
        return tabBar
        
    }
    
    class func getTabBar() -> UITabBarController {
        let router = Router()
        return router.initializeTabBar()
    }
    func getNavController() -> UINavigationController {
        return self.mainNavigationController
    }
    class func getMainNavcontroller() -> UINavigationController {
        let router = Router()
        return router.getNavController()
    }
}
