//
//  ImagesTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/22/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var list: [Material]?
    @IBOutlet private weak var imagesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        imagesCollectionView.register(nib, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        ( imagesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCollection(list: [Material]) {
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
       if let cell = imagesCollectionView.dequeueReusableCell(
            withReuseIdentifier: "ImageCollectionViewCell",
            for: indexPath) as? ImageCollectionViewCell, let item = list?[indexPath.row] {
        cell.configImagesCollectionCell(obj: item)
        return cell
       } else {
        return ImageCollectionViewCell()
        }
    }

}
