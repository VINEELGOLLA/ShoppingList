//
//  QuatityTypeTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class QuatityTypeTableViewCell: UITableViewCell {

    static var identifier: String = "Cell"
       
       
       lazy var QuantityType : UILabel = {
           let listname = UILabel()
           listname.translatesAutoresizingMaskIntoConstraints = false

           listname.text = "Quantity Type"
           listname.textColor = UIColor.black
           listname.numberOfLines = 0
           listname.adjustsFontSizeToFitWidth = true
           listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
           return listname
       }()
       
       lazy var QuantityTypevalue : UILabel = {
            let listname = UILabel()
            listname.translatesAutoresizingMaskIntoConstraints = false

            listname.text = "numeric"
            listname.textColor = UIColor.black
            listname.numberOfLines = 0
            listname.adjustsFontSizeToFitWidth = true
            listname.font = UIFont.systemFont(ofSize: 18)
            return listname
        }()
       
       lazy var picker : UIPickerView = {
          let picker = UIPickerView()
           picker.translatesAutoresizingMaskIntoConstraints = false
           
           return picker
       }()
       
       
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupviews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func setupviews()  {
           self.addSubview(QuantityType)
           self.addSubview(QuantityTypevalue)
           
           
           QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

           QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
           
           QuantityTypevalue.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

           QuantityTypevalue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
           
           
       }

}
