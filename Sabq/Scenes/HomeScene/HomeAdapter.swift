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
    var list: [CellTypeProtocol]?{
        didSet{
             reloadData!()
        }
    }
    var sliderList:CellTypeProtocol?{
        didSet{
            reloadData!()
        }
    }
    
    var homeTable:UITableView
    
    init(tableView: UITableView) {
        homeTable = tableView
    }
    typealias DataType = CellTypeProtocol
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
    
    func add(item: CellTypeProtocol, at index: Int) {
        
        list!.insert(item, at: index)
      
    }
    
    func add(items: [CellTypeProtocol]) {
        list = items
    }
    
    func addToSlider(item: CellTypeProtocol){
        sliderList = item
    }
    
    func update(item: CellTypeProtocol) {
        
    }
    
    
    //___________________
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myList = list {
            switch section{
            case 0: return 1  //slider
            default: return (myList.count ) //news+videos+...
            }
        }else{
         return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = homeTable.dequeueReusableCell(withIdentifier: "SliderTableViewCell", for: indexPath) as! SliderTableViewCell
            cell.configureCollection(list: (sliderList as! SliderCellModel).material)
            return cell
        default: // section 2
            switch list![indexPath.row].cellType{
            case .videos:do{
                let cell = homeTable.dequeueReusableCell(withIdentifier: "VideoHomeTableViewCell", for: indexPath) as! VideoHomeTableViewCell
                cell.configureVideoCollection(list: (list![indexPath.row] as! VideosModel).videosMaterials)
                return cell
                }
            case .images:do{
                let cell = homeTable.dequeueReusableCell(withIdentifier: "ImagesTableViewCell", for: indexPath) as! ImagesTableViewCell
                cell.configureCollection(list: (list![indexPath.row] as! ImagesModel).imagesMaterials)
                return cell
                }
            case .articles:do{
                let cell = homeTable.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath) as! ArticlesTableViewCell
                cell.configureCollection(list: (list![indexPath.row] as! ArticlesModel).articlesMaterials)
                return cell
                }
            default : do{
                let cell = homeTable.dequeueReusableCell(withIdentifier: "OrdinaryCellTableViewCell", for: indexPath) as! OrdinaryCellTableViewCell
                cell.configCell(obj: (list![indexPath.row] as! OrdinaryCellModel).material)
                return cell
                
                }
                
            }
        }
    }
    
    
}
