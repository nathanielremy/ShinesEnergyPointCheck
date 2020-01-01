//
//  PointCheckCollectionViewCell.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-01.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import UIKit

class PointCheckCollectionViewCell: UICollectionViewCell {
    
    //MARK: Stored properties
    var pointCheck: PointCheck? {
        didSet {
            guard let pCheck = pointCheck else {
                return
            }
            
            self.customerNameLabel.text = pCheck.customerName
            self.timeAgoLabel.text = pCheck.creationDate.timeAgoDisplay()
            setAttributedText(forLabel: jobNumberLabel, title: "Job Number: ", text: "\(pCheck.jobNumber)")
            setAttributedText(forLabel: serialNumberLabel, title: "Serial Number: ", text: pCheck.serialNumber)
            setAttributedText(forLabel: modelNumberLabel, title: "Model Number: ", text: pCheck.modelNumber)
        }
    }
    
    fileprivate func setAttributedText(forLabel label: UILabel, title: String, text: String) {
        let attributedText = NSMutableAttributedString(string: title, attributes: [.font : UIFont.boldSystemFont(ofSize: 14), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: text, attributes: [.font : UIFont.systemFont(ofSize: 12), .foregroundColor : UIColor.black]))
        
        label.attributedText = attributedText
    }
    
    let customerNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        
        return label
    }()
    
    let jobNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let serialNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let modelNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    let timeAgoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(customerNameLabel)
        customerNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(jobNumberLabel)
        jobNumberLabel.anchor(top: customerNameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(serialNumberLabel)
        serialNumberLabel.anchor(top: jobNumberLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(modelNumberLabel)
        modelNumberLabel.anchor(top: serialNumberLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(timeAgoLabel)
        timeAgoLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: -8, paddingRight: -8, width: nil, height: 12.5)
        
        let bottomSeperatorView = UIView()
        bottomSeperatorView.backgroundColor =  .black
        bottomSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomSeperatorView)
        bottomSeperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: nil, height: 0.5)
    }
}
