//
//  Attraction.swift
//  CityExplorer
//
//  Created by apple on 2025/11/23.
//  Copyright © 2025年 com.CityExplorer. All rights reserved.
//

import Foundation

struct AttractionModel {
    var id: String
    var name: String
    var description: String
    var imageName: String
    var rating: Double
var address: String
    var openTime: String
    var closeTime: String
    var videoURL: String?
    var comments: [Comment]
    
    init(id: String, name: String, description: String, imageName: String, rating: Double, address: String, openTime: String, closeTime: String, videoURL: String? = nil, comments: [Comment] = []) {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = imageName
        self.rating = rating
        self.address = address
        self.openTime = openTime
        self.closeTime = closeTime
        self.videoURL = videoURL
        self.comments = comments
    }
}

struct Comment {
    var username: String
    var content: String
    var rating: Double
    var date: String
}

