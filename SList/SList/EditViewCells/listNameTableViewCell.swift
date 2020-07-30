//
//  listNameTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class listNameTableViewCell: UITableViewCell {

  static var identifier: String = "Cell"
    
    lazy var itemnamelabel : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Itemname"
        listname.textColor = UIColor.black
        listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return listname
    }()
    
    lazy var line : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.opaqueSeparator
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    lazy var itemname : UITextField = {
        let itemname = UITextField()
        itemname.translatesAutoresizingMaskIntoConstraints = false
        itemname.keyboardType = .default
        itemname.returnKeyType = .done
        itemname.font = UIFont.systemFont(ofSize: 18)
        itemname.clearButtonMode = UITextField.ViewMode.whileEditing;
        itemname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        itemname.borderStyle = .none
        itemname.backgroundColor = UIColor.white
        itemname.placeholder = "Enter item name"
        itemname.text = "item1"
        itemname.textColor = UIColor.black
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: itemname.frame.height - 2, width: itemname.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        itemname.layer.addSublayer(bottomLine)
        return itemname
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        //self.addSubview(itemname)
        
        
        let stackView = UIStackView(arrangedSubviews: [itemnamelabel,line,itemname])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        
        addSubview(stackView)
        
        stackView.setCustomSpacing(5, after: itemnamelabel)
        stackView.setCustomSpacing(5, after: line)
        
//        itemname.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        itemname.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
//        itemname.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        itemname.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        itemnamelabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        line.widthAnchor.constraint(equalToConstant: 2).isActive = true
        
        
        
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
    }

}
