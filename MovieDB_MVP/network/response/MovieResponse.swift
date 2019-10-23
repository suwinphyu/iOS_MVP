//
//  MovieResponse.swift
//  netflixExercise
//
//  Created by Su Win Phyu on 10/5/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import CoreData

struct MovieResponse : Codable {
    let popularity : Double?
    let vote_count : Int?
    let video : Bool?
    let poster_path : String?
    let id : Int?
    let adult : Bool?
    let backdrop_path : String?
    let original_language : String?
    let original_title : String?
    let genre_ids: [Int]?
    let title : String?
    let vote_average : Double?
    let overview : String?
    let release_date : String?
    let budget : Int?
    let homepage : String?
    let imdb_id : String?
    let revenue : Int?
    let runtime : Int?
    let tagline : String?
    var categoryName : String?
    
    
    
    enum CodingKeys:String,CodingKey {
        case popularity
        case vote_count
        case video
        case poster_path
        case id
        case adult
        case backdrop_path
        case original_language
        case original_title
        case genre_ids
        case title
        case vote_average
        case overview
        case release_date
        case budget
        case homepage
        case imdb_id
        case revenue
        case runtime
        case tagline = "tagline"
        case categoryName 
        
        
    }
    
    static func saveMovieEntity(categoryName: String, data : MovieResponse, context : NSManagedObjectContext) {
        
        guard let id = data.id, id > 0 else {
            print("failed to save MovieInfoResponse")
            return
        }
        
        let movieEntity = MovieVO(context: context)
        movieEntity.popularity = data.popularity ?? 0.0
        movieEntity.vote_count = Int32(data.vote_count ?? 0)
        movieEntity.video = data.video ?? false
        movieEntity.poster_path = data.poster_path
        movieEntity.id = Int32(data.id ?? 0)
        movieEntity.adult = data.adult ?? false
        movieEntity.backdrop_path = data.backdrop_path
        movieEntity.original_language = data.original_language
        movieEntity.original_title = data.original_title
        
        if let genre_ids = data.genre_ids, !genre_ids.isEmpty {
            genre_ids.forEach{ id in
                if let movieGenreVO = GenreVO.getMovieGenreVOById(genreId: id) {
                    movieEntity.addToGenres(movieGenreVO)
                }
            }
        }
        movieEntity.title = data.title
        movieEntity.vote_average = data.vote_average ?? 0.0
        movieEntity.overview = data.overview
        movieEntity.release_date = data.release_date
        movieEntity.budget = Int32(data.budget ?? 0)
        movieEntity.homepage = data.homepage
        movieEntity.imdb_id = data.imdb_id
        movieEntity.revenue = Int32(data.revenue ?? 0)
        movieEntity.runtime = Int16(data.runtime ?? 0)
        movieEntity.tagline = data.tagline
        movieEntity.categoryName = categoryName
        
        
        do {
            try context.save()
        } catch {
            print("failed to save movie : \(error.localizedDescription)")
        }
        
        
    }
    static func updateMovieEntity(existingData movieEntity: MovieVO,newData data : MovieResponse, context : NSManagedObjectContext) {
        
        movieEntity.popularity = data.popularity ?? 0.0
        movieEntity.vote_count = Int32(data.vote_count ?? 0)
        movieEntity.video = data.video ?? false
        movieEntity.poster_path = data.poster_path
        movieEntity.id = Int32(data.id ?? 0)
        movieEntity.adult = data.adult ?? false
        movieEntity.backdrop_path = data.backdrop_path
        movieEntity.original_language = data.original_language
        movieEntity.original_title = data.original_title
        movieEntity.title = data.title
        movieEntity.vote_average = data.vote_average ?? 0.0
        movieEntity.overview = data.overview
        movieEntity.release_date = data.release_date
        movieEntity.budget = Int32(data.budget ?? 0)
        movieEntity.homepage = data.homepage
        movieEntity.imdb_id = data.imdb_id
        movieEntity.revenue = Int32(data.revenue ?? 0)
        movieEntity.runtime = Int16(data.runtime ?? 0)
        movieEntity.tagline = data.tagline
        movieEntity.categoryName = data.categoryName
        
        
        do {
            try context.save()
        } catch {
            print("failed to update movie : \(error.localizedDescription)")
        }
        
        
    }
    
    static func convertToMovieVO(data : MovieResponse, context : NSManagedObjectContext) -> MovieVO {
        
        let movieVO = MovieVO(entity: NSEntityDescription.entity(forEntityName: "MovieVO", in: CoreDataStack.shared.viewContext)!, insertInto: nil)
        
        movieVO.popularity = data.popularity ?? 0.0
        movieVO.vote_count = Int32(data.vote_count ?? 0)
        movieVO.video = data.video ?? false
        movieVO.poster_path = data.poster_path
        movieVO.id = Int32(data.id ?? 0)
        movieVO.adult = data.adult ?? false
        movieVO.backdrop_path = data.backdrop_path
        movieVO.original_language = data.original_language
        movieVO.original_title = data.original_title
        movieVO.title = data.title
        movieVO.vote_average = data.vote_average ?? 0.0
        movieVO.overview = data.overview
        movieVO.release_date = data.release_date
        movieVO.budget = Int32(data.budget ?? 0)
        movieVO.homepage = data.homepage
        movieVO.imdb_id = data.imdb_id
        movieVO.revenue = Int32(data.revenue ?? 0)
        movieVO.runtime = Int16(data.runtime ?? 0)
        movieVO.tagline = data.tagline
        movieVO.categoryName = data.categoryName ?? ""
        
        
        return movieVO
    }
}

