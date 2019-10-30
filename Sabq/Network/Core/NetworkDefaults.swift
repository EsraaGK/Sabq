//
//  NetworkDefaults.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "https://sabq.org/api"
    var apiKey: String = "64136909d656d1d3201c552d4f3a6af3"
	var language: String = "en-US"
//    var XApiKey: String = "64136909d656d1d3201c552d4f3a6af3"
//
//    private enum CodingKeys: String, CodingKey {
//        case XApiKey = "X-Api-Key"
//    }
    
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
    private init() {
    
    }
}
