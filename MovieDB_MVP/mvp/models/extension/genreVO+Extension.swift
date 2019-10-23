//
//  GenreVO+Extension.swift
//  movie-core-data
//
//  Created by Thet Htun on 9/20/19.
//  Copyright © 2019 padc. All rights reserved.
//

import Foundation
import CoreData

extension GenreVO {
    
    
    static func getMovieGenreVOById(genreId : Int) -> GenreVO? {
        let fetchRequest : NSFetchRequest<GenreVO> = GenreVO.fetchRequest()
        let predicate = NSPredicate(format: "id == %d", genreId)
        fetchRequest.predicate = predicate
        
        do {
            let data = try CoreDataStack.shared.viewContext.fetch(fetchRequest)
            if data.isEmpty {
                return nil
            }
            return data[0]
        } catch {
            print("failed to fetch movie genre vo \(error.localizedDescription)")
            return nil
        }
        
    }
    
    static func getFetchRequest() -> NSFetchRequest<GenreVO> {
        let fetchRequest : NSFetchRequest<GenreVO> = GenreVO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
}


