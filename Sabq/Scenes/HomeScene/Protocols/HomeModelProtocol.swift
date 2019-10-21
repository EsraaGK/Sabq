//
//  HomeModelProtocol.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
protocol HomeModelProtocol {
    func getNews(forPage page:Int , compelation: @escaping (Result<Any,Error>)->Void)
    func getImages( completion: @escaping(Result<Any, Error>)->Void)
    func getVideos( completion: @escaping(Result<Any, Error>)->Void)
}

