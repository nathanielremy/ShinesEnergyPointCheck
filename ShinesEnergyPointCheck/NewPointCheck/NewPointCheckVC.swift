//
//  NewPointCheckVC.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2019-12-28.
//  Copyright © 2019 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit

class NewPointCheckVC: UIViewController {
    
    //MARK: Stored properties
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.bounces = true
        sv.backgroundColor = .white
        
        return sv
    }()
    
    let customerNameLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.customerNameMeaning + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "*", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.red]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var customerNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "First & last name"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let jobNumberLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.jobNumberMeaning + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "*", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.red]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var jobNumberTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Job #"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let serialNumberLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.serialNumberMeaning + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "*", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.red]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var serialNumberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Serial #"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let modelNumberLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.modelNumberMeaning + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "*", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.red]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var modelNumberTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Model #"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let indoorUnitLocationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.indoorUnitLocationMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var indoorUnitLocationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Living room"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let outdoorLocationLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Outdoor Location ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.outdoorLocationMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var outdoorLocationTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Outdoor location"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let pipeLengthLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.pipeLengthMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var pipeLengthTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Pipe length"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let t1Label: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.T1 + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.T1Meaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var t1TextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Room temperature"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let t2Label: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.T2 + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.T2Meaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var t2TextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Indoor coil temperature"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let t3Label: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.T3 + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.T3Meaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var t3TextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Outdoor coil temperature"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let t4Label: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.T4 + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.T4Meaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var t4TextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Outdoor ambient temperature"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let tbLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.TB + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.TBMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var tbTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Outlet temp of indoor coil (T2b)"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let tpLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.TP + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.TPMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var tpTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Discharge temperature (T5)"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let thLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.TH + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.THMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var thTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Suction temperature"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let ftLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.FT + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.FTMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var ftTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Targeted frequency"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let frLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.Fr + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.FrMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var frTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Actual frequency"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let ifLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.IF + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.IFMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var ifTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Indoor fan speed"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let ofLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.OF + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.OFMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var ofTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Outdoor fan speed"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let laLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.LA + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.LAMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var laTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "EXV opening steps"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let ctLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.CT + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.CTMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var ctTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Compressor continuous runtime"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let stLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: Constants.ST + " ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.STMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var stTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Causes of compressor stop"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let faultsLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Faults ", attributes: [.font : UIFont.boldSystemFont(ofSize: 18), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: "(\(Constants.faultsMeaning))", attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.gray]))
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var faultsTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Fault codes"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let remoteControlSettingLabel: UILabel = {
        let label = UILabel()
        label.text = "Remote Control Setting"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var remoteControlSettingTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Remote control setting"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let modeTempFollowMeLabel: UILabel = {
        let label = UILabel()
        label.text = "(\(Constants.modeTempFollowMeMeaning))"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var modeTempFollowMeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Mode, temp & follow me?"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let operatingPressureLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.operatingPressureMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var operatingPressureTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .numberPad
        tf.inputAccessoryView = setupDoneButtonToolBar()
        tf.placeholder = "Operating pressure"
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.borderStyle =  .roundedRect
        tf.layer.borderColor = UIColor.black.cgColor
        tf.delegate = self
        
        return tf
    }()
    
    let performanceLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.performanceMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var calculatePerformanceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("calculate", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(handleCalculatePerformance), for: .touchUpInside)
        
        return button
    }()
    
    let performanceCalculationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculate result"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        
        return label
    }()
    
    @objc fileprivate func handleCalculatePerformance() {
        print("Handeling calculate performance")
    }
    
    let fanProgrammedChangedLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.fanProgrammedChangedMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var fanProgrammedChangedSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.tintColor = .black
        toggle.onTintColor = .black
        
        return toggle
    }()
    
    let indoorRASensorRelocatedLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.indoorSensorRARelocatedMeaning
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    lazy var indoorRASensorRelocatedSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.tintColor = .black
        toggle.onTintColor = .black
        
        return toggle
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc fileprivate func handleDoneButton() {
        let inputs = verifyInputs()
    }
    
    fileprivate func verifyInputs() -> (customerName: String, jobNumber: Int, serialNumber: String, modelNumber: String)? {
        guard let customerName = customerNameTextField.text, customerName.count > 0, customerName != "" else {
            let alert = UIView.okayAlert(title: "Error With Customer Name", message: "Entering the customer's name is a manditory field.")
            self.present(alert, animated: true, completion: nil)
            
            return nil
        }
        
        guard let jobNumber = jobNumberTextField.text, jobNumber.count == 7, let jobNumberInt = Int(jobNumber) else {
            let alert = UIView.okayAlert(title: "Error With Job Number", message: "Entering the job number (a series of seven integers) is a manditory field.")
            self.present(alert, animated: true, completion: nil)
            
            return nil
        }
        
        guard let serialNumber = serialNumberTextField.text, serialNumber.count == 10 else {
            let alert = UIView.okayAlert(title: "Error With Serial Number", message: "Entering the serial number (a series of 10 characters) is a manditory field.")
            self.present(alert, animated: true, completion: nil)
            return nil
        }
        
        // Serial number is a string of 4 single integers, 1 string character and 5 single integers.
        // ie. 1234a56789
        var charCount = 0
        for char in serialNumber {
            charCount += 1
            if charCount == 5 {
                if let _ = Int(String(char)) {
                    let alert = UIView.okayAlert(title: "Invalid Serial Number", message: "Serial Numbers are a series of 4 integers, 1 string character and 5 more integers")
                    self.present(alert, animated: true, completion: nil)
                    return nil
                } else {
                    print(char)
                }
            } else {
                if let _ = Int(String(char)) {
                    continue
                } else {
                    let alert = UIView.okayAlert(title: "Invalid Serial Number", message: "Serial Numbers are a series of 4 integers, 1 string character and 5 more integers")
                    self.present(alert, animated: true, completion: nil)
                    return nil
                }
            }
        }
        
        return (customerName, jobNumberInt, serialNumber, "modelnumber")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationItem.title = "New Point Check"
        setupDoneNavBarButton()
        setupViews()
    }
    
    fileprivate func setupDoneNavBarButton() {
        let doneBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDoneButton))
        doneBarButton.tintColor = .black
        navigationItem.rightBarButtonItem = doneBarButton
    }
    
    fileprivate func setupViews() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: nil, height: nil)
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height + 1800)
        
        //Customer name
        scrollView.addSubview(customerNameLabel)
        customerNameLabel.anchor(top: scrollView.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(customerNameTextField)
        customerNameTextField.anchor(top: customerNameLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Job number
        scrollView.addSubview(jobNumberLabel)
        jobNumberLabel.anchor(top: customerNameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(jobNumberTextField)
        jobNumberTextField.anchor(top: jobNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Serial number
        scrollView.addSubview(serialNumberLabel)
        serialNumberLabel.anchor(top: jobNumberTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(serialNumberTextField)
        serialNumberTextField.anchor(top: serialNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Model number
        scrollView.addSubview(modelNumberLabel)
        modelNumberLabel.anchor(top: serialNumberTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(modelNumberTextField)
        modelNumberTextField.anchor(top: modelNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Indoor unit location
        scrollView.addSubview(indoorUnitLocationLabel)
        indoorUnitLocationLabel.anchor(top: modelNumberTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(indoorUnitLocationTextField)
        indoorUnitLocationTextField.anchor(top: indoorUnitLocationLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Outdoor Location
        scrollView.addSubview(outdoorLocationLabel)
        outdoorLocationLabel.anchor(top: indoorUnitLocationTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(outdoorLocationTextField)
        outdoorLocationTextField.anchor(top: outdoorLocationLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Pipe Length
        scrollView.addSubview(pipeLengthLabel)
        pipeLengthLabel.anchor(top: outdoorLocationTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(pipeLengthTextField)
        pipeLengthTextField.anchor(top: pipeLengthLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //T1
        scrollView.addSubview(t1Label)
        t1Label.anchor(top: pipeLengthTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(t1TextField)
        t1TextField.anchor(top: t1Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //T2
        scrollView.addSubview(t2Label)
        t2Label.anchor(top: t1TextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(t2TextField)
        t2TextField.anchor(top: t2Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //T3
        scrollView.addSubview(t3Label)
        t3Label.anchor(top: t2TextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(t3TextField)
        t3TextField.anchor(top: t3Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //T4
        scrollView.addSubview(t4Label)
        t4Label.anchor(top: t3TextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(t4TextField)
        t4TextField.anchor(top: t4Label.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //TB
        scrollView.addSubview(tbLabel)
        tbLabel.anchor(top: t4TextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(tbTextField)
        tbTextField.anchor(top: tbLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //TP
        scrollView.addSubview(tpLabel)
        tpLabel.anchor(top: tbTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(tpTextField)
        tpTextField.anchor(top: tpLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //TH
        scrollView.addSubview(thLabel)
        thLabel.anchor(top: tpTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(thTextField)
        thTextField.anchor(top: thLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //FT
        scrollView.addSubview(ftLabel)
        ftLabel.anchor(top: thTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(ftTextField)
        ftTextField.anchor(top: ftLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Fr
        scrollView.addSubview(frLabel)
        frLabel.anchor(top: ftTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(frTextField)
        frTextField.anchor(top: frLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //IF
        scrollView.addSubview(ifLabel)
        ifLabel.anchor(top: frTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(ifTextField)
        ifTextField.anchor(top: ifLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //OF
        scrollView.addSubview(ofLabel)
        ofLabel.anchor(top: ifTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(ofTextField)
        ofTextField.anchor(top: ofLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //LA
        scrollView.addSubview(laLabel)
        laLabel.anchor(top: ofTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(laTextField)
        laTextField.anchor(top: laLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //CT
        scrollView.addSubview(ctLabel)
        ctLabel.anchor(top: laTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(ctTextField)
        ctTextField.anchor(top: ctLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //ST
        scrollView.addSubview(stLabel)
        stLabel.anchor(top: ctTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(stTextField)
        stTextField.anchor(top: stLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Faults
        scrollView.addSubview(faultsLabel)
        faultsLabel.anchor(top: stTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(faultsTextField)
        faultsTextField.anchor(top: faultsLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Remote Controll Setting
        scrollView.addSubview(remoteControlSettingLabel)
        remoteControlSettingLabel.anchor(top: faultsTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(remoteControlSettingTextField)
        remoteControlSettingTextField.anchor(top: remoteControlSettingLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Mode, Temp & Follow Me?
        scrollView.addSubview(modeTempFollowMeLabel)
        modeTempFollowMeLabel.anchor(top: remoteControlSettingTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(modeTempFollowMeTextField)
        modeTempFollowMeTextField.anchor(top: modeTempFollowMeLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Operating pressure
        scrollView.addSubview(operatingPressureLabel)
        operatingPressureLabel.anchor(top: modeTempFollowMeTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(operatingPressureTextField)
        operatingPressureTextField.anchor(top: operatingPressureLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: 35)
        
        //Performance
        scrollView.addSubview(performanceLabel)
        performanceLabel.anchor(top: operatingPressureTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        scrollView.addSubview(calculatePerformanceButton)
        calculatePerformanceButton.anchor(top: nil, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        calculatePerformanceButton.centerYAnchor.constraint(equalTo: performanceLabel.centerYAnchor).isActive = true
        
        scrollView.addSubview(performanceCalculationResultLabel)
        performanceCalculationResultLabel.anchor(top: performanceLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 26, paddingBottom: 0, paddingRight: -20, width: nil, height: nil)
        
        let bottomSeperatorView = UIView()
        bottomSeperatorView.backgroundColor = .black
        scrollView.addSubview(bottomSeperatorView)
        bottomSeperatorView.anchor(top: nil, left: view.leftAnchor, bottom: performanceCalculationResultLabel.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 8, paddingRight: -20, width: nil, height: 0.5)
        
        //Fan Programmed Changed
        scrollView.addSubview(fanProgrammedChangedLabel)
        fanProgrammedChangedLabel.anchor(top: bottomSeperatorView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: (view.frame.width * 0.7), height: nil)
        
        scrollView.addSubview(fanProgrammedChangedSwitch)
        fanProgrammedChangedSwitch.anchor(top: nil, left: fanProgrammedChangedLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: -25, width: nil, height: nil)
        fanProgrammedChangedSwitch.centerYAnchor.constraint(equalTo: fanProgrammedChangedLabel.centerYAnchor).isActive = true
        
        //Indoor R/A Sensor Relocated
        scrollView.addSubview(indoorRASensorRelocatedLabel)
        indoorRASensorRelocatedLabel.anchor(top: fanProgrammedChangedLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: (view.frame.width * 0.7), height: nil)
        
        scrollView.addSubview(indoorRASensorRelocatedSwitch)
        indoorRASensorRelocatedSwitch.anchor(top: nil, left: indoorRASensorRelocatedLabel.rightAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: -25, width: nil, height: nil)
        indoorRASensorRelocatedSwitch.centerYAnchor.constraint(equalTo: indoorRASensorRelocatedLabel.centerYAnchor).isActive = true
        
        //Done button
        scrollView.addSubview(doneButton)
        doneButton.anchor(top: nil, left: nil, bottom: scrollView.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: view.frame.height + 1780, paddingRight: 0, width: 200, height: 50)
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.layer.cornerRadius = 50 / 2
    }
    
    fileprivate func setupDoneButtonToolBar() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(handleTextFieldDoneButton))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        return toolBar
    }
}

//MARK: UITextFieldDelegate Methods
extension NewPointCheckVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        return true
    }
    
    // When done button is clicked on keyboard input accessory view
    @objc func handleTextFieldDoneButton() {
        view.endEditing(true)
    }
}
