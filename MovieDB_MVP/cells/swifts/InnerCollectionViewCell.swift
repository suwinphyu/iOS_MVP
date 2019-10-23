//
//  InnerCollectionViewCell.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit
import SDWebImage


class InnerCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imgViewPoster: UIImageView!
    
    var data : MovieVO? {
        didSet {
            if let data = data {
        
                imgViewPoster.sd_setImage(with: URL(string: "\(API.BASE_IMG_URL)\(data.poster_path ?? "" )"), completed: nil)
          
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}
