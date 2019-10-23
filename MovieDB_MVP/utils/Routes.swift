//
//  Routes.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
class Routes {
  
    
    static let ROUTE_TOP_RATED_MOVIES = "/movie/top_rated"
    static let ROUTE_UPCOMING_MOVIES = "/movie/upcoming"
    static let ROUTE_NOW_PLAYING_MOVIES = "/movie/now_playing"
    static let ROUTE_POPULAR_MOVIES = "/movie/popular"
    
    
    
    static let ROUTE_MOVIE_DETAILS = "\(API.BASE_URL)/movie"
    static let ROUTE_SEACRH_MOVIES = "\(API.BASE_URL)/search/movie"
    static let ROUTE_REQUEST_TOKEN = "\(API.BASE_URL)/authentication/token/new"
    static let ROUTE_LOGIN = "\(API.BASE_URL)/authentication/token/validate_with_login"
    static let ROUTE_SESSION_ID = "\(API.BASE_URL)/authentication/session/new"
    static let ROUTE_ACCOUNT = "\(API.BASE_URL)/account"
  

    static let ROUTE_GET_MOVIE_KEY = "\(API.BASE_URL)/movie"
    static let ROUTE_GET_SIMILAR_MOVIES = "\(API.BASE_URL)/movie"
    static let ROUTE_POST_RATE_MOVIES = "\(API.BASE_URL)/movie"
    static let ROUTE_POST_WATCH_LIST = "\(API.BASE_URL)/account"
      static let ROUTE_MOVIE_GENRES = "\(API.BASE_URL)/genre/movie/list?api_key=\(API.KEY)"
}

