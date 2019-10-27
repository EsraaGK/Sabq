//
//  HomePresenter.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
class HomePresenter: BasePresenterProtocol {
    var view:HomeViewProtocol
    var model:HomeModelProtocol
    
    init(view:HomeViewProtocol, model:HomeModelProtocol) {
        self.view = view
        self.model = model
        
    }
    
    func getNews(forPage pageNo:Int) {
        model.getNews(forPage: pageNo) { result/*:(Result<Any, Error>) */in
                
                switch result {
                case .success(let list):do {
                    let response = list as? HomeApiResponse
                    let array = [response!.slider , response!.materials]
                    self.view.loadDataSuccess(date: array)
                    
                    print("the code is FROM HOME PRESENTER\(response!.code)")
                    }
                case .failure: print("help from ListActorModel")
                }
        }
   }
    
    func getVideos() {
        model.getVideos { result in
            
            switch result {
            case .success(let list):do {
                 let response = list as? StudioApiResponse
                guard let temp = response?.comics else {return}
                self.view.loadVideosSuccess(date: temp)
                
                }
            case .failure: print("help from ListActorModel")
            }
        }
    }
    
    func getImages() {
        model.getImages { result in
            
            switch result {
            case .success(let list):do {
                let response = list as? StudioApiResponse
                guard let temp = response?.comics else {return}
                self.view.loadImagesSuccess(date: temp)
                
                }
            case .failure: print("help from ListActorModel")
            }
        }
    }
    
    func getArticles() {
        model.getArticles { result in
            
            switch result {
            case .success(let list):do {
                let response = list as? ArticleApiResponse
                guard let temp = response?.materials else {return}
                self.view.loadArticlesSuccess(date: temp)
                
                }
            case .failure: print("help from ListActorModel")
            }
        }
    }
    
}
