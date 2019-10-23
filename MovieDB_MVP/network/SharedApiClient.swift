//
//  SharedApiClient.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

class SharedApiClient : BaseApiClient {
    static let shared = SharedApiClient()
    var movie : [MovieVO]?
    
    private override init() {
        
    }
}

extension SharedApiClient : IApiClient{
    func getAllMovies(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        
    }
    
    
    func getNowPlayingMovies(pageId: Int, success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        let parameters = [ "api_key": "\(API.KEY)" , "page": pageId] as [String : Any]
        self.requestApiWithoutHeaders(url: generateUrl(route: "\(Routes.ROUTE_NOW_PLAYING_MOVIES)"), method: .get, params: parameters, success: { (response) in
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
           // success(apiResponse.results)
         
            for response in apiResponse.results{
                MovieResponse.saveMovieEntity(categoryName :MovieCategory.categoryType.nowPlaying.rawValue, data: response, context: CoreDataStack.shared.viewContext)
                self.movie =  [MovieResponse.convertToMovieVO(data: response, context: CoreDataStack.shared.viewContext)]
            }
            success(self.movie!)
        }) { (error) in
            failure(error)
        }
    }
    
    func getUpComingMovies(pageId: Int, success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        let parameters = [ "api_key": "\(API.KEY)" , "page": pageId] as [String : Any]
        self.requestApiWithoutHeaders(url: generateUrl(route: "\(Routes.ROUTE_UPCOMING_MOVIES)"), method: .get, params: parameters, success: { (response) in
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
            //success(apiResponse.results)
            for response in apiResponse.results{
                MovieResponse.saveMovieEntity(categoryName :MovieCategory.categoryType.upComing.rawValue, data: response, context: CoreDataStack.shared.viewContext)
                 self.movie =  [MovieResponse.convertToMovieVO(data: response, context: CoreDataStack.shared.viewContext)]
            }
            success(self.movie!)
        }) { (error) in
            failure(error)
        }
    }
    
    func getTrendingMovies(pageId: Int, success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        let parameters = [ "api_key": "\(API.KEY)" , "page": pageId] as [String : Any]
        self.requestApiWithoutHeaders(url: generateUrl(route: "\(Routes.ROUTE_POPULAR_MOVIES)"), method: .get, params: parameters, success: { (response) in
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
          //  success(apiResponse.results)
            for response in apiResponse.results{
                MovieResponse.saveMovieEntity(categoryName :MovieCategory.categoryType.popular.rawValue, data: response, context: CoreDataStack.shared.viewContext)
                self.movie =  [MovieResponse.convertToMovieVO(data: response, context: CoreDataStack.shared.viewContext)]
            }
            success(self.movie!)
        }) { (error) in
            failure(error)
        }
    }
    
    func getTopRateMovies(pageId: Int, success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        
        let parameters = [ "api_key": "\(API.KEY)" , "page": pageId] as [String : Any]
        self.requestApiWithoutHeaders(url: generateUrl(route: "\(Routes.ROUTE_TOP_RATED_MOVIES)"), method: .get, params: parameters, success: { (response) in
            let apiResponse = try! JSONDecoder().decode(MovieListResponse.self, from: response)
           // success(apiResponse.results)
            for response in apiResponse.results{
                MovieResponse.saveMovieEntity(categoryName :MovieCategory.categoryType.topRated.rawValue, data: response, context: CoreDataStack.shared.viewContext)
                self.movie =  [MovieResponse.convertToMovieVO(data: response, context: CoreDataStack.shared.viewContext)]
            }
            success(self.movie!)
        }) { (error) in
            failure(error)
        }

    }
    
 
 
    

    
}

