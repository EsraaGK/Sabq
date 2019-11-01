//
//  VideoHomeTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/21/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class VideoHomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var list: [Material]?
    @IBOutlet private weak var videosCollectionView: UICollectionView!
    @IBOutlet private weak var videosTitleLable: UILabel!
    @IBOutlet private weak var moreVideosButton: UIButton!
    @IBOutlet private weak var videosHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videosTitleLable.text = NSLocalizedString("Videos", comment: "")
        moreVideosButton.setTitle(NSLocalizedString("More", comment: ""), for: .normal)
        
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        let videoNib = UINib(nibName: "VideosCollectionViewCell", bundle: nil)
        videosCollectionView.register(videoNib, forCellWithReuseIdentifier: "VideosCollectionViewCell")
        ( videosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
        
        self.backgroundColor = UIColor.collectionBackgroundColor
        videosCollectionView.backgroundColor = UIColor.collectionBackgroundColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureVideoCollection(list: [Material]) {
        self.list = list
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let myList = list {
            return myList.count
            
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell",
                                                         for: indexPath) as? VideosCollectionViewCell,
            let item = list?[indexPath.row] {
            cell.configVideosCollectionCell(obj: item )
            return cell
        } else { return UICollectionViewCell() }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    
}
