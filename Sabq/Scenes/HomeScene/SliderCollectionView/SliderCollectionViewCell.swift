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

    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var viewsLable: UILabel!
    @IBOutlet weak var viewsImg: UIImageView!
    var pageNumber = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(obj:Material, number:Int) {
        pageNumber = number
        
        titleLable.text = obj.title
        descriptionLable.text = obj.descriptionString
        imgNews.sd_setImage(with: URL(string: obj.coverPhoto!), placeholderImage: UIImage(named: "news-img_8"))
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
        viewsLable.text = String(obj.noOfViews!)
        if obj.noOfViews! > 5000 {
            viewsImg.image = UIImage(named: "ic_views_icon_hot")
        } else {
            viewsImg.image = UIImage(named: "ic_views_icon")
        }
    }
    func hideSkeletonAnimatin() {
        [titleLable, descriptionLable, timeLable, viewsLable].forEach { $0?.hideSkeleton()}
        viewsImg.hideSkeleton()
    }
    func getPageControlNumber() -> Int {
        return pageNumber
    }
}
