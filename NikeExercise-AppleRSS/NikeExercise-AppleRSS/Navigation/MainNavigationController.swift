//
//  MainNavigationController.swift
//  NikeExercise-AppleRSS
//
//  Created by itimotin on 2/17/20.
//  Copyright © 2020 IKT. All rights reserved.
//

import UIKit

class MainNavigationController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if isSignedIn() {
            self.showMainViewController()
        }
        
        
    }
    
    fileprivate func isSignedIn() -> Bool {
        return true
    }
    
    func showMainViewController() {
        let mainTableViewController = AlbumTableViewController()
        self.viewControllers = [mainTableViewController]
    }
    
    @objc func showSignInViewController() {
        //present SignIn
    }
}
