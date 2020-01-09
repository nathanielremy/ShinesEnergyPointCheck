//
//  Constants.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2019-12-28.
//  Copyright © 2019 Nathaniel Remy. All rights reserved.
//

import Foundation

struct Constants {
    static let pointCheckRef = "pointChecks"
    
    static let customerName = "customerName"
    static let customerNameMeaning = "Customer Name"
    
    static let jobNumber = "jobNumber"
    static let jobNumberMeaning = "Job Number"
    
    static let indoorSerialNumber = "indoorSerialNumber"
    static let indoorSerialNumberMeaning = "Indoor Serial Number"
    
    static let indoorModelNumber = "indoorModelNumber"
    static let indoorModelNumberMeaning = "Indoor Model Number"
    
    static let indoorUnitLocation = "indoorUnitLocation"
    static let indoorUnitLocationMeaning = "Indoor Unit Location"
    
    static let outdoorSerialNumber = "outdoorSerialNumber"
    static let outdoorSerialNumberMeaning = "Outdoor Serial Number"
    
    static let outdoorModelNumber = "outdoorModelNumber"
    static let outdoorModelNumberMeaning = "Outdoor Model Number"
    
    static let outdoorUnitLocation = "outdoorUnitLocation"
    static let outdoorUnitLocationMeaning = "Outdoor Unit Location"
    
    static let T1 = "T1"
    static let T1Meaning = "Room Temperature"
    
    static let T2 = "T2"
    static let T2Meaning = "Indoor Coil Temperature"
    
    static let T3 = "T3"
    static let T3Meaning = "Outdoor Coil Temperature"
    
    static let T4 = "T4"
    static let T4Meaning = "Outdoor Ambient Temperature"
    
    static let TB = "TB"
    static let TBMeaning = "Outlet Temperature of Indoor Coil (T2b)"
    
    static let TP = "TP"
    static let TPMeaning = "Discharge Temperature (T5)"
    
    static let TH = "TH"
    static let THMeaning = "Suction Temperature"
    
    static let FT = "FT"
    static let FTMeaning = "Targeted Frequency"
    
    static let Fr = "Fr"
    static let FrMeaning = "Actual Frequency"
    
    static let IF = "IF"
    static let IFMeaning = "Indoor Fan Speed"
    
    static let OF = "OF"
    static let OFMeaning = "Outdoor Fan Speed"
    
    static let LA = "LA"
    static let LAMeaning = "EXV Opening Steps"
    
    static let CT = "CT"
    static let CTMeaning = "Compressor Continuous Runtime"
    
    static let ST = "ST"
    static let STMeaning = "Cause of Compressor Stop"
    
    static let faults = "faults"
    static let faultsMeaning = "Fault Codes"
    
    static let pipeLength = "pipeLength"
    static let pipeLengthMeaning = "Length of Ref Pipe Between?"
    
    static let remoteControlSetting = "remoteControlSetting"
    
    static let modeTempFollowMe = "modeTempFollowMe"
    static let modeTempFollowMeMeaning = "Mode, Temp & Follow Me?"
    
    static let operatingPressure = "operatingPressure"
    static let operatingPressureMeaning = "Operating Pressure"
    
    static let performance = "performance"
    static let performanceMeaning = "Performance"
    
    static let fanProgrammedChanged = "fanProgrammedChanged"
    static let fanProgrammedChangedMeaning = "Fan Programmed Changed?"
    
    static let indoorSensorRARelocated = "indoorSensorRARelocated"
    static let indoorSensorRARelocatedMeaning = "Indoor R/A Sensor Relocated?"
    
    static let comments = "comments"
    static let commentsMeaning = "Comments"
    
    static let creationDate = "creationDate"
    
    struct CollectionViewCellIds {
        static let pointCheckCell = "pointCheckCell"
    }
    
    struct pin {
        static let pinRef = "pin"
        static let currentPin = "currentPin"
    }
}
