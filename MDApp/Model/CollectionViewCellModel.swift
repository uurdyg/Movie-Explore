//
//  CollectionViewCellModel.swift
//  MDApp
//
//  Created by Uğur Duygu on 10.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//
import Foundation
import UIKit
import SDWebImage

struct Movie: Decodable {
    let vote_average: Double
    let title: String
    let poster_path: String?
    let backdrop_path: String?
    let id: Int
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

class CollectionViewCellModel: UICollectionViewCell {
    
    @IBOutlet weak var imageMov2: UIImageView!
    @IBOutlet weak var imageMov: UIImageView!
    
    func fillViewsSecond(movies: Movie) {
        let imagePath = buildImageUrl(postFix: movies.poster_path)
        let imageUrl = URL(string: imagePath)
        imageMov2.sd_setImage(with: imageUrl)
    }
    
    func fillViews(movies: Movie){
        let imagePath = buildImageUrl(postFix: movies.poster_path)
        let imageUrl = URL(string: imagePath)
        imageMov.sd_setImage(with: imageUrl)
    }
    
    let baseUrl = "https://image.tmdb.org/t/p/"
    
    func buildImageUrl(width: String = "w154", postFix: String?) -> String{
        return baseUrl + width + (postFix ?? "")
    }
    
}
