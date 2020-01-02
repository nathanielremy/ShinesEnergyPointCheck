//
//  PinCodeVC.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2019-12-31.
//  Copyright © 2019 Nathaniel Remy. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class PinCodeVC: UIViewController {
    
    //MARK: Stored properties
    // Display while first loading PIN
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
    
    let oneButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 1
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let twoButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 2
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let threeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 3
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let fourButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 4
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let fiveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 5
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let sixButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 6
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let sevenButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 7
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let eightButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 8
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let nineButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 9
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let zeroButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.tag = 0
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(handleButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    var pinArray = [String]()
    var pinString = ""
    
    @objc fileprivate func handleButton(_ button: UIButton) {
        if pinArray.count == 0 {
            firstEntry.backgroundColor = UIColor.black.withAlphaComponent(1)
            pinArray.append(String(button.tag))
        } else if pinArray.count == 1 {
            secondEntry.backgroundColor = UIColor.black.withAlphaComponent(1)
            pinArray.append(String(button.tag))
        } else if pinArray.count == 2 {
            thirdEntry.backgroundColor = UIColor.black.withAlphaComponent(1)
            pinArray.append(String(button.tag))
        } else if pinArray.count == 3 {
            fourthEntry.backgroundColor = UIColor.black.withAlphaComponent(1)
            pinArray.append(String(button.tag))
        }
        
        if pinArray.count == 4 {
            for i in 0...3 {
                if Array(pinArray[i])[0] != Array(pinString)[i] {
                    let alert = UIView.okayAlert(title: "Incorrect PIN", message: "Please try entering a different pin.")
                    self.present(alert, animated: true, completion: nil)
                    self.firstEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
                    self.secondEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
                    self.thirdEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
                    self.fourthEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
                    self.pinArray.removeAll()
                    
                    return
                } else if i == 3 {
                    self.dismiss(animated: false, completion: nil)
                }
            }
        }
    }
    
    let firstEntry: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        
        return label
    }()
    
    let secondEntry: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        
        return label
    }()
    
    let thirdEntry: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        
        return label
    }()
    
    let fourthEntry: UILabel = {
        let label = UILabel()
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.tintColor  = .black
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc fileprivate func handleBackButton() {
        if pinArray.count == 0 {
            return
        } else if pinArray.count == 1 {
            pinArray.removeLast()
            firstEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        } else if pinArray.count == 2 {
            pinArray.removeLast()
            secondEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        } else if pinArray.count == 3 {
            pinArray.removeLast()
            thirdEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        } else if pinArray.count == 4 {
            pinArray.removeLast()
            fourthEntry.backgroundColor = UIColor.black.withAlphaComponent(0.33)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Enter PIN"
        
        view.backgroundColor = .white
        
        setupActivityIndicator()
        fetchPin()
    }
    
    fileprivate func setupActivityIndicator() {
        view.addSubview(self.activityIndicator)
        self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func fetchPin() {
        animateAndShowActivityIndicator(true)
        let pinRef = Database.database().reference().child(Constants.pin.pinRef)
        pinRef.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let pinDictionary = snapshot.value as? [String : Int], let pinInt = pinDictionary[Constants.pin.currentPin] else {
                let alert = UIView.okayAlert(title: "Unable to Retrieve PIN", message: "Sorry! We are currently unable to find the correct PIN.")
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            self.pinString = String(pinInt)
            
            DispatchQueue.main.async {
                self.setupViews()
                self.animateAndShowActivityIndicator(false)
            }
        }) { (error) in
            let alert = UIView.okayAlert(title: "Unable to Retrieve PIN", message: "Sorry! We are currently unable to find the correct PIN.")
            self.present(alert, animated: true, completion: nil)
            print("Error fetching PIN: \(error)")
        }
    }
    
    fileprivate func setupViews() {
        let firstStack = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton])
        firstStack.alignment = .center
        firstStack.axis = .horizontal
        firstStack.spacing = 20
        firstStack.distribution = .fillEqually
        
        firstStack.widthAnchor.constraint(equalToConstant: 265).isActive = true
        
        oneButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        oneButton.layer.cornerRadius = 75 / 2
        twoButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        twoButton.layer.cornerRadius = 75 / 2
        threeButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        threeButton.layer.cornerRadius = 75 / 2
        
        let secondStack = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton])
        secondStack.alignment = .center
        secondStack.axis = .horizontal
        secondStack.spacing = 20
        secondStack.distribution = .fillEqually
        
        secondStack.widthAnchor.constraint(equalToConstant: 265).isActive = true
        
        fourButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        fourButton.layer.cornerRadius = 75 / 2
        fiveButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        fiveButton.layer.cornerRadius = 75 / 2
        sixButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        sixButton.layer.cornerRadius = 75 / 2
        
        let thirdStack = UIStackView(arrangedSubviews: [sevenButton, eightButton, nineButton])
        thirdStack.alignment = .center
        thirdStack.axis = .horizontal
        thirdStack.spacing = 20
        thirdStack.distribution = .fillEqually
        
        thirdStack.widthAnchor.constraint(equalToConstant: 265).isActive = true
        
        sevenButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        sevenButton.layer.cornerRadius = 75 / 2
        eightButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        eightButton.layer.cornerRadius = 75 / 2
        nineButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
        nineButton.layer.cornerRadius = 75 / 2
        
        let finalStack = UIStackView(arrangedSubviews: [firstStack, secondStack, thirdStack])
        finalStack.alignment = .center
        finalStack.axis = .vertical
        finalStack.spacing = 20
        finalStack.distribution = .fillEqually
        
        view.addSubview(finalStack)
        finalStack.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 265, height: 265)
        finalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        finalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(zeroButton)
        zeroButton.anchor(top: finalStack.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
        zeroButton.centerXAnchor.constraint(equalTo: finalStack.centerXAnchor).isActive = true
        zeroButton.layer.cornerRadius = 75 / 2
        
        let entryStack = UIStackView(arrangedSubviews: [firstEntry, secondEntry, thirdEntry, fourthEntry])
        entryStack.axis = .horizontal
        entryStack.spacing = 10
        entryStack.distribution = .fillEqually
        
        view.addSubview(entryStack)
        entryStack.anchor(top: nil, left: nil, bottom: finalStack.topAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -40, paddingRight: 0, width: 110, height: 20)
        entryStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive =  true
        
        firstEntry.layer.cornerRadius = 10
        secondEntry.layer.cornerRadius = 10
        thirdEntry.layer.cornerRadius = 10
        fourthEntry.layer.cornerRadius = 10
        
        view.addSubview(backButton)
        backButton.anchor(top: finalStack.bottomAnchor, left: zeroButton.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 75, height: 75)
    }
}
