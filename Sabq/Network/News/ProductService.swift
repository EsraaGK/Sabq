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
    case HomepageLightVersion(page:Int)
    case Videos
    case Images
    case Articles
}

extension ActorsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .HomepageLightVersion:
            return "/material/homepage-light-version"
        case .Videos:
            return "/studio/list-studio/"
        case .Images:
            return "/studio/list-studio/"
        case .Articles:
            return "/material/articles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .HomepageLightVersion:
            return .get
        case .Videos:
            return .get
        case .Images:
            return .get
        case .Articles:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .HomepageLightVersion:
            return Data()
        case .Videos:
            return Data()
        case .Images:
             return Data()
        case .Articles:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .HomepageLightVersion(let page) :
			return .requestParameters(
                parameters: ["page":page],
				encoding: URLEncoding.default)
        case .Videos:
            return .requestParameters(
                parameters: ["type":"video"],
                encoding: URLEncoding.default)
        case .Images:
            return .requestParameters(
                parameters: ["type":"image"],
                encoding: URLEncoding.default)
        case .Articles:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
