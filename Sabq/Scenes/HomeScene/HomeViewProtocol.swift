//
//  HomeViewProtocol.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
protocol HomeViewProtocol {
    
    func loadDataFailed(with error: Error?)
    func loadDataSuccess(date: Any)
    
}
