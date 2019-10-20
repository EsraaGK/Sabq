//
//  HomePresenter.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
class HomePresenter: BasePresenterProtocol{
    var view:HomeViewProtocol
    var model:HomeModelProtocol
    
    init(View:HomeViewProtocol, Model:HomeModelProtocol){
        self.view = View
        self.model = Model
        
    }
    
    func getNews(forPage PageNo:Int){
        model.getNews(forPage: PageNo){ result/*:(Result<Any, Error>) */in
                
                switch result{
                case .success(let list):do {
                    let response = list as! HomeApiResponse
                    let array = [response.slider , response.materials]
                    self.view.loadDataSuccess(date: array)
                    
                    print("the code is FROM HOME PRESENTER\(response.code)")
                    }
                case .failure(_):print("help from ListActorModel")
                }
        }
   }
    
}
