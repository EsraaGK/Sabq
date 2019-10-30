//
//  NetworkService+ProductService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getNews(pageNumber: Int, completion: @escaping (
        _ result: Swift.Result<HomeApiResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(ActorsService.homepageLightVersion(page: pageNumber))) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(HomeApiResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                       
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getVideos(/*pageNumber:Int, */completion: @escaping (
        _ result: Swift.Result<StudioApiResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(ActorsService.videos)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(StudioApiResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                        
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getImages(/*pageNumber:Int, */completion: @escaping (
        _ result: Swift.Result<StudioApiResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(ActorsService.images)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(StudioApiResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                        
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }

    func getArticles(/*pageNumber:Int, */completion: @escaping (
        _ result: Swift.Result<ArticleApiResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(ActorsService.articles)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(ArticleApiResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                        
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
}
