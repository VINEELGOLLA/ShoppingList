//
//  AddList2TableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/23/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

protocol AddListaddNewItem {
    func editextdone(listname: String)
}

class AddList2TableViewCell: UITableViewCell {

    static var identifier: String = "Cell"
    
            
    var index : IndexPath?
    
    var delegate : AddListaddNewItem?
            
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .ultraLight, scale: .medium)
        let symbol = UIImage(systemName: "circle", withConfiguration: symbolConfig)
        
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.setImage(symbol, for: .normal)
        checkbox.tintColor = UIColor.lightGray
        return checkbox
    }()
    
    lazy var edittext : UITextField = {
        let edittext = UITextField()
        edittext.translatesAutoresizingMaskIntoConstraints = false
        edittext.placeholder = ""
        edittext.borderStyle = .none
        return edittext
    }()

            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                  
        setupviews()

    }
    
    override func prepareForReuse() {
        edittext.text = ""
    }
    
    func setupviews() {
        
        addSubview(checkbox)
        addSubview(edittext)
        
        
        checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkbox.widthAnchor.constraint(equalToConstant: 40).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkbox.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)

        //checkbox.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

        
        edittext.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 9).isActive = true
        edittext.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        edittext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        edittext.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //edittext.text = ""
        
        edittext.returnKeyType = .done
        edittext.delegate = self
        //edittext.becomeFirstResponder()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
            
}

extension AddList2TableViewCell: UITextFieldDelegate{


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        print("kishore")
        textField.resignFirstResponder()

        delegate?.editextdone(listname: textField.text ?? "")
        self.edittext.text = ""
        return true
    }

}



