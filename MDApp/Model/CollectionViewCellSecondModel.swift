//
//  CollectionViewCellSecondModel.swift
//  MDApp
//
//  Created by Uğur Duygu on 1.11.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class CollectionViewCellSecondModel: UICollectionViewCell {
    
    @IBOutlet weak var imageMovSecond: UIImageView!

    func fillViewsSecond(movies: Movie){
        let imagePath = buildImageUrl(postFix: movies.poster_path)
        let imageUrl = URL(string: imagePath)
        //imageMovie.sd_setImage(with: imageUrl)
        //imageMov.sd_setImage(with: imageUrl)
        imageMovSecond.sd_setImage(with: imageUrl)
    }
    
    let baseUrl = "https://image.tmdb.org/t/p/"
    
    func buildImageUrl(width: String = "w154", postFix: String?) -> String{
        return baseUrl + width + (postFix ?? "")
    }
    
}
