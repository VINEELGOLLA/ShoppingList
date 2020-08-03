//
//  AddList2TableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/23/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

protocol AddList2protocol {
    
    func mark()
    func unmark()
    
    func listname(name: String)
    
    func finallistname(name: String)

}

class AddList2TableViewCell: UITableViewCell {

    static var identifier: String = "Cell"
    
    var listname: String?
    
            
    //var index : IndexPath?
    
    var delegate : AddList2protocol?
            
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
        
        
        checkbox.addTarget(self, action: #selector(checkboxpressed), for: .touchUpInside)

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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.listname(name: textField.text ?? "")
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        delegate?.finallistname(name: textField.text ?? "")
//        return true
//    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        delegate?.finallistname(name: textField.text ?? "")
        self.edittext.text = ""
        return true
    }

}

extension AddList2TableViewCell{
    @objc func checkboxpressed(){
        //let mark = UIImage(systemName: "checkmark.circle.fill")
        //let unmark = UIImage(systemName: "circle")
        
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .ultraLight, scale: .medium)
        let mark = UIImage(systemName: "largecircle.fill.circle", withConfiguration: symbolConfig)
        
        if self.checkbox.currentImage == mark {
            animate(ismarked: true)
            delegate?.unmark()
        }
        else
        {
            animate(ismarked: false)
            delegate?.mark()
        }
    }
    
    func animate(ismarked: Bool) {
        
        //let mark = UIImage(systemName: "checkmark.circle.fill")
        //let unmark = UIImage(systemName: "circle")
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .ultraLight, scale: .medium)
        let mark = UIImage(systemName: "largecircle.fill.circle", withConfiguration: symbolConfig)
        let unmark = UIImage(systemName: "circle", withConfiguration: symbolConfig)

        
        let unmarkscale: CGFloat = 0.7
        let markscale: CGFloat = 1.3
        
        UIView.animate(withDuration: 0.1, animations: {
            let newImage = ismarked ? unmark : mark
            let newScale = ismarked ? unmarkscale : markscale
            self.checkbox.transform = self.checkbox.transform.scaledBy(x: newScale, y: newScale)
            self.checkbox.setImage(newImage, for: .normal)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.checkbox.transform = CGAffineTransform.identity
        })
      })
    }
}




