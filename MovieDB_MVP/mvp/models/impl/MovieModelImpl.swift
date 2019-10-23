//
//  MovieModelImpl.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import CoreData

class MovieModelImpl : BaseModel{
    static let shared = MovieModelImpl()
    var fetchResultController: NSFetchedResultsController<MovieVO>!
    private override init(){}
    
}

extension MovieModelImpl : MovieModel{

    func getTopRateMoviesFromApi(success : @escaping([MovieVO]) -> Void ,failure: @escaping(String) -> Void){
        let fetchRequest : NSFetchRequest<MovieVO> = MovieVO.fetchRequest()
        let predicate = NSPredicate(format: "categoryName CONTAINS[cd] %@",MovieCategory.categoryType.topRated.rawValue)
        fetchRequest.predicate = predicate
        if let result = try? CoreDataStack.shared.viewContext.fetch(fetchRequest)
        {
            //print(result)
            if result.isEmpty {
                SharedApiClient.shared.getTopRateMovies(pageId: 1, success: { (response) in
                    success(response)
                }) { (error) in
                    failure(error)
                }
             
            }
         
        }
        self.getTopRateMoviesFromCoreData(success: { (data) in
            success(data)
        }) { (error) in
            failure(error)
        }
    }
    
    func getTrendingMoviesFromApi(success : @escaping([MovieVO]) -> Void ,failure: @escaping(String) -> Void){
        let fetchRequest : NSFetchRequest<MovieVO> = MovieVO.fetchRequest()
        let predicate = NSPredicate(format: "categoryName CONTAINS[cd] %@",MovieCategory.categoryType.popular.rawValue)
        fetchRequest.predicate = predicate
        if let result = try? CoreDataStack.shared.viewContext.fetch(fetchRequest)
        {
            if result.isEmpty {
                SharedApiClient.shared.getTrendingMovies(pageId: 1, success: {(response) in
                    success(response)
                }) { (error) in
                    failure(error)
                }
            }
           
        }
        self.getTrendingMoviesFromCoreData(success: { (data) in
            success(data)
        }) { (error) in
            failure(error)
        }
    }
    func getUpComingMoviesFromApi(success : @escaping([MovieVO]) -> Void ,failure: @escaping(String) -> Void){
        let fetchRequest : NSFetchRequest<MovieVO> = MovieVO.fetchRequest()
        let predicate = NSPredicate(format: "categoryName CONTAINS[cd] %@",MovieCategory.categoryType.upComing.rawValue)
        fetchRequest.predicate = predicate
        if let result = try? CoreDataStack.shared.viewContext.fetch(fetchRequest)
        {
            if result.isEmpty {
                SharedApiClient.shared.getUpComingMovies(pageId: 1, success: {(response) in
                    success(response)
                }) { (error) in
                    failure(error)
                }
            }
           
        }
        self.getUpComingMoviesFromCoreData(success: { (data) in
            success(data)
        }) { (error) in
            failure(error)
        }
    }

    func getNowPlayingMoviesFromApi(success : @escaping([MovieVO]) -> Void ,failure: @escaping(String) -> Void){
        let fetchRequest : NSFetchRequest<MovieVO> = MovieVO.fetchRequest()
        let predicate = NSPredicate(format: "categoryName CONTAINS[cd]  %@",MovieCategory.categoryType.nowPlaying.rawValue)
        fetchRequest.predicate = predicate
        if let result = try? CoreDataStack.shared.viewContext.fetch(fetchRequest)
        {
            if result.isEmpty {
                SharedApiClient.shared.getNowPlayingMovies(pageId: 1, success: {(response) in
                    success(response)
                }) { (error) in
                    failure(error)
                }
            }
           
        }
        self.getNowPlayingMoviesFromCoreData(success: { (data) in
            success(data)
        }) { (error) in
            failure(error)
        }
    }
    
    func getAllMoviesFromCoreData(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        if let data = MovieVO.fetchMovies(){
            success(data)
        }
    }
    
    func getNowPlayingMoviesFromCoreData(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        if let data = MovieVO.getMovieByCategroyName(categoryName: MovieCategory.categoryType.nowPlaying.rawValue){
            success([data])
        }
    }
    func getTopRateMoviesFromCoreData(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        if let data = MovieVO.getMovieByCategroyName(categoryName: MovieCategory.categoryType.topRated.rawValue){
            success([data])
        }
    }
    func getUpComingMoviesFromCoreData(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        if let data = MovieVO.getMovieByCategroyName(categoryName: MovieCategory.categoryType.upComing.rawValue){
            success([data])
        }
    }
    func getTrendingMoviesFromCoreData(success: @escaping ([MovieVO]) -> Void, failure: @escaping (String) -> Void) {
        if let data = MovieVO.getMovieByCategroyName(categoryName: MovieCategory.categoryType.popular.rawValue){
            success([data])
        }
    }
 
        
        
      
    
}


