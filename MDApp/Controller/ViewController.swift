//
//  ViewController.swift
//  MDApp
//
//  Created by Uğur Duygu on 10.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: BaseUIViewController {
    
    //Mark: variables
    var videos: [Videos] = []
    var details: [Details] = []
    var movies: [Movie] = []
    
    var path = "popular"
    var cellName = "myCell"
    
    fileprivate var lastIndexPath : IndexPath?
    
    fileprivate var currentPage : Int = 1
    fileprivate var itemCountPerLine : CGFloat {
        return self.traitCollection.horizontalSizeClass == .regular ? 4 : 3
    }
    
    //Mark: references
    @IBOutlet weak var colMovies: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMoviesByPage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let detail = segue.destination as? DetailViewController, let selectedItem = colMovies.indexPathsForSelectedItems?.first {
            passDataToDetail(detail, with: self.movies[selectedItem.row])
        }
    }
    
}

fileprivate extension ViewController {
    
    //MARK: Web Service Methods
    func getMoviesByPage() {
        print("getMoviesByPage called with pageNumber = \(currentPage)")
        self.network.getMovies(pageNumber : currentPage, paths: path) { movies in
            guard let movies = movies else { return }
            self.movies.append(contentsOf: movies)
            self.colMovies.reloadData()
            self.currentPage += 1
        }
    }
    
    func isSafeToGetMovieForNextPage(_ indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = lastIndexPath else { return true }
        return indexPath.item > lastIndexPath.item
    }
}

fileprivate extension ViewController {
    
    //MARK: Navigation
    
    /*func navigateToDetails(movie: Movie){
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        desVC.idMovie = movie.id
        desVC.nameMovie = movie.title
        desVC.ratingMovie = String(movie.vote_average)
        desVC.backdropMovieComp = movie.backdrop_path!
        //desVC.posterMovieComplateUrl = movie.poster_path!
        self.navigationController?.pushViewController(desVC, animated: true)
    }*/
    
    func passDataToDetail(_ detail: DetailViewController, with movie : Movie) {
        detail.idMovie = movie.id
        detail.nameMovie = movie.title
        detail.ratingMovie = String(movie.vote_average)
        detail.backdropMovieComp = movie.backdrop_path!
        
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //Mark: collectionView methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CollectionViewCellModel
        
        cell.fillViews(movies: self.movies[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //currentMovie = self.movies[indexPath.row]
        //navigateToDetails(movie: currentMovie!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = collectionView.frame.size.width / itemCountPerLine
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == movies.count - 1 && isSafeToGetMovieForNextPage(indexPath) {
            lastIndexPath = indexPath
            getMoviesByPage()
        }
    }
}



