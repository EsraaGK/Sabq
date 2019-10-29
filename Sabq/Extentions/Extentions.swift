//
//  Extentions.swift
//  Sabq
//
//  Created by EsraaGK on 10/24/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation
import UIKit
import DateToolsSwift

extension String {
    func convertStringToTimeAgo() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm ss"
        
        if let date = dateFormatterGet.date(from: self) {
            let timeAgoString = date.earlierDate(date).timeAgoSinceNow
            //shortTimeAgoSinceNow
            return timeAgoString
        } else {
            print("There was an error decoding the string")
            return self
        }
    }
    
    func convertStringToMonthDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm ss"
        let tempDate =  dateFormatterGet.date(from: self)!
        
        let desiredDate = DateFormatter()
        desiredDate.dateFormat = "dd MMMM yyyy"
        
//if
        let stringDate = desiredDate.string(from: tempDate)//{
           return stringDate
//        } else {
//            print("There was an error decoding the string")
//            return self
//        }
   }
}
extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.height/2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
