//
//  ViewPointChecks.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-10.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ViewPointChecksVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //Stored properties
    var pointChecks = [PointCheck]() // Must get set before presenting viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Point Checks"
        
        //Register collection view cell
        collectionView.register(PointCheckCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewCellIds.pointCheckCell)
        
        collectionView?.alwaysBounceVertical = true
    }
    
    
    //MARK: CollectionView Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pointChecks.count
    }
    
    // What's the vertical spacing between each cell ?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellIds.pointCheckCell, for: indexPath) as? PointCheckCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.pointCheck = self.pointChecks[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 85)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pointCheckDataVC = PointCheckDataVC()
        self.navigationController?.pushViewController(pointCheckDataVC, animated: true)
    }
}
