//
//  HomeModule.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
import UIKit

class HomeModule {
    @objc class func logoutUser() { print("clicked") }
    
    class func getHomeViewController() -> HomeViewController {
        let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let title = NSLocalizedString("News", comment: "")
        let image = #imageLiteral(resourceName: "ic_newspaper_active")
        let barItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        view.tabBarItem = barItem
        
       view.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "img_logo"))
        
        let rightBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notification-icon").withRenderingMode(.alwaysOriginal),
                                           style: .done,
                                           target: self,
                                           action: #selector(HomeModule.logoutUser) )
        view.navigationItem.rightBarButtonItem = rightBarItem
        
        let leftBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "img_user").withRenderingMode(.alwaysOriginal),
                                          style: .done,
                                          target: self,
                                          action: #selector(HomeModule.logoutUser) )
         view.navigationItem.leftBarButtonItem = leftBarItem
    
        let model = HomeModel()
        let presenter = HomePresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)
        return view
    }
}
