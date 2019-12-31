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
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enter", for: .normal)
        button.addTarget(self, action: #selector(handleEnterButton), for: .touchUpInside)
        
        return button
    }()
    
    @objc fileprivate func handleEnterButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Enter PIN"
        
        view.backgroundColor = .white
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
