//
//  CellTypeModel.swift
//  Sabq
//
//  Created by EsraaGK on 10/22/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation

protocol CellTypeProtocol {
    var cellType: CellType{get}
}

enum CellType{
    case slider
    case ordinary
    case videos
    case images
}

class VideosModel :CellTypeProtocol{
    var cellType: CellType = .videos
    var videosMaterials:[Material]
    init( materials: [Material]) {
       // self.cellType = cellType
        videosMaterials = materials
    }
}
class ImagesModel :CellTypeProtocol{
    var cellType: CellType = .images
    var imagesMaterials:[Material]
    init( materials: [Material]) {
        // self.cellType = cellType
        imagesMaterials = materials
    }
}

class OrdinaryCellModel: CellTypeProtocol{
    var cellType: CellType = .ordinary
    var material :Material
    init(material:Material) {
        self.material = material
    }
}


class SliderCellModel: CellTypeProtocol{
    var cellType: CellType = .slider
    var material :[Material]
    init(material:[Material]) {
        self.material = material
    }
}
