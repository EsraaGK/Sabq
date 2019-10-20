//
//  HomeModel.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
class HomeModel: HomeModelProtocol{
    let networkManager = NetworkManager()
    
    func getNews(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        networkManager.getNews(pageNumber: page){(result:Result<HomeApiResponse, NetworkError>,statusCode: StatusCode?)in
            switch result{
            case .success(let homeApiResponse):compelation(.success(homeApiResponse))
            case .failure(_):print("help from ListActorModel")
                
            }
            
        }
    }
    
    
}
