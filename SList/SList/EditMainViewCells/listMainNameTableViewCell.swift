//
//  listMainNameTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 8/5/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class listMainNameTableViewCell: UITableViewCell {
    static var identifier: String = "Cell"
    
    lazy var itemname : UITextField = {
        let itemname = UITextField()
        itemname.translatesAutoresizingMaskIntoConstraints = false
        itemname.keyboardType = .default
        itemname.returnKeyType = .done
        itemname.font = UIFont.systemFont(ofSize: 18)
        itemname.clearButtonMode = UITextField.ViewMode.whileEditing;
        itemname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        itemname.borderStyle = .none
        itemname.backgroundColor = UIColor.placeholderText
        //itemname.placeholder = "List1"
        itemname.text = "List1"
        itemname.textColor = UIColor.black
        itemname.layer.cornerRadius = 10
    
        itemname.textAlignment = .center
        //var bottomLine = CALayer()
        //bottomLine.frame = CGRect(x: 0, y: itemname.frame.height - 2, width: itemname.frame.width, height: 2)
        //bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        //itemname.layer.addSublayer(bottomLine)
        return itemname
    }()

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupviews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}

extension listMainNameTableViewCell{
    func setupviews()  {
        self.addSubview(itemname)
        
        itemname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        itemname.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        itemname.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        itemname.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
