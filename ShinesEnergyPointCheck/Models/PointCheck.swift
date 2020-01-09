//
//  PointCheck.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-01.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import Foundation

struct PointCheck {
    let id: String
    
    let customerName: String
    let jobNumber: Int
    let indoorSerialNumber: String
    let indoorModelNumber: String
    let indoorUnitLocation: String
    let outdoorSerialNumber: String
    let outdoorModelNumber: String
    let outdoorUnitLocation: String
    let pipeLength: Int
    let T1: Int
    let T2: Int
    let T3: Int
    let T4: Int
    let TB: Int
    let TP: Int
    let TH: Int
    let FT: Int
    let Fr: Int
    let IF: String
    let OF: String
    let LA: String
    let CT: Int
    let ST: Int
    let faults: String
    let remoteControlSetting: String
    let modeTempFolllowMe: String
    let operatingPressure: Int
    let performance: String
    let fanProgrammedChanged: Bool
    let indoorRASensorRelocated: Bool
    let comments: String
    
    let creationDate: Date
    
    init(id: String, dictionary: [String : Any]) {
        self.id = id
        
        self.customerName = dictionary[Constants.customerName] as? String  ?? "No Name"
        self.jobNumber = dictionary[Constants.jobNumber] as? Int  ?? 0000000
        self.indoorSerialNumber = dictionary[Constants.indoorSerialNumber] as? String  ?? "No Indoor Serial Number"
        self.indoorModelNumber = dictionary[Constants.indoorModelNumber] as? String ?? "No Model Number"
        self.indoorUnitLocation = dictionary[Constants.indoorUnitLocation] as? String ?? "No Indoor Unit Location"
        self.outdoorSerialNumber = dictionary[Constants.outdoorSerialNumber] as? String ?? "No Outdoor Serial Number"
        self.outdoorModelNumber = dictionary[Constants.outdoorModelNumber] as? String ?? "No Outdoor Model Number"
        self.outdoorUnitLocation = dictionary[Constants.outdoorUnitLocation] as? String ?? "No Outdoor location"
        self.pipeLength = dictionary[Constants.pipeLength] as? Int ?? 000
        self.T1 = dictionary[Constants.T1] as? Int ?? 000
        self.T2 = dictionary[Constants.T2] as? Int ?? 000
        self.T3 = dictionary[Constants.T3] as? Int ?? 000
        self.T4 = dictionary[Constants.T4] as? Int ?? 000
        self.TB = dictionary[Constants.TB] as? Int ?? 000
        self.TP = dictionary[Constants.TP] as? Int ?? 000
        self.TH = dictionary[Constants.TH] as? Int ?? 000
        self.FT = dictionary[Constants.FT] as? Int ?? 000
        self.Fr = dictionary[Constants.Fr] as? Int ?? 000
        self.IF = dictionary[Constants.IF] as? String ?? "No Indoor Fan Speed"
        self.OF = dictionary[Constants.OF] as? String ?? "No Outdoor Fan Speed"
        self.LA = dictionary[Constants.LA] as? String ?? "No EXV Opening Steps"
        self.CT = dictionary[Constants.CT] as? Int ?? 000
        self.ST = dictionary[Constants.ST] as? Int ?? 000
        self.faults = dictionary[Constants.faults] as? String ??  "No Fault Codes"
        self.remoteControlSetting = dictionary[Constants.remoteControlSetting] as? String ??  "No Remote Control Setting"
        self.modeTempFolllowMe = dictionary[Constants.modeTempFollowMe] as? String ??  "No (Mode, Temp & Follow Me)"
        self.operatingPressure = dictionary[Constants.operatingPressure] as? Int ?? 000
        self.performance = dictionary[Constants.performance] as? String ?? "No Performance Recorded"
        self.fanProgrammedChanged = dictionary[Constants.fanProgrammedChanged] as? Bool ?? false
        self.indoorRASensorRelocated = dictionary[Constants.indoorSensorRARelocated] as? Bool ?? false
        self.comments = dictionary[Constants.comments] as? String ?? "No Comments"
        
        let secondsFrom1970 = dictionary[Constants.creationDate] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
    }
}
