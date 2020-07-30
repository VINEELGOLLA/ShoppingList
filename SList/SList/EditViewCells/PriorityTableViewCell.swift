//
//  PriorityTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class PriorityTableViewCell: UITableViewCell {

 static var identifier: String = "Cell"
    
    let priorityitems = ["None","High","Medium","Low"]
    
    
    lazy var QuantityType : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Priority"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return listname
    }()
    
    
    lazy var QuantityTypevalue : UILabel = {
         let listname = UILabel()
         listname.translatesAutoresizingMaskIntoConstraints = false

         listname.text = "None"
         listname.textColor = UIColor.black
         listname.numberOfLines = 0
         listname.adjustsFontSizeToFitWidth = true
         listname.font = UIFont.systemFont(ofSize: 18)
         return listname
     }()
    
    lazy var segmented :UISegmentedControl = {
        let segmented = UISegmentedControl(items: priorityitems)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        return segmented
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        //self.addSubview(QuantityType)
        //self.addSubview(QuantityTypevalue)
        //self.addSubview(segmented)
        
        let stackView = UIStackView(arrangedSubviews: [QuantityType,segmented])
               stackView.translatesAutoresizingMaskIntoConstraints = false
               stackView.distribution = .equalSpacing
               stackView.axis = .vertical
               stackView.spacing = 20
               addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        
//        QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//
//        QuantityTypevalue.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        QuantityTypevalue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true

    }

}
