//
//  PointCheckCollectionViewCell.swift
//  ShinesEnergyPointCheck
//
//  Created by Nathaniel Remy on 2020-01-10.
//  Copyright © 2020 Nathaniel Remy. All rights reserved.
//

import UIKit

class PointCheckCollectionViewCell: UICollectionViewCell {
    
    //Stored properties
    var pointCheck: PointCheck? {
        didSet {
            guard let pointCheck = pointCheck else {
                return
            }
            
            setAttributedText(forLabel: indoorSerialNumberLabel, title: Constants.indoorSerialNumberMeaning + ": ", text: pointCheck.indoorSerialNumber)
            setAttributedText(forLabel: indoorModelNumberLabel, title: Constants.indoorModelNumberMeaning + ": ", text: pointCheck.indoorModelNumber)
            self.timeAgoLabel.text = pointCheck.creationDate.timeAgoDisplay()
        }
    }
    
    fileprivate func setAttributedText(forLabel label: UILabel, title: String, text: String) {
        let attributedText = NSMutableAttributedString(string: title, attributes: [.font : UIFont.boldSystemFont(ofSize: 14), .foregroundColor : UIColor.black])
        attributedText.append(NSAttributedString(string: text, attributes: [.font : UIFont.systemFont(ofSize: 14), .foregroundColor : UIColor.black]))
        
        label.attributedText = attributedText
    }
    
    let indoorSerialNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
        label.numberOfLines = 0
        
        return label
    }()
    
    let indoorModelNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.tintColor = .black
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
    
    fileprivate func setupViews() {
        addSubview(indoorSerialNumberLabel)
        indoorSerialNumberLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(indoorModelNumberLabel)
        indoorModelNumberLabel.anchor(top: indoorSerialNumberLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: -8, width: nil, height: 20)
        
        addSubview(timeAgoLabel)
        timeAgoLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: -8, paddingRight: -8, width: nil, height: 12.5)
        
        let bottomSeperatorView = UIView()
        bottomSeperatorView.backgroundColor =  .black
        bottomSeperatorView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomSeperatorView)
        bottomSeperatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: nil, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
