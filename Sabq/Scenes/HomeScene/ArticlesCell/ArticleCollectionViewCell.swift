//
//  articleCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/23/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var autherLable: UILabel!
    @IBOutlet weak var autherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configArticleCollectionCell(obj:Material) {
        titleLable.text = obj.title
        autherImage.sd_setImage(with: URL(string: obj.authorImg!), placeholderImage: UIImage(named: "news-img_8"))
        autherImage.setRounded()
        autherLable.text = obj.authorName
        
    }
    
}
