//
//  FavoriteTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class Favorite2TableViewCell: UITableViewCell {

  static var identifier: String = "Cell"

    lazy var listname : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false
        listname.text = "Favorite"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return listname
    }()
    
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "star", withConfiguration: symbolConfig)
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.setImage(symbol, for: .normal)
        checkbox.tintColor = UIColor.lightGray
        return checkbox
    }()
    
    lazy var toggle : UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.layer.cornerRadius = 16
        toggle.layer.masksToBounds = true
    toggle.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)

        return toggle
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(listname)
        //self.addSubview(checkbox)
        self.addSubview(toggle)
        
        listname.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        listname.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
//        checkbox.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
//        checkbox.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true
        
        toggle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        toggle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true

        
    }
    

}
