//
//  DetailPresenterImpl.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/21/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenterImpl{
    
    var mView : DetailView? = nil
    var movie : MovieVO?
}

extension DetailPresenterImpl : DetailPresenter{
    func onClickbtnClose() {
         UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func onClickbtnPlay() {
        
    }
    
    func onUIReady() {
        
    }
    
    func attachView(view: DetailView) {
        mView = view
    }
    
  
}

