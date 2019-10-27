//
//  VideoHomeTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/21/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class VideoHomeTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
 
    var list :[Material]?
    @IBOutlet weak var videosCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        let videoNib = UINib(nibName: "VideosCollectionViewCell", bundle: nil)
        videosCollectionView.register(videoNib, forCellWithReuseIdentifier: "VideosCollectionViewCell")
        ( videosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureVideoCollection(list:[Material]) {
        self.list=list
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let myList = list {
            return myList.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideosCollectionViewCell", for: indexPath) as? VideosCollectionViewCell
        cell!.configVideosCollectionCell(obj: list![indexPath.row])
        return cell!
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
}
