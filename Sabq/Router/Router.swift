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
    private let navController = UINavigationController(rootViewController: HomeModule.getHomeViewController())
    
    private func initializeTabBar() -> UITabBarController {
        let search = SearchViewController()
        let title = NSLocalizedString("Search", comment: "")
        let  image = #imageLiteral(resourceName: "ic_search")
        let barItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        search.tabBarItem = barItem
        tabBar.viewControllers = [navController, search]
        
        if #available(iOS 11.0, *) {
            tabBar.tabBar.barTintColor = UIColor(named: "TabbarBGColor")
            tabBar.tabBar.isTranslucent = false
            navController.navigationBar.barTintColor = UIColor(named: "TabbarBGColor")
            navController.navigationBar.isTranslucent = false
        } else {
            // Fallback on earlier versions
        }
        
        return tabBar
        
    }
    
    class func getTabBar() -> UITabBarController {
        let myTabBar = Router()
        return myTabBar.initializeTabBar()
    }
}
