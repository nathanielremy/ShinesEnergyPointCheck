//
//  Job.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-10.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import Foundation

struct Job {
    let id: String
    let creationDate: Date
    let pointChecks: [PointCheck]
    
    init(id: String, creationDate: Double, pointChecks: [String : Any]) {
        self.id = id
        self.creationDate = Date(timeIntervalSince1970: creationDate)
        
        var initPChecks = [PointCheck]()
        pointChecks.forEach { (key, value) in
            guard let valueDict = value as? [String : Any] else { return }
            let pointCheck = PointCheck(id: key, dictionary: valueDict)
            initPChecks.append(pointCheck)
        }
        
        initPChecks.sort(by: { (check1, check2) -> Bool in
            return check1.creationDate.compare(check2.creationDate) == .orderedDescending
        })
        
        self.pointChecks = initPChecks
    }
}
