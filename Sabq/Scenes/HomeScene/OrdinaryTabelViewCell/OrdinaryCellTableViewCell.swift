//
//  ordinaryCellTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/17/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit
import SDWebImage

class OrdinaryCellTableViewCell: UITableViewCell {

    @IBOutlet private weak var newsHeaderLable: UILabel!
    @IBOutlet private weak var newsImg: UIImageView!
    @IBOutlet private weak var timeLable: UILabel!
    @IBOutlet private weak var viewsLable: UILabel!
    @IBOutlet private weak var viewsImg: UIImageView!
    @IBOutlet private weak var markImg: UIImageView!
    @IBOutlet private weak var timeImg: UIImageView!
    @IBOutlet private weak var detailsView: UIView!
    @IBOutlet private weak var videoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(obj: Material) {
        hideSkeletonAnimatin()
        newsHeaderLable.text = obj.title
        
       guard let videosCount = obj.videosCount else { return }
        videoImage.isHidden = videosCount > 0 ? false : true
        
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
        guard let viewsNumber = obj.noOfViews else { return }
        viewsLable.text = String(viewsNumber)
        viewsImg.image = viewsNumber > 5000 ? #imageLiteral(resourceName: "ic_views_icon_hot") : #imageLiteral(resourceName: "ic_views_icon")
        
        guard let stringPath = obj.coverPhoto else { return }
               newsImg.sd_setImage(with: URL(string: stringPath), placeholderImage: #imageLiteral(resourceName: "placeHolder"))
    }
    
    func hideSkeletonAnimatin() {

        [newsHeaderLable].forEach { $0?.hideSkeleton() }
        [detailsView].forEach { $0?.hideSkeleton() }
        
    }
}
