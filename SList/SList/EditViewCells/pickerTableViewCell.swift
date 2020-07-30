//
//  pickerTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class pickerTableViewCell: UITableViewCell, UIPickerViewDelegate,UIPickerViewDataSource {

    var QuantityTypeList : [String]  = ["numeric","Piece","Gallon","Dozen","Each","Bag","Bottle","Box","Case","Pack","Roll","Jar","Can","Bunch","Gram","Kg","litre","ml","lbs","qt","oz","cup","tbsp","tsp","pt"]
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         QuantityTypeList.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = QuantityTypeList[row]
        return row
     }
     
     static var identifier: String = "Cell"
     

     
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
         self.addSubview(picker)
         
         picker.delegate = self
         picker.dataSource = self
         
    
         picker.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
         picker.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
     }

}
