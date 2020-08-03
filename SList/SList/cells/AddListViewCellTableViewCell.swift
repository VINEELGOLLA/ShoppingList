//
//  AddListViewCellTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

protocol AddListMarkprotocol{
    
    func mark(index: Int)
    func unmark(index: Int)
    func itemname(name: String, index: Int?)
}

class AddListViewCellTableViewCell: UITableViewCell {
    
    static var identifier: String = "Cell"
        
    var index : Int?
    
    var delegate : AddListMarkprotocol?
    
    var listname : String?
    
    lazy var ItemValue : UILabel = {
        let ItemValue = UILabel()
        ItemValue.text = "1x"
        ItemValue.textColor = UIColor.black
        ItemValue.numberOfLines = 0
        ItemValue.textAlignment = .center
        ItemValue.font = .systemFont(ofSize: 18)
        ItemValue.translatesAutoresizingMaskIntoConstraints = false
        return ItemValue
        
    }()
        
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .ultraLight, scale: .medium)
        let symbol = UIImage(systemName: "circle", withConfiguration: symbolConfig)
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        //let image = UIImage(systemName: "circle")
        checkbox.setImage(symbol, for: .normal)
        return checkbox
    }()
        
        
      lazy var itemtext : UITextField = {
         let edittext = UITextField()
         edittext.translatesAutoresizingMaskIntoConstraints = false
         edittext.placeholder = ""
         edittext.borderStyle = .none
         edittext.font = .systemFont(ofSize: 18)
         edittext.textAlignment = .left
         return edittext
     }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
              
            setupviews()
    }
        
    func setupviews() {
        addSubview(checkbox)
        //addSubview(ItemValue)
        addSubview(itemtext)
            
        checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        checkbox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkbox.widthAnchor.constraint(equalToConstant: 40).isActive = true
        checkbox.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkbox.imageEdgeInsets = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
        //checkbox.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            
//        ItemValue.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 0).isActive = true
//        ItemValue.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        ItemValue.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        ItemValue.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        itemtext.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: 5).isActive = true
        itemtext.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        itemtext.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        itemtext.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        itemtext.delegate = self
        
        checkbox.addTarget(self, action: #selector(checkboxpressed), for: .touchUpInside)

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension AddListViewCellTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.accessoryType = .detailButton
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.accessoryType = .none
        
        textField.resignFirstResponder()

        listname = textField.text


        delegate?.itemname(name: listname ?? "", index: index!)

        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        listname = textField.text
    }
}

extension AddListViewCellTableViewCell{
    @objc func checkboxpressed(){
        //let mark = UIImage(systemName: "checkmark.circle.fill")
        //let unmark = UIImage(systemName: "circle")
        
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .ultraLight, scale: .medium)
        let mark = UIImage(systemName: "largecircle.fill.circle", withConfiguration: symbolConfig)
        
        if self.checkbox.currentImage == mark {
            animate(ismarked: true)
            delegate?.unmark(index: index!)
        }
        else
        {
            animate(ismarked: false)
            delegate?.mark(index: index!)
        }
    }
    
    func animate(ismarked: Bool) {
        print("asdfg")
        
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
