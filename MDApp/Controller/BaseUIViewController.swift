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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(className + " viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(className + " viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(className + " viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(className + " viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(className + " viewDidDisappear")
    }
    
}


extension BaseUIViewController {
    var className : String {
        return String.init(describing: self.classForCoder)
    }
}


