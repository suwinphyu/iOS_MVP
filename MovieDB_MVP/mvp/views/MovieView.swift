//
//  MovieView.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

protocol MovieView : BaseView {
    func displayMovies(data : [MovieVO])
    func displayError(error: String)
}
