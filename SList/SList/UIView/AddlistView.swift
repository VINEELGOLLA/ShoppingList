//
//  AddlistView.swift
//  SList
//
//  Created by naga vineel golla on 8/1/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import Foundation


class AddlistView: UIView {

    
    
    
    lazy var ListName : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.whileEditing;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.borderStyle = .none
        namefield.backgroundColor = UIColor.white
        namefield.placeholder = "Name"
        namefield.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 249/255, alpha: 1)
        namefield.layer.cornerRadius = 15
         namefield.font = UIFont(name: "ArialRoundedMTBold", size: 15)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: namefield.frame.height))

        namefield.leftView = paddingView
        namefield.leftViewMode = UITextField.ViewMode.always
    

        namefield.tag = 3
        
        return namefield
    }()
    
    
    lazy var Location : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.placeholder = "Location (Optional)"
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.never;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.borderStyle = .none
        namefield.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 249/255, alpha: 1)
        namefield.layer.cornerRadius = 15
        namefield.font = UIFont(name: "ArialRoundedMTBold", size: 15)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: namefield.frame.height))
        namefield.leftView = paddingView
        namefield.leftViewMode = UITextField.ViewMode.always
        namefield.tag = 2
        
        return namefield
    }()
    
    lazy var plusbtn : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)

        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .heavy, scale: .medium)
        let symbol = UIImage(systemName: "plus.circle.fill", withConfiguration: symbolConfig)
        btn.setImage(symbol, for: .normal)
        return btn
    }()
    
 

    let topstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()

  override init(frame: CGRect) {
    super.init(frame: frame)
       
       self.backgroundColor = UIColor.white


       setupviews()
    

       
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}

extension AddlistView {
    func setupviews() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(topstack)
        
        topstack.addArrangedSubview(ListName)
        topstack.addArrangedSubview(Location)
        
        topstack.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        topstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        topstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        topstack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //topstack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        //iconTextField.tintColor = UIColor.lightGray
        //Location.setIcon(image: "plus.circle.fill")
     
        
        Location.rightView = plusbtn
        Location.rightViewMode = .always
        
    }
    
    func animate() {
        
        
        UIView.animate(withDuration: 1 / 3, delay: 0, options: .curveEaseIn,
                       animations: {
                        self.plusbtn.transform = CGAffineTransform( rotationAngle: .pi / 4 )
                        
                        self.layoutIfNeeded()
        })
        
        
    }

}

extension AddlistView {
//    @objc func plus(){
//
//    }
    
}


extension UITextField {
func setIcon(image : String) {
    
    let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .heavy, scale: .medium)
    let symbol = UIImage(systemName: image, withConfiguration: symbolConfig)
    let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 2, width: 25, height: 25))
    iconView.image = symbol
    let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 30, y: 0, width: 45, height: 30))
    iconContainerView.addSubview(iconView)
    rightView = iconContainerView
    rightViewMode = .always
}
    
    
    
}



