//
//  HomeApiResponse.swift
//  Sabq
//
//  Created by EsraaGK on 10/20/19.
//  Copyright © 2019 EsraaGK. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct HomeApiResponse: Decodable{
    let slider: [Material]
    let materials: [Material]
    let code: Int
}

// MARK: - Material

struct Material : Decodable {
    let id : String?
    let title : String?
    let secondaryTitle : String?
    let description : String?
    let publishDate : String?
    let publishDateHijryDate : String?
    let updateDate : String?
    let updateDateHijryDate : String?
    let categoryName : String?
    let parentCategoryName : String?
    let coverPhoto : String?
    let coverPhotoCaption : String?
    let authorName : String?
    let url : String?
    let materialType : String?
    let authorImg : String?
    let authorCity : String?
    let multipleAuthors : Bool?
    let imagesCount : Int?
    let videosCount : Int?
    let noOfLikes : Int?
    let noOfShares : Int?
    let noOfViews : Int?
    let noOfComments : Int?
    let liked : Bool?
    let readLater : Bool?
    let materialUpdated : Bool?
    let isEdit : Bool?
    let hasRelatedMaterials : Bool?
    let authors : [String]?
    let images : [Images]?
    let videos : [Videos]?
    let attachements : [Attachement]?
    let tags : [Tags]?
    let updates : [String]?
    let relatedMaterials : [String]?
    let matarialDisplayed : String?
    let comments : [String]?
    let descriptionString : String?
    let city : String?
    let commentsEnabled : Bool?
    let commentsMinCharacters : Int?
    let commentsMaxCharacters : Int?
    
    let comicsType : String?
    let vid : String?
    let videoCaption : String?
    
}

struct StudioApiResponse : Decodable {
    let materials : [String]?
    let comics : [Material]?
    let code : Int?
}

// MARK: - Attachement
struct Attachement: Decodable {
    let name: String
    let url: String
    let caption: String
    let type: String?
    let downloadCount: Int
}

struct Videos : Decodable {
    let vid : String?
    let caption : String?
    
}

struct Tags : Decodable {
    let id : String?
    let name : String?
}

struct Images : Decodable {
    let url : String?
    let caption : String?
}

enum CellType{
    case ordinary
    case videos
    case images
}
