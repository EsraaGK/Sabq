//
//  HomeAdapter.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//  swiftlint:disable all

import Foundation
import UIKit
import SkeletonView

class HomeAdapter: NSObject, HomeAdapterProtocol/*, UITableViewDataSource*/{
    
    var list: [CellTypeProtocol]? {
        didSet {
            reloadData?()
        }
    }
    var sliderList: CellTypeProtocol? {
        didSet {
            reloadData?()
        }
    }
    
    var homeTable: UITableView
    
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
        } else {
            return 0
        }
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        if  index.row == list?.count {
            return  true
        } else {
            return false
        }
    }
    
    func clear(reload: Bool) {
        
    }
    
    func add(item: CellTypeProtocol, at index: Int) {
        
        list?.insert(item, at: index)
        
    }
    
    func add(items: [CellTypeProtocol]) {
        list = items
    }
    
    func addToSlider(item: CellTypeProtocol) {
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
            switch section {
            case 0: return 1  //slider
            default: return (myList.count ) //news+videos+...
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = list?[indexPath.row] else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SliderTableViewCell.identifier,
                                                        for: indexPath) as? SliderTableViewCell,
                let list = sliderList as? SliderCellModel {
                cell.configureCollection(list: list.material)
                return cell
            }
        default: // section 2
            switch item.cellType {
            case .videos:do {
                if let cell = tableView.dequeueReusableCell(withIdentifier: VideoHomeTableViewCell.identifier,
                                                            for: indexPath) as? VideoHomeTableViewCell,
                    let list = item as? VideosModel {
                    cell.configureVideoCollection(list: list.videosMaterials)
                    return cell
                }
                }
            case .images:do {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ImagesTableViewCell.identifier,
                                                            for: indexPath) as? ImagesTableViewCell,
                    let list = item as? ImagesModel {
                    cell.configureCollection(list: list.imagesMaterials)
                    return cell
                }
                }
            case .articles:do {
                if let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.identifier,
                                                            for: indexPath) as? ArticlesTableViewCell,
                    let list = item as? ArticlesModel {
                    cell.configureCollection(list: list.articlesMaterials)
                    return cell
                }
                }
            default : do {
                if let cell = tableView.dequeueReusableCell(withIdentifier: OrdinaryCellTableViewCell.identifier,
                                                            for: indexPath) as? OrdinaryCellTableViewCell,
                    let list = item as? OrdinaryCellModel {
                    cell.configCell(obj: list.material)
                    return cell
                }
                }
                
            }
        }
        return UITableViewCell()
    }
}

extension HomeAdapter: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return  1
        default: return 3
        }
    }
    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        
        switch indexPath.section {
        case 0: return  SkeletonTableViewCell.identifier
        default: return OrdinaryCellTableViewCell.identifier
        }
    }
    
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 2
    }
}
