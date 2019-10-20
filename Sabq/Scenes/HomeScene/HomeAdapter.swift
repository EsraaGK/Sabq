//
//  HomeAdapter.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
import UIKit

class HomeAdapter:NSObject, HomeAdapterProtocol, UITableViewDataSource{
    var list: [[Material]]?
    
    var homeTable:UITableView
    
    init(tableView: UITableView) {
        homeTable = tableView
    }
    typealias DataType = [Material]
    //    associatedtype AdapterDelegate where AdapterDelegate:listAdapterDelegate
    
    var reloadData: (() -> Void)?
    
    var showEmptyState: ((Bool) -> Void)?
    
    func count() -> Int {
        if let mylist = list {
            return mylist.count
        }else{
         return 0
        }
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        if  index.row == list!.count {
            return  true
        }else{
            return false
        }
    }
    
    func clear(reload: Bool) {
        
    }
    
    func add(item: [Material]) {
        
    }
    
    func add(items: [[Material]]) {
        list = items
        print("FROM ADAPTER \(items[0][0].title!)")
    }
    
    func update(item: [Material]) {
        
    }
    
    
    //___________________
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = homeTable.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            return cell
        default:
            let cell = homeTable.dequeueReusableCell(withIdentifier: "OrdinaryCellTableViewCell", for: indexPath) as! OrdinaryCellTableViewCell
            return cell
        }
        
    }
    
    
}
