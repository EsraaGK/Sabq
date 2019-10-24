//
//  VideosCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/22/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configVideosCollectionCell(obj:Material){
        titleLable.text = obj.title
        videoImage.sd_setImage(with: URL(string: obj.coverPhoto!), placeholderImage: UIImage(named: "news-img_8"))
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
       
    }

}
