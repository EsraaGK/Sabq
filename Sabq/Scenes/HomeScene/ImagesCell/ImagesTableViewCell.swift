//
//  ImagesTableViewCell.swift
//  Sabq
//
//  Created by EsraaGK on 10/22/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import UIKit

class ImagesTableViewCell: UITableViewCell {
    var list:[Material]?
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
