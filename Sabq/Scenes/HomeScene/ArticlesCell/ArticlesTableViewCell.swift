//
//  ArticlesTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/23/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    var list:[Material]?
    @IBOutlet weak var articlesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        articlesCollectionView.delegate = self
        articlesCollectionView.dataSource = self
        
        let nib = UINib(nibName: "ArticleCollectionViewCell", bundle: nil)
        articlesCollectionView.register(nib, forCellWithReuseIdentifier: "ArticleCollectionViewCell")
        ( articlesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection = .horizontal
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCollection(list:[Material]) {
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
        let cell = articlesCollectionView!.dequeueReusableCell(
            withReuseIdentifier: "ArticleCollectionViewCell", for: indexPath) as? ArticleCollectionViewCell
        cell!.configArticleCollectionCell(obj: list![indexPath.row])
        return cell!
    }
}
