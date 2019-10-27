//
//  HomeModel.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
class HomeModel: HomeModelProtocol {
    
    let networkManager = NetworkManager()
    
    func getNews(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getNews(pageNumber: page) {(result:Result<HomeApiResponse, NetworkError>,_)in
            switch result {
            case .success(let homeApiResponse):compelation(.success(homeApiResponse))
            case .failure: print("help from NewsModel")
                
            }
            
        }
    }
    
    func getVideos( completion compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getVideos { (result:Result<StudioApiResponse, NetworkError>, _) in
            switch result {
            case .success(let videosApiResponse):compelation(.success(videosApiResponse))
            case .failure: print("help from NewsModel")
            }
        
        }
    }
    
    func getImages(completion: @escaping(Result<Any, Error>) -> Void) {
        networkManager.getImages { (result:Result<StudioApiResponse, NetworkError>,_) in
            switch result {
            case .success(let imagesApiResponse): completion(.success(imagesApiResponse))
            case .failure: print("help from NewsModel")
            }
        }
        
    }
    
    func getArticles(completion: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getArticles { (result:Result<ArticleApiResponse, NetworkError>, _) in
            switch result {
            case .success(let articleApiResponse): completion(.success(articleApiResponse))
            case .failure: print("help from NewsModel")
                }
            }
        }
    
}
