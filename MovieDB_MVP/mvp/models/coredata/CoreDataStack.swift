//
//  CoreDataStack.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/20/19.
//  Copyright © 2019 swp. All rights reserved.
//


import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    var persistentContainer : NSPersistentContainer!
    
    var viewContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
