//
//  MovieCategory.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/20/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
struct MovieCategory {
    var categoryName : String
    var title : String
    var movies : [MovieVO]


enum categoryType : String,CaseIterable {
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    case topRated = "Top Rated"
    case upComing = "Upcoming"
    
}
}

