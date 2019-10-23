//
//  MovieModel.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation

protocol MovieModel {
//    func getAllMoviesFromApi(
//        success : @escaping([MovieVO]) -> Void ,
//        failure: @escaping(String) -> Void
//    )
    
    func getTopRateMoviesFromApi(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )

    func getTrendingMoviesFromApi(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    func getUpComingMoviesFromApi(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    func getNowPlayingMoviesFromApi(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    
    func getAllMoviesFromCoreData(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    func getTopRateMoviesFromCoreData(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    
    func getTrendingMoviesFromCoreData(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    func getUpComingMoviesFromCoreData(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
    func getNowPlayingMoviesFromCoreData(
        success : @escaping([MovieVO]) -> Void ,
        failure: @escaping(String) -> Void
    )
}

