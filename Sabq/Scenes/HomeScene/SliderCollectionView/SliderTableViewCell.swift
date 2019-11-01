//
//  SliderTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import SkeletonView

class SliderTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var list: [Material]?
    
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self 
        sliderCollectionView.isPagingEnabled = true
        
        let nib = UINib(nibName: "SliderCollectionViewCell", bundle: nil)
        sliderCollectionView.register(nib, forCellWithReuseIdentifier: "SliderCollectionViewCell" )
        
        ( sliderCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
        sliderCollectionView.backgroundColor = UIColor.homeBackGroundColor
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let myList = list {
            pageControl.numberOfPages = myList.count
            return myList.count
        } else {
            pageControl.numberOfPages = 0
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell",
                                                         for: indexPath) as? SliderCollectionViewCell,
            let item = list?[indexPath.row] {
            
            cell.configCell(obj: item)
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in sliderCollectionView.visibleCells {
            let temp = sliderCollectionView.indexPath(for: cell)
            pageControl.currentPage = temp?.row ?? 0
        }
    }
    func configureCollection(list: [Material]) {
        self.list = list
        sliderCollectionView.reloadData()
    }
    
}

extension SliderTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.height)
    }
}
