//
//  DetailView.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/21/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

protocol DetailView : BaseView {
    func displayMovieDetail(data : MovieVO)
    func displayError(error: String)
}
