//
//  MainTabBarController.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2019-12-28.
//  Copyright © 2019 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        //FIXME: present loging with pin
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        //New Point Check
        let newPointCheckNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: PointCheckVC())
        
        //View Point Checks
        let viewPointChecksNavController = templateNavController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_unselected"), rootViewController: ViewPointChecksVC(collectionViewLayout: UICollectionViewFlowLayout()))
        
        tabBar.tintColor = .black
        self.viewControllers = [
            newPointCheckNavController,
            viewPointChecksNavController
        ]
    }
    
    fileprivate func templateNavController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController = UIViewController()) -> UINavigationController {
        let vC = rootViewController
        let navVC = UINavigationController(rootViewController: vC)
        navVC.tabBarItem.image = unselectedImage
        navVC.tabBarItem.selectedImage = selectedImage
        
        return navVC
    }
}
