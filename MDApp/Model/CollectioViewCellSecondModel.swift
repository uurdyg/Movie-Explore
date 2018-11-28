//
//  CollectioViewCellSecondModel.swift
//  MDApp
//
//  Created by Uğur Duygu on 1.11.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

var movies : [Movie] = []

class CollectionViewCellSecondModel: UICollectionViewCell {
    
    
    @IBOutlet weak var imageMov2: UIImageView!
    
    func fillViews(movies: Movie, imageMovie: UIImageView){
        let imagePath = buildImageUrl(postFix: movies.poster_path)
        let imageUrl = URL(string: imagePath)
        imageMovie.sd_setImage(with: imageUrl)
        //imageMov.sd_setImage(with: imageUrl)
        //imageMov2.sd_setImage(with: imageUrl)
    }
    
    let baseUrl = "https://image.tmdb.org/t/p/"
    
    func buildImageUrl(width: String = "w154", postFix: String?) -> String{
        return baseUrl + width + (postFix ?? "")
    }
    
}
