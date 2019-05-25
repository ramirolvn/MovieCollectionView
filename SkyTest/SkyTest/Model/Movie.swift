//
//  Movie.swift
//  SkyTest
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import UIKit
import ObjectMapper

class Movie: Mappable {
    
    var _title: String!
    var _image: String!
    var _overview: String!
    var _duration: String!
    var _year: String!
    var _image2: String!
    var _image3: String!
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var image: String {
        if _image == nil {
            _image = ""
        }
        return _image
    }
    
    var overview: String {
        if _overview == nil {
            _overview = ""
        }
        return _overview
    }
    
    var duration: String {
        if _duration == nil {
            _duration = ""
        }
        return _duration
    }
    
    var year: String {
        if _year == nil {
            _year = ""
        }
        return _year
    }
    
    var image2: String {
        if _image2 == nil {
            _image2 = ""
        }
        return _image2
    }
    
    var image3: String {
        if _image3 == nil {
            _image3 = ""
        }
        return _image3
    }
    
    required init?(map: Map) {
        self.mapping(map: map)
    }
    
    // Mappable
    func mapping(map: Map) {
        var backdrops_url:[String]?
        backdrops_url <- map["backdrops_url"]
        _title    <- map["title"]
        _image         <- map["cover_url"]
        _overview      <- map["overview"]
        _duration       <- map["duration"]
        _year  <- map["release_year"]
        _image2 = backdrops_url != nil && backdrops_url?.count ?? 0>0 ? backdrops_url![0] : ""
        _image3 = backdrops_url != nil && backdrops_url?.count ?? 0>1 ? backdrops_url![1] : ""
    }
    
}
