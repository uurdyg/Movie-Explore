//
//  BaseUIViewController.swift
//  MDApp
//
//  Created by Uğur Duygu on 10.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//
import UIKit

class BaseUIViewController: UIViewController {
    
    let network = Network()
}

extension BaseUIViewController {
    var className : String {
        return String.init(describing: self.classForCoder)
    }
}


