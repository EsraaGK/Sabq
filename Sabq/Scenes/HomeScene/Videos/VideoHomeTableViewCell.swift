//
//  VideoHomeTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/21/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class VideoHomeTableViewCell: UITableViewCell {

    var list :[Material]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCollection(list:[Material]){
        self.list=list
    }
}
