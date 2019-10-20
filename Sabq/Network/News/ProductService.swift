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
}

extension ActorsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .HomepageLightVersion:
            return "/homepage-light-version"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .HomepageLightVersion:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .HomepageLightVersion:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .HomepageLightVersion(let page) :
			return .requestParameters(
                parameters: ["page":page],
				encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
