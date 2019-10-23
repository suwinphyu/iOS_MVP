//
//  CustomSectionCollectionReusableView.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/20/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class CustomSectionCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var lblMovieCategory: UILabel!
    
    var mData:String! {
        didSet{
            lblMovieCategory.text = mData
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
