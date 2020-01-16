//
//  PointCheckData.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-10.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import UIKit

class PointCheckDataVC: UIViewController {
    
    //MARK: Stored properties
    var pointCheck: PointCheck? {
        didSet {
            guard let pCheck = pointCheck else {
                navigationController?.popViewController(animated: true);
                return;
            }
            
            makeAttributedText(forLabel: customerNameLabel, title: Constants.customerNameMeaning, value: pCheck.customerName)
            makeAttributedText(forLabel: jobNumberLabel, title: Constants.jobNumberMeaning, value: pCheck.jobNumber != 0000000 ? String(pCheck.jobNumber) : "")
            makeAttributedText(forLabel: indoorSerialNumberLabel, title: Constants.indoorSerialNumberMeaning, value: pCheck.indoorSerialNumber)
            makeAttributedText(forLabel: indoorModelNumberLabel, title: Constants.indoorModelNumberMeaning, value: pCheck.indoorModelNumber)
            makeAttributedText(forLabel: indoorUnitLocationLabel, title: Constants.indoorUnitLocationMeaning, value: pCheck.indoorUnitLocation)
            makeAttributedText(forLabel: outdoorSerialNumberLabel, title: Constants.outdoorSerialNumberMeaning, value: pCheck.outdoorSerialNumber)
            makeAttributedText(forLabel: outdoorModelNumberLabel, title: Constants.outdoorModelNumberMeaning, value: pCheck.outdoorModelNumber)
            makeAttributedText(forLabel: outdoorUnitLocationLabel, title: Constants.outdoorUnitLocationMeaning, value: pCheck.outdoorUnitLocation)
            makeAttributedText(forLabel: pipeLengthLabel, title: Constants.pipeLengthMeaning, value: pCheck.pipeLength != 000 ? String(pCheck.pipeLength) : "")
            makeAttributedText(forLabel: t1Label, title: "T1 " + Constants.T1Meaning, value: pCheck.T1 != 000 ? String(pCheck.T1) : "")
            makeAttributedText(forLabel: t2Label, title: "T2 " + Constants.T2Meaning, value: pCheck.T2 != 000 ? String(pCheck.T2) : "")
            makeAttributedText(forLabel: t3Label, title: "T3 " + Constants.T3Meaning, value: pCheck.T3 != 000 ? String(pCheck.T3) : "")
            makeAttributedText(forLabel: t4Label, title: "T4 " + Constants.T4Meaning, value: pCheck.T4 != 000 ? String(pCheck.T4) : "")
            makeAttributedText(forLabel: tbLabel, title: "TB " + Constants.TBMeaning, value: pCheck.TB != 000 ? String(pCheck.TB) : "")
            makeAttributedText(forLabel: tpLabel, title: "TP " + Constants.TPMeaning, value: pCheck.TP != 000 ? String(pCheck.TP) : "")
            makeAttributedText(forLabel: thLabel, title: "TH " + Constants.THMeaning, value: pCheck.TH != 000 ? String(pCheck.TH) : "")
            makeAttributedText(forLabel: ftLabel, title: "FT " + Constants.FTMeaning, value: pCheck.FT != 000 ? String(pCheck.FT) : "")
            makeAttributedText(forLabel: frLabel, title: "Fr " + Constants.FrMeaning, value: pCheck.Fr != 000 ? String(pCheck.Fr) : "")
            makeAttributedText(forLabel: ifLabel, title: "IF " + Constants.IFMeaning, value: pCheck.IF)
            makeAttributedText(forLabel: ofLabel, title: "OF " + Constants.OFMeaning, value: pCheck.OF)
            makeAttributedText(forLabel: laLabel, title: "LA " + Constants.LAMeaning, value: pCheck.LA)
            makeAttributedText(forLabel: ctLabel, title: "CT " + Constants.CTMeaning, value: pCheck.CT != 000 ? String(pCheck.CT) : "")
            makeAttributedText(forLabel: stLabel, title: "ST " + Constants.STMeaning, value: pCheck.ST != 000 ? String(pCheck.ST) : "")
            makeAttributedText(forLabel: faultsLabel, title: Constants.faultsMeaning, value: pCheck.faults)
            makeAttributedText(forLabel: remoteControlSettingLabel, title: Constants.remoteControlSettingMeaning, value: pCheck.remoteControlSetting)
            makeAttributedText(forLabel: modeTempFollowMeLabel, title: Constants.modeTempFollowMeMeaning, value: pCheck.modeTempFolllowMe)
            makeAttributedText(forLabel: operatingPressureLabel, title: Constants.operatingPressureMeaning, value: pCheck.operatingPressure != 000 ? String(pCheck.operatingPressure) : "")
            makeAttributedText(forLabel: performanceLabel, title: Constants.performanceMeaning, value: pCheck.performance)
            makeAttributedText(forLabel: fanProgrammedChangedLabel, title: Constants.fanProgrammedChanged, value: pCheck.fanProgrammedChanged ? "Yes" : "No")
            makeAttributedText(forLabel: indoorRASensorRelocatedLabel, title: Constants.indoorSensorRARelocatedMeaning, value: pCheck.indoorRASensorRelocated ? "Yes" : "No")
            commentsTextView.text = pCheck.comments
        }
    }
    
    fileprivate func makeAttributedText(forLabel label: UILabel, title: String, value: String) {
        let attributedText = NSMutableAttributedString(string: title + "\n", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: value, attributes: [.font : UIFont.systemFont(ofSize: 16), .foregroundColor : UIColor.black]))
        
        label.attributedText = attributedText
    }
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.bounces = true
        sv.backgroundColor = .white
        
        return sv
    }()
    
    let customerNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let jobNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let indoorSerialNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let indoorModelNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let indoorUnitLocationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let outdoorSerialNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
       }()
    
    let outdoorModelNumberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let outdoorUnitLocationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let pipeLengthLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let t1Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let t2Label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let t3Label: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       
       return label
   }()
   
   let t4Label: UILabel = {
       let label = UILabel()
       label.numberOfLines = 0
       
       return label
   }()
    
    let tbLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let tpLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let thLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let ftLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let frLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let ifLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let ofLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let laLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let ctLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let stLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let faultsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let remoteControlSettingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let modeTempFollowMeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let operatingPressureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let performanceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let fanProgrammedChangedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let indoorRASensorRelocatedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        return label
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.commentsMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let commentsTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.masksToBounds = true
        textView.isScrollEnabled = true
        textView.isEditable = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Point Check Data"
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1500)
        
        //Customer name
        scrollView.addSubview(customerNameLabel)
        customerNameLabel.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Job number
        scrollView.addSubview(jobNumberLabel)
        jobNumberLabel.anchor(top: customerNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Indoor serial number
        scrollView.addSubview(indoorSerialNumberLabel)
        indoorSerialNumberLabel.anchor(top: jobNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Indoor model number
        scrollView.addSubview(indoorModelNumberLabel)
        indoorModelNumberLabel.anchor(top: indoorSerialNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Indoor unit location
        scrollView.addSubview(indoorUnitLocationLabel)
        indoorUnitLocationLabel.anchor(top: indoorModelNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Outdoor serial number
        scrollView.addSubview(outdoorSerialNumberLabel)
        outdoorSerialNumberLabel.anchor(top: indoorUnitLocationLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Outdoor model number
        scrollView.addSubview(outdoorModelNumberLabel)
        outdoorModelNumberLabel.anchor(top: outdoorSerialNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Outdoor untit location
        scrollView.addSubview(outdoorUnitLocationLabel)
        outdoorUnitLocationLabel.anchor(top: outdoorModelNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Pipe length
        scrollView.addSubview(pipeLengthLabel)
        pipeLengthLabel.anchor(top: outdoorUnitLocationLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //T1
        scrollView.addSubview(t1Label)
        t1Label.anchor(top: pipeLengthLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //T2
        scrollView.addSubview(t2Label)
        t2Label.anchor(top: t1Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //T3
        scrollView.addSubview(t3Label)
        t3Label.anchor(top: t2Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //T4
        scrollView.addSubview(t4Label)
        t4Label.anchor(top: t3Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //TB
        scrollView.addSubview(tbLabel)
        tbLabel.anchor(top: t4Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //TP
        scrollView.addSubview(tpLabel)
        tpLabel.anchor(top: tbLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //TH
        scrollView.addSubview(thLabel)
        thLabel.anchor(top: tpLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //FT
        scrollView.addSubview(ftLabel)
        ftLabel.anchor(top: thLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //FR
        scrollView.addSubview(frLabel)
        frLabel.anchor(top: ftLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //IF
        scrollView.addSubview(ifLabel)
        ifLabel.anchor(top: frLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //OF
        scrollView.addSubview(ofLabel)
        ofLabel.anchor(top: ifLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //LA
        scrollView.addSubview(laLabel)
        laLabel.anchor(top: ofLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //CT
        scrollView.addSubview(ctLabel)
        ctLabel.anchor(top: laLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //ST
        scrollView.addSubview(stLabel)
        stLabel.anchor(top: ctLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Faults
        scrollView.addSubview(faultsLabel)
        faultsLabel.anchor(top: stLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Remote control setting
        scrollView.addSubview(remoteControlSettingLabel)
        remoteControlSettingLabel.anchor(top: faultsLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Mode temp follow me
        scrollView.addSubview(modeTempFollowMeLabel)
        modeTempFollowMeLabel.anchor(top: remoteControlSettingLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Operating pressure
        scrollView.addSubview(operatingPressureLabel)
        operatingPressureLabel.anchor(top: modeTempFollowMeLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Performance
        scrollView.addSubview(performanceLabel)
        performanceLabel.anchor(top: operatingPressureLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Fan programmed changed
        scrollView.addSubview(fanProgrammedChangedLabel)
        fanProgrammedChangedLabel.anchor(top: performanceLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Indoor R/A sensor relocated
        scrollView.addSubview(indoorRASensorRelocatedLabel)
        indoorRASensorRelocatedLabel.anchor(top: fanProgrammedChangedLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        //Comments
        scrollView.addSubview(commentsLabel)
        commentsLabel.anchor(top: indoorRASensorRelocatedLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(commentsTextView)
        commentsTextView.anchor(top: commentsLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 200)
        commentsTextView.layer.cornerRadius = 10
    }
}
