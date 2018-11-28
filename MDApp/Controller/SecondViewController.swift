//
//  SecondViewController.swift
//  MDApp
//
//  Created by Serkut Yegin on 19.10.2018.
//  Copyright © 2018 mudmud. All rights reserved.
//

import UIKit

class SecondViewController: BaseUIViewController {

    @IBOutlet weak var viewGreen: UIView!
    @IBOutlet weak var constHeight: NSLayoutConstraint!
    @IBOutlet weak var constBlueHeight: NSLayoutConstraint!
    fileprivate func getBlueHeight(accordingTo parentHeight:CGFloat) -> CGFloat {
        return parentHeight > 500 ? 600 : 300
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        constHeight.constant = 0
        constBlueHeight.constant = getBlueHeight(accordingTo: self.view.frame.size.height)
        view.layoutIfNeeded()
        viewGreen.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        constHeight.constant = 128
        UIView.animate(withDuration: 1) {
            self.viewGreen.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        constBlueHeight.constant = getBlueHeight(accordingTo: size.height)
        
        coordinator.animate(alongsideTransition: { (context) in
            self.view.layoutIfNeeded()
        }) { (context) in
            
        }
    }

}
