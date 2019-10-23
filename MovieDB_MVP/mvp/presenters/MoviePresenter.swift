//
//  MoviePresenter.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

protocol MoviePresenter {
    func onUIReady()
    func attachView(view: MovieView)
    // func onClickGetStarted()
    func setupTitle(_ title: String,_ logo: UIImage)
    
}
