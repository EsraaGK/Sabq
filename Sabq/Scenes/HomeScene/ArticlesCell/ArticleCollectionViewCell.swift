//
//  articleCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/23/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var autherLable: UILabel!
    @IBOutlet private weak var autherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configArticleCollectionCell(obj: Material) {
        titleLable.text = obj.title
        guard let stringPath = obj.authorImg else { return }
        autherImage.sd_setImage(with: URL(string: stringPath), placeholderImage: #imageLiteral(resourceName: "news-img_8"))
        //news-img_8
        autherImage.setRounded()
        autherLable.text = obj.authorName
        
    }
    
}
