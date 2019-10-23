//
//  MovieListViewController.swift
//  MovieDB_MVP
//
//  Created by Su Win Phyu on 10/19/19.
//  Copyright © 2019 swp. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {
    static let identifier = "MovieListViewController"
    var movie: [MovieVO] = []
    
    
    @IBOutlet weak var collectionViewMovieList: UICollectionView!
    
    private let mPresenter : MoviePresenterImpl = MoviePresenterImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewMovieList.delegate = self
        collectionViewMovieList.dataSource = self
        collectionViewMovieList.registerForItem(strID: String(describing: OuterCollectionViewCell.self))
       
        //register for supplymentary section
        collectionViewMovieList.register(UINib(nibName: String(describing: CustomSectionCollectionReusableView.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: CustomSectionCollectionReusableView.self))
        
        mPresenter.attachView(view: self)
        mPresenter.onUIReady()
        
        let layout = collectionViewMovieList.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        //layout.itemSize = CGSize(width: (self.view.frame.width), height: 190)
        layout.itemSize = CGSize(width: (self.view.frame.width), height: 190)
        
        mPresenter.setupTitle("Movie List",UIImage(named: "logo.png")!)
       
    }
    
    
    
}

extension MovieListViewController: UICollectionViewDelegate{
    //for section header- supplementary
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: CustomSectionCollectionReusableView.self), for: indexPath) as! CustomSectionCollectionReusableView
 
        switch indexPath.section {
        case 0:
            sectionHeaderView.mData = MovieCategory.categoryType.nowPlaying.rawValue
        case 1:
            sectionHeaderView.mData = MovieCategory.categoryType.upComing.rawValue
        case 2:
            sectionHeaderView.mData = MovieCategory.categoryType.topRated.rawValue
        case 3:
            sectionHeaderView.mData = MovieCategory.categoryType.popular.rawValue
        default:
            break
        }
        
        return sectionHeaderView
    }
}

extension MovieListViewController : UICollectionViewDataSource{
    
    //for section header- supplementary
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: OuterCollectionViewCell.self), for: indexPath) as! OuterCollectionViewCell
       item.data =  mPresenter.movieList
       return item
    }
}


extension MovieListViewController : MovieView{
    func displayMovies(data: [MovieVO]) {
        collectionViewMovieList.reloadData()
    }
    
    func displayError(error: String) {
        Dialog.showAlert(viewController: self, title: "Alert", message: error)
    }
    
    
}
