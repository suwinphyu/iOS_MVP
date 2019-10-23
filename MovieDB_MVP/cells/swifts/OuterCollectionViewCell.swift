//
//  OuterCollectionViewCell.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/20/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class OuterCollectionViewCell: UICollectionViewCell {
  
    var moviesByCategory : [MovieVO] = []
    var popularMovieList : [MovieVO] = []
    var topRatedMovieList : [MovieVO] = []
    var nowPlayingMovieList : [MovieVO] = []
    var upComingMovieList : [MovieVO] = []
    
    @IBOutlet weak var outerCollectionView: UICollectionView!
 
    var data : [MovieVO]!{
        didSet {
            outerCollectionView.reloadData()
            for value in data {
                switch data.first?.categoryName {
                case MovieCategory.categoryType.nowPlaying.rawValue : nowPlayingMovieList.append(value)
                case MovieCategory.categoryType.popular.rawValue : popularMovieList.append(value)
                case MovieCategory.categoryType.topRated.rawValue : topRatedMovieList.append(value)
                case MovieCategory.categoryType.upComing.rawValue : upComingMovieList.append(value)
                default : moviesByCategory.append(value)
                }
            }
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerCollectionView.delegate = self
        outerCollectionView.dataSource = self
        outerCollectionView.registerForItem(strID: String(describing: InnerCollectionViewCell.self))
        
        let layout = outerCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        //layout.itemSize = CGSize(width: (self.view.frame.width), height: 190)
        layout.itemSize = CGSize(width: (outerCollectionView.frame.width)/3, height: 170)
    }

}

extension OuterCollectionViewCell : UICollectionViewDelegate{}

extension OuterCollectionViewCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       print(moviesByCategory.count)
        switch section {
        case 0: return nowPlayingMovieList.count
          
        case 1: return upComingMovieList.count
     
        case 2: return topRatedMovieList.count
      
        case 3: return popularMovieList.count
          
        default:
            return moviesByCategory.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: InnerCollectionViewCell.self), for: indexPath) as! InnerCollectionViewCell
      
        switch indexPath.section {
        case 0:   item.data = nowPlayingMovieList[indexPath.row]
            break
            case 1:   item.data = upComingMovieList[indexPath.row]
            break
            case 2:   item.data = topRatedMovieList[indexPath.row]
            break
            case 3:   item.data = popularMovieList[indexPath.row]
            break
            
        default:
           item.data = moviesByCategory[indexPath.row]
            break
        }
        return item
    }
}

