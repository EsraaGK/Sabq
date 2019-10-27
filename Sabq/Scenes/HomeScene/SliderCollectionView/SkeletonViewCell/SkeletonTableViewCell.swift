//
//  SkeletonTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/27/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class SkeletonTableViewCell: UITableViewCell {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var viewsLbl: UILabel!
    @IBOutlet weak var markImg: UIImageView!
    @IBOutlet weak var sincelable: UILabel!
    @IBOutlet weak var viewimg: UIView!
    @IBOutlet weak var script: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code\
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func hideSkeltonView() {
        [viewsLbl, sincelable, script, title].forEach { $0?.hideSkeleton()}
        [img, markImg, viewimg, time].forEach { $0?.hideSkeleton()}
    }
   
}
