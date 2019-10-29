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
    @IBOutlet weak var videosTitleLable: UILabel!
    @IBOutlet weak var moreVideosButton: UIButton!
    @IBOutlet weak var videosHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        videosTitleLable.text = NSLocalizedString("Videos", comment: "")
        moreVideosButton.setTitle(NSLocalizedString("More", comment: ""), for: .normal)
        configureVideosHeader()
        
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
    
    func configureVideosHeader() {
        let rect = CGRect(x:videosHeader.frame.minX,
                          y: videosHeader.frame.maxY + 18,
                          width: UIScreen.main.bounds.width,
                          height: 5)
        let horizontalLine = UIView(frame: rect)
        horizontalLine.backgroundColor = UIColor(displayP3Red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
        videosHeader.addSubview(horizontalLine)
        
        let lableRect = CGRect(x:videosTitleLable.frame.minX - 28,
                          y: videosTitleLable.frame.maxY + 12,
                          width: videosTitleLable.frame.width ,
                          height: 5)
        let lableHorizontalLine = UIView(frame: lableRect)
        lableHorizontalLine.backgroundColor = UIColor(displayP3Red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
        videosTitleLable.addSubview(lableHorizontalLine)
        
    }
}
