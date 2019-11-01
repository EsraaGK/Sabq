//
//  SkeletonTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/27/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class SkeletonTableViewCell: UITableViewCell {
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var viewsLbl: UILabel!
    @IBOutlet private weak var markImg: UIImageView!
    @IBOutlet private weak var sincelable: UILabel!
    @IBOutlet private weak var viewimg: UIView!
    @IBOutlet private weak var script: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var time: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code\
        self.backgroundColor = UIColor.homeBackGroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func hideSkeltonView() {
        [viewsLbl, sincelable, script, title].forEach { $0?.hideSkeleton() }
        [img, markImg, viewimg, time].forEach { $0?.hideSkeleton() }
    }
   
}
