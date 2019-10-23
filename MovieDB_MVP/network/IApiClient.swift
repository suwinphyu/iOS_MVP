//
//  IApiClient.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
protocol IApiClient {
 

    
   
    func getAllMovies(success: @escaping ([MovieVO]) -> Void,
                      failure: @escaping (String) -> Void)
    
    func getTopRateMovies( pageId : Int,
                           success : @escaping([MovieVO]) -> Void,
                           failure : @escaping(String) -> Void)
    
    func getNowPlayingMovies( pageId : Int,
                           success : @escaping([MovieVO]) -> Void,
                           failure : @escaping(String) -> Void)

    func getUpComingMovies( pageId : Int,
                              success : @escaping([MovieVO]) -> Void,
                              failure : @escaping(String) -> Void)

    func getTrendingMovies( pageId : Int,
                            success : @escaping([MovieVO]) -> Void,
                            failure : @escaping(String) -> Void)
}
