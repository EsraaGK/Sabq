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
        guard let tempDate = dateFormatterGet.date(from: self) else { return "" }
        
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
        let radius = self.frame.height / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}

extension UIColor {
    static var homeBackGroundColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1)
                } else {
                    return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
        } else {
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    static var articlesCardBackGroundColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1803921569, alpha: 1)
                } else {
                    return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
            }
        } else {
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    static var collectionBackgroundColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return #colorLiteral(red: 0.1215686275, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
                        
                } else {
                    return #colorLiteral(red: 0.2039215686, green: 0.2039215686, blue: 0.2039215686, alpha: 1)
                }
            }
        } else {
            return #colorLiteral(red: 0.1215686275, green: 0.1176470588, blue: 0.1176470588, alpha: 1)
        }
    }
    
    static var titleLableColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return #colorLiteral(red: 0.9529411765, green: 0.9529411765, blue: 0.9529411765, alpha: 1)
                } else {
                    return #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.1254901961, alpha: 1)
                }
            }
        } else {
            return #colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.1254901961, alpha: 1)
        }
    }
    
    static var descriptionLableColor: UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
                } else {
                    return #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
                }
            }
        } else {
            return #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
        }
    }
    
}
