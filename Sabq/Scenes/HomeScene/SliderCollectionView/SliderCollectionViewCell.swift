//
//  SliderCollectionViewCell.swift
//  Sabq
//
//  Created by Esraa Mohamed on 10/18/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import SkeletonView

class SliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imgNews: UIImageView!
    @IBOutlet private weak var titleLable: UILabel!
    @IBOutlet private weak var descriptionLable: UILabel!
    @IBOutlet private weak var timeLable: UILabel!
    @IBOutlet private weak var viewsLable: UILabel!
    @IBOutlet private weak var viewsImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLable.textColor = UIColor.titleLableColor
        descriptionLable.textColor = UIColor.descriptionLableColor
    }
    
    func configCell(obj: Material) {
    
        titleLable.text = obj.title
        descriptionLable.text = obj.descriptionString
        
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
        
        guard let viewsNumber = obj.noOfViews else { return }
        viewsLable.text = String(viewsNumber)
        viewsImg.image = viewsNumber > 5000 ? #imageLiteral(resourceName: "ic_views_icon_hot") : #imageLiteral(resourceName: "ic_views_icon")
    
        guard let stringPath = obj.coverPhoto else { return }
        imgNews.sd_setImage(with: URL(string: stringPath), placeholderImage: #imageLiteral(resourceName: "placeHolder"))
    }
    func hideSkeletonAnimatin() {
        [titleLable, descriptionLable, timeLable, viewsLable].forEach { $0?.hideSkeleton() }
        viewsImg.hideSkeleton()
    }
    
}
extension SliderCollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    static var nib = UINib(nibName: identifier, bundle: Bundle.main)
}
