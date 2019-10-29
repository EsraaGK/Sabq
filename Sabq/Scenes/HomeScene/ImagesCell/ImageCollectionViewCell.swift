//
//  ImageCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/23/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
     @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureGradientView()
    }
    
    func configImagesCollectionCell(obj:Material) {
        titleLable.text = obj.title
        newsImage.sd_setImage(with: URL(string: obj.coverPhoto!), placeholderImage: UIImage(named: "news-img_8"))
        timeLable.text = obj.publishDate?.convertStringToMonthDate()
        
    }
    
    func configureGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = newsImage.frame
        gradientLayer.opacity = 0.4
        newsImage.layer.addSublayer(gradientLayer)
    }

}
