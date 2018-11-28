//
//  DetailTrailerViewControllerModel.swift
//  MDApp
//
//  Created by Uğur Duygu on 13.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import UIKit

struct Videos: Decodable {
    let key: String
}

struct VideoResponse: Decodable {
    let results: [Videos]
}

class DetailTrailerViewControllerModel: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
