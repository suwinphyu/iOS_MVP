//
//  Extenstions.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerForCell(strID : String){
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
    
}

extension UICollectionView {
    func registerForItem(strID : String){
        
        register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID )
    }
}
