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

class ViewJobsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //MARK: Stored properties
    var jobs = [Job]()
    var tempJobs = [Job]()
    
    var jobsFetched = 0
    
    var canFetchJobs = true
    
    let noResultsView: UIView = {
        let view = UIView.noResultsView(withText: "No Point Checks at The Moment.")
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
        navigationItem.title = "Jobs"
        
        //Register collection view cell
        collectionView.register(JobCollectionViewCell.self, forCellWithReuseIdentifier: Constants.CollectionViewCellIds.jobCell)
        
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
        if !canFetchJobs {
            return
        }
        
        self.tempJobs.removeAll()
        self.jobsFetched = 0
        
        self.fetchPointCehcks()
    }
    
    fileprivate func fetchPointCehcks() {
        if !canFetchJobs {
            return
        }
        
        self.canFetchJobs = false
        
        let pointCheckRef = Database.database().reference().child(Constants.pointCheckRef)
        var query = pointCheckRef.queryOrdered(byChild: Constants.creationDate)
        
        var numberOfJobsToFetch: UInt = 20
        
        if self.tempJobs.count > 0 {
            let value = self.tempJobs.last?.creationDate.timeIntervalSince1970
            //Remove last pointCheck in array so it does not get duplicated when re-fetching
            self.tempJobs.removeLast()
            self.jobsFetched -= 1
            numberOfJobsToFetch = 21
            query = query.queryEnding(atValue: value)
        }
        
        query.queryLimited(toLast: numberOfJobsToFetch).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let jobsDictionary = snapshot.value as? [String : [String : Any]] else {
                self.jobs.removeAll()
                self.showNoResultsFoundView()
                self.canFetchJobs = true
                self.animateAndShowActivityIndicator(false)
                return
            }
            
            var jobsCreated = 0
            jobsDictionary.forEach { (key, value) in
                
                var pointChecks = [String : Any]()
                
                value.forEach { (valKey, valValue) in     //Usually an unacceptable algorithm but in this case is fine
                    if valKey != Constants.creationDate { //Since maximum number of operations == O(n) where n == 5
                        pointChecks[valKey] = valValue
                    }
                }
                
                let job = Job(id: key, creationDate: value[Constants.creationDate] as? Double ?? 0.0 , pointChecks: pointChecks)
                jobsCreated += 1
                self.jobsFetched += 1
                
                self.tempJobs.append(job)
                self.tempJobs.sort(by: { (job1, job2) -> Bool in
                    return job1.creationDate.compare(job2.creationDate) == .orderedDescending
                })
                
                if jobsCreated == jobsDictionary.count {
                    self.jobs = self.tempJobs
                    self.canFetchJobs = true
                    self.animateAndShowActivityIndicator(false)
                    
                    if self.tempJobs.count == 0 {
                        self.showNoResultsFoundView()
                    } else {
                        self.removeNoResultsView()
                    }
                    
                    return
                }
            }
        }) { (error) in
            self.jobs.removeAll()
            self.showNoResultsFoundView()
            self.canFetchJobs = true
            self.animateAndShowActivityIndicator(false)
            print("Error fetching pointchecks: \(error)")
            
            return
        }
    }
    
    //MARK: CollectionView Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.jobs.count
    }
    
    // What's the vertical spacing between each cell ?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellIds.jobCell, for: indexPath) as? JobCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.job = self.jobs[indexPath.item]
        
        //Fetch again more pointChecks if collectionView hits bottom and if there are more pointChecks to fetch
        if indexPath.item == self.jobs.count - 1 && (Double(self.jobsFetched % 20) == 0.0) {
            self.fetchPointCehcks()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 85)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewPointChecksVC = ViewPointChecksVC(collectionViewLayout: UICollectionViewFlowLayout())
        viewPointChecksVC.pointChecks = jobs[indexPath.item].pointChecks
        
        self.navigationController?.pushViewController(viewPointChecksVC, animated: true)
    }
}
