//
//  DetailViewControllerModel.swift
//  MDApp
//
//  Created by Uğur Duygu on 13.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//
import UIKit

struct Details: Decodable {
    let overview: String
    let release_date: String
    let runtime: Int
    let genres: [genresResponse]
}

struct genresResponse: Decodable {
    let id: Int
    let name: String
}

class DetailViewControllerModel: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
