//
//  DetailViewController.swift
//  MDApp
//
//  Created by Uğur Duygu on 11.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: BaseUIViewController {
    
    //Mark: variables
    var videos: [Videos] = []
    var movies: [Movie] = []
    
    
    @IBOutlet weak var movieGenre: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRuntime: UILabel!
    
    @IBAction func movieTrailer(_ sender: UIButton) {
        if UIApplication.shared.canOpenURL(NSURL(string: trailerMovie)! as URL) {
            UIApplication.shared.open(NSURL(string: trailerMovie)! as URL)
        }
    }
    
    //Mark: variables
    var genresMovie = ""
    var genresMovie2 = ""
    var nameMovie = ""
    var ratingMovie = ""
    var dateMovie = ""
    var overviewMovie = ""
    var idMovie = Int()
    var trailerMovie = "https://www.youtube.com/watch?v="
    var backdropMovieBase = "https://image.tmdb.org/t/p/original"
    var backdropMovieComp = ""
    var runtimeMovie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInitialValues()
    }
    
}

fileprivate extension DetailViewController {
    
    func getInitialValues() {
        getDetailFromServer()
        getMoviesFromServer()
    }
    
    func getDetailFromServer() {
        Network.sharedNetwork.getDetails(id: idMovie) { [weak self] details in
            self?.setupUIWithDetails(details)
        }
    }
    
    func getMoviesFromServer() {
        
        Network.sharedNetwork.getVideos(id: idMovie){ videos in
            guard let videos = videos, videos.count > 0 else { return }
            self.videos = videos
            self.trailerMovie += videos[0].key
            print(self.trailerMovie)
        }
    }
    
    func setupUIWithDetails(_ details: Details?) {
        guard let details = details else { return }
        
        self.movieName.text = self.nameMovie
        self.movieRating.text = self.ratingMovie
        print("COUNT: \(details.genres.count)")
        
        if details.genres.count > 1 {
            genresMovie2 = ", \(details.genres[1].name)"
        }
        
        self.genresMovie = details.genres[0].name
        self.movieGenre.text = "\(self.genresMovie) \(self.genresMovie2)"
        
        self.backdropMovieComp = self.backdropMovieBase + self.backdropMovieComp
        let backdropImage = URL(string: self.backdropMovieComp)
        self.moviePoster.sd_setImage(with: backdropImage)
        
        
        self.dateMovie = details.release_date
        self.overviewMovie = details.overview
        let index = self.dateMovie.index(of: "-") ?? self.dateMovie.endIndex
        let yearOfDate = self.dateMovie[..<index]
        self.movieDate.text = String(yearOfDate)
        self.movieOverview.text = self.overviewMovie
        
        //self.runtimeMovie = details.runtime
        //let s = self.runtimeMovie / 60
        //let d = self.runtimeMovie % 60
        //self.movieRuntime.text = "\(s)h \(d)m"
        self.runtimeMovie = String(details.runtime)
        self.movieRuntime.text = "\(self.runtimeMovie) dk"
    }
}
