//
//  QuantityValueTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class QuantityValueTableViewCell: UITableViewCell {

    static var identifier: String = "Cell"
    
    
    lazy var QuantityType : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Quantity Value"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return listname
    }()
    
    
    lazy var QuantityTypevalue : UILabel = {
         let listname = UILabel()
         listname.translatesAutoresizingMaskIntoConstraints = false

         listname.text = "1000"
         listname.textColor = UIColor.black
         listname.numberOfLines = 0
         listname.font = UIFont.systemFont(ofSize: 18)
        listname.textAlignment = .center
        listname.numberOfLines = 1
         return listname
     }()
    
    let decreaseButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "minus.circle", withConfiguration: symbolConfig)
        btn.setImage(symbol, for: .normal)
        return btn
    }()
    
    
    let IncreaseButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "plus.circle", withConfiguration: symbolConfig)
        btn.setImage(symbol, for: .normal)
        return btn
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
        //self.addSubview(QuantityTypevalue)
        
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton,QuantityTypevalue,IncreaseButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        self.addSubview(stackView)
        
        decreaseButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        IncreaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)

        
        
        QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        QuantityTypevalue.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        

    }

}

extension QuantityValueTableViewCell {
    @objc func increase(){
        
    }
    
    @objc func decrease(){
           
    }
}
