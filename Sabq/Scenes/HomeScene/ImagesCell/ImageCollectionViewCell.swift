//
//  ImageCollectionViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/23/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var newsImage: UIImageView!
    @IBOutlet private weak var timeLable: UILabel!
    @IBOutlet private weak var titleLable: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureGradientView()
    }
    
    func configImagesCollectionCell(obj: Material) {
        titleLable.text = obj.title
        timeLable.text = obj.publishDate?.convertStringToMonthDate()
        guard let stringPath = obj.coverPhoto else { return }
        newsImage.sd_setImage(with: URL(string: stringPath), placeholderImage: #imageLiteral(resourceName: "placeHolder"))
        
    }
    
    func configureGradientView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = newsImage.frame
        gradientLayer.opacity = 0.2
        newsImage.layer.addSublayer(gradientLayer)
    }

}

extension ImageCollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib = UINib(nibName: identifier, bundle: Bundle.main)
}
