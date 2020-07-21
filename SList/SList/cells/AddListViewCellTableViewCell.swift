//
//  AddListViewCellTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class AddListViewCellTableViewCell: UITableViewCell {
    
    static var identifier: String = "Cell"
        
    var index : IndexPath?
    
    lazy var ItemValue : UILabel = {
        
        let ItemValue = UILabel()
        ItemValue.text = "1x"
        ItemValue.textColor = UIColor.black
        ItemValue.numberOfLines = 0
        ItemValue.textAlignment = .left
        ItemValue.font = UIFont.boldSystemFont(ofSize:12)
        //ItemValue.translatesAutoresizingMaskIntoConstraints = false
        return ItemValue
        
    }()
        
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        //checkbox.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "circle")
        checkbox.setImage(image, for: .normal)
        return checkbox
    }()
        
        
    lazy var itemtext : UILabel = {
        let itemtext = UILabel()
        //itemtext.translatesAutoresizingMaskIntoConstraints = false
        itemtext.text = "ice cream"
        itemtext.textColor = UIColor.black
        itemtext.numberOfLines = 0
        //itemtext.adjustsFontSizeToFitWidth = true
        itemtext.textAlignment = .left
        itemtext.font = UIFont.boldSystemFont(ofSize:12)
        return itemtext
    }()
        
    lazy var itemvalue : UILabel = {
        let itemvalue = UILabel()
        itemvalue.translatesAutoresizingMaskIntoConstraints = false
        itemvalue.text = "1"
        itemvalue.textColor = UIColor.black
        itemvalue.numberOfLines = 0
        //itemtext.adjustsFontSizeToFitWidth = true
        itemvalue.textAlignment = .right
        itemvalue.font = UIFont.boldSystemFont(ofSize:12)
        return itemvalue
    }()
        
    let topstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
            
        stack.contentMode = .scaleToFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
              
            setupviews()
    }
        
    func setupviews() {
        addSubview(topstack)
            
        topstack.addArrangedSubview(checkbox)
        topstack.addArrangedSubview(ItemValue)
        topstack.addArrangedSubview(itemtext)
            

            
        // topstack.
        topstack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topstack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topstack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        topstack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            
        checkbox.leadingAnchor.constraint(equalTo: topstack.leadingAnchor, constant: 5).isActive = true
        checkbox.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
        ItemValue.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 10).isActive = true
        ItemValue.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
        topstack.setCustomSpacing(10, after: checkbox)
        topstack.setCustomSpacing(10, after: ItemValue)
        //topstack.setCustomSpacing(5, after: itemtext)
            
            
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        
        

        
        
        
}

