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

    @IBOutlet weak var newsHeaderLable: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var viewsLable: UILabel!
    @IBOutlet weak var viewsImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

 
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(obj : Material){
        
        newsHeaderLable.text = obj.title
        newsImg.sd_setImage(with: URL(string: obj.coverPhoto!), placeholderImage: UIImage(named: "news-img_8"))
        //let dateString = obj.publishDate
        
        timeLable.text = obj.publishDate?.convertStringToTimeAgo()
        viewsLable.text = String(obj.noOfViews!)
        
        if obj.noOfViews! > 5000{
        viewsImg.image = UIImage(named: "ic_views_icon_hot")
        }else{
        viewsImg.image = UIImage(named: "ic_views_icon")
        }
        
    }
    
    
}


