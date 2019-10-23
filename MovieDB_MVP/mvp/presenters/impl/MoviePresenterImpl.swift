//
//  MoviePresenterImpl.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

class MoviePresenterImpl: BasePresenter {
    var mView : MovieView? = nil
    var movieList : [MovieVO] = []

}

extension MoviePresenterImpl : MoviePresenter{
    
    func onUIReady() {
      
        MovieModelImpl.shared.getNowPlayingMoviesFromApi(success: { (data) in
            self.movieList = data
            self.mView?.displayMovies(data: self.movieList)
        }) { (error) in
             self.mView?.displayError(error: error)
        }
        MovieModelImpl.shared.getUpComingMoviesFromApi(success: { (data) in
            self.movieList = data
            self.mView?.displayMovies(data: self.movieList)
        }) { (error) in
            self.mView?.displayError(error: error)
        }
        
        MovieModelImpl.shared.getTopRateMoviesFromCoreData(success: { (data) in
            self.movieList = data
            self.mView?.displayMovies(data: self.movieList)
        }) { (error) in
            self.mView?.displayError(error: error)
        }
        
        MovieModelImpl.shared.getTrendingMoviesFromCoreData(success: { (data) in
            self.movieList = data
            self.mView?.displayMovies(data: self.movieList)
        }) { (error) in
            self.mView?.displayError(error: error)
        }
        
        
        MovieModelImpl.shared.getAllMoviesFromCoreData(success: { (data) in
            self.movieList = data
            self.mView?.displayMovies(data: self.movieList)
        }) { (error) in
            self.mView?.displayError(error: error)
        }
    

    }
    
    
    func attachView(view: MovieView) {
        mView = view
    }
    
    func setupTitle(_ title: String,_ logo: UIImage) {
    
            let navigationView = UIView(frame: CGRect(x: 0, y: 0, width: 50 , height: 50))
            let imgView = UIImageView(frame: CGRect(x: -180, y: 0, width: 100, height: 40))
            imgView.contentMode = .scaleAspectFit
            let image = logo
            imgView.image = image
            navigationView.addSubview(imgView)
            
            let label : UILabel = UILabel(frame: CGRect(x: -30, y: 3, width: 150, height: 25))
            label.text = title
            label.textColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
            navigationView.addSubview(label)
        
            
           // UIKit.UINavigationItem.titleView = navigationView
        
    
            
        
    }
    
}
