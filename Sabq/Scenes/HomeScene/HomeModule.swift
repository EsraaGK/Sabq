//
//  HomeModule.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
import UIKit

class HomeModule{
    
    class func getHomeViewController()-> HomeViewController{
        let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
        view.title = "SABQ"
        
        let model = HomeModel()
        let presenter = HomePresenter(View: view, Model: model)
        view.setPresenter(presenter: presenter)
        return view
    }
}

