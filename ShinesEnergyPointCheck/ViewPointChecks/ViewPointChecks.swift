//
//  ViewPointChecks.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2019-12-28.
//  Copyright © 2019 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ViewPointChecksVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: Stored properties
    var pointChecks = [PointCheck]()
    var tempPointChecks = [PointCheck]()
    
    var pointChecksFetched = 0
    
    var canFetchPointChecks = true
    
    let noResultsView: UIView = {
        let view = UIView.noResultsView(withText: "No Point Checks at the Moment.")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate func showNoResultsFoundView() {
        self.collectionView?.refreshControl?.endRefreshing()
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
            self.collectionView?.addSubview(self.noResultsView)
            self.noResultsView.centerYAnchor.constraint(equalTo: (self.collectionView?.centerYAnchor)!).isActive = true
            self.noResultsView.centerXAnchor.constraint(equalTo: (self.collectionView?.centerXAnchor)!).isActive = true
        }
    }
    
    fileprivate func removeNoResultsView() {
        self.collectionView?.refreshControl?.endRefreshing()
        DispatchQueue.main.async {
            self.noResultsView.removeFromSuperview()
            self.collectionView?.reloadData()
        }
    }
    
    // Display while first loading pointchecks
    let activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.hidesWhenStopped = true
        ai.color = UIColor.black
        ai.translatesAutoresizingMaskIntoConstraints = false
        
        return ai
    }()
    
    func animateAndShowActivityIndicator(_ bool: Bool) {
        if bool {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
    
    fileprivate func setupActivityIndicator() {
        view.addSubview(self.activityIndicator)
        self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = "Point Checks"
        
        //Register collection view cell
        collectionView.register(PointCheckCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewCellIds.pointCheckCell)
        
        collectionView?.alwaysBounceVertical = true
        
        // Manualy refresh the collectionView
        let refreshController = UIRefreshControl()
        refreshController.tintColor = UIColor.black
        refreshController.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView?.refreshControl = refreshController
        
        setupActivityIndicator()
        animateAndShowActivityIndicator(true)
        self.fetchPointCehcks()
    }
    
    @objc fileprivate func handleRefresh() {
        if !canFetchPointChecks {
            return
        }
        
        self.tempPointChecks.removeAll()
        self.pointChecksFetched = 0
        
        self.fetchPointCehcks()
    }
    
    fileprivate func fetchPointCehcks() {
        if !canFetchPointChecks {
            return
        }
        
        self.canFetchPointChecks = false
        
        let pointCheckRef = Database.database().reference().child(Constants.pointCheckRef)
        var query = pointCheckRef.queryOrdered(byChild: Constants.creationDate)
        
        var numberOfPointChecksToFetch: UInt = 20
        
        if self.tempPointChecks.count > 0 {
            let value = self.tempPointChecks.last?.creationDate.timeIntervalSince1970
            //Remove last pointCheck in array so it does not get duplicated when re-fetching
            self.tempPointChecks.removeLast()
            self.pointChecksFetched -= 1
            numberOfPointChecksToFetch = 21
            query = query.queryEnding(atValue: value)
        }
        
        query.queryLimited(toLast: numberOfPointChecksToFetch).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let pointChecksDictionary = snapshot.value as? [String : [String : Any]] else {
                self.pointChecks.removeAll()
                self.showNoResultsFoundView()
                self.canFetchPointChecks = true
                self.animateAndShowActivityIndicator(false)
                return
            }
            
            var pointChecksCreated = 0
            pointChecksDictionary.forEach { (key, value) in
                let pointCheck = PointCheck(id: key, dictionary: value)
                pointChecksCreated += 1
                self.pointChecksFetched += 1
                
                self.tempPointChecks.append(pointCheck)
                self.tempPointChecks.sort(by: { (pointCheck1, pointCheck2) -> Bool in
                    return pointCheck1.creationDate.compare(pointCheck2.creationDate) == .orderedDescending
                })
                
                if pointChecksCreated == pointChecksDictionary.count {
                    self.pointChecks = self.tempPointChecks
                    self.canFetchPointChecks = true
                    self.animateAndShowActivityIndicator(false)
                    
                    if self.tempPointChecks.count == 0 {
                        self.showNoResultsFoundView()
                    } else {
                        self.removeNoResultsView()
                    }
                    
                    return
                }
            }
        }) { (error) in
            self.pointChecks.removeAll()
            self.showNoResultsFoundView()
            self.canFetchPointChecks = true
            self.animateAndShowActivityIndicator(false)
            print("Error fetching pointchecks: \(error)")
            
            return
        }
    }
    
    //MARK: CollectionView Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pointChecks.count
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
        
        //Fetch again more pointChecks if collectionView hits bottom and if there are more pointChecks to fetch
        if indexPath.item == self.pointChecks.count - 1 && (Double(self.pointChecksFetched % 20) == 0.0) {
            self.fetchPointCehcks()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 142.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
