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
    
    private func initializeTabBar()->UITabBarController{
        let Search = SearchViewController()
        Search.title = "SEARCH"
        
        tabBar.viewControllers = [navController, Search]
        return tabBar
        
    }
    
    class func getTabBar()->UITabBarController{
        let myTabBar = Router()
        return myTabBar.initializeTabBar()
    }
    
    
    

}
