//
//  HomeAdapterProtocol.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation

protocol HomeAdapterProtocol {
  
    associatedtype DataType
    //    associatedtype AdapterDelegate where AdapterDelegate:listAdapterDelegate
    
    var list: [DataType]? { get set}
   
    var reloadData:(() -> Void)? { get set}
    
    var showEmptyState: ((Bool) -> Void)? { get set}
    
    func add(item: DataType, at index: Int)
    func add(items: [DataType])
    func update(item: DataType)
    func count() -> Int
    func isLastIndex(index: IndexPath) -> Bool
    func clear(reload: Bool)
}
