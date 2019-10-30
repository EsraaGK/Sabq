//
//  VideosCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/22/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var videoImage: UIImageView!
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var timeLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configVideosCollectionCell(obj: Material) {
        titleLable.text = obj.title
        guard let vId = obj.vid else { return }
        let imgPath = "https://img.youtube.com/vi/"+vId+"/1.jpg"
        videoImage.sd_setImage(with: URL(string: imgPath), placeholderImage: #imageLiteral(resourceName: "placeHolder"))
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
       
    }

}
