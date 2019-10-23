//
//  MovieListResponse.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

struct MovieListResponse : Codable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [MovieResponse]
}
