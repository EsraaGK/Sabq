//
//  ProductService.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable  force_unwrapping

enum  ActorsService {
    case homepageLightVersion(page: Int)
    case videos
    case images
    case articles
}

extension ActorsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .homepageLightVersion:
            return "/material/homepage-light-version"
        case .videos:
            return "/studio/list-studio/"
        case .images:
            return "/studio/list-studio/"
        case .articles:
            return "/material/articles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .homepageLightVersion:
            return .get
        case .videos:
            return .get
        case .images:
            return .get
        case .articles:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .homepageLightVersion:
            return Data()
        case .videos:
            return Data()
        case .images:
             return Data()
        case .articles:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .homepageLightVersion(let page) :
			return .requestParameters(
                parameters: ["page": page],
				encoding: URLEncoding.default)
        case .videos:
            return .requestParameters(
                parameters: ["type": "video"],
                encoding: URLEncoding.default)
        case .images:
            return .requestParameters(
                parameters: ["type": "image"],
                encoding: URLEncoding.default)
        case .articles:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
