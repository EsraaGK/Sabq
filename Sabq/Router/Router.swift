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
        } else {
            // Fallback on earlier versions
        }
                
//        if #available(iOS 13.0, *) {
//            let apperance = UITabBarAppearance()
//            apperance.backgroundColor = UIColor.homeBackGroundColor
//            tabBar.tabBar.standardAppearance.backgroundColor = UIColor(named: "TabbarBGColor")
//            //apperance.backgroundColor
//        } else {
//            // Fallback on earlier versions
//            tabBar.tabBar.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//
//        }
        //         tabBar.tabBar.isTranslucent = false
        //        tabBar.tabBar.backgroundColor = UIColor.homeBackGroundColor
        return tabBar
        
    }
    
    class func getTabBar() -> UITabBarController {
        let myTabBar = Router()
        return myTabBar.initializeTabBar()
    }
}
