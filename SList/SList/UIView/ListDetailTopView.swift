//
//  ListDetailView.swift
//  SList
//
//  Created by naga vineel golla on 8/1/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class ListDetailTopView: UIView {
    
    let priorityitems = ["All","completed","uncompleted"]

    
    lazy var segmented :UISegmentedControl = {
          let segmented = UISegmentedControl(items: priorityitems)
          segmented.translatesAutoresizingMaskIntoConstraints = false
          segmented.selectedSegmentIndex = 0
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.systemBlue], for: .selected)

          return segmented
      }()
    
    lazy var Title : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = "Trader Joe"
        Title.textColor = UIColor.black
        Title.numberOfLines = 0
        Title.adjustsFontSizeToFitWidth = true
        Title.font = UIFont(name: "ArialRoundedMTBold", size: 35)
        return Title
    }()
    
    lazy var address : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = "275 Folsom Ave, San Diego"
        Title.textColor = UIColor.systemGray
        Title.numberOfLines = 0
        Title.adjustsFontSizeToFitWidth = true
        Title.font = UIFont(name: "ArialRoundedMTBold", size: 13)
        return Title
    }()
    
    lazy var timestatus : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = "Live 9 AM:"
        Title.textColor = UIColor.systemBlue
        //Title.numberOfLines = 0
        //Title.adjustsFontSizeToFitWidth = true
        Title.font = UIFont(name: "ArialRoundedMTBold", size: 14)
        return Title
    }()
    
    lazy var busystatus : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = "  Not too busy"
        Title.textColor = UIColor.systemGray
        //Title.numberOfLines = 0
        Title.font = UIFont(name: "ArialRoundedMTBold", size: 14)
        return Title
    }()
    
    lazy var im : UIImageView = {
        let im = UIImageView()
        im.tintColor = UIColor.systemGray
        im.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 10.0, weight: .heavy, scale: .medium)
         let symbol = UIImage(systemName: "chevron.right", withConfiguration: symbolConfig)
        let lol = symbol
        im.image = lol
        
    
        return im
    }()
    
    lazy var space : UIView = {
        let space = UIView()
        space.translatesAutoresizingMaskIntoConstraints = false
        return space
    }()
    
    let topstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.backgroundColor = UIColor.white
        //stack.spacing = 10
        return stack
    }()
    
    let bottomstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fill
        //stack.spacing = 10
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

extension ListDetailTopView {
    
    func setupviews() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(topstack)
        
        //topstack.addArrangedSubview(Title)
        topstack.addArrangedSubview(address)
        topstack.addArrangedSubview(segmented)
        
        topstack.setCustomSpacing(10,after: address)
        
        
        //bottomstack.addArrangedSubview(timestatus)
        //bottomstack.addArrangedSubview(busystatus)
        //bottomstack.addArrangedSubview(im)
        //bottomstack.addArrangedSubview(space)

        
        //topstack.setCustomSpacing(2, after: Title)
        //topstack.setCustomSpacing(5, after: address)
        
        //bottomstack.setCustomSpacing(5, after: timestatus)
        
        //Title.heightAnchor.constraint(equalToConstant: 1).isActive = true
        //address.heightAnchor.constraint(equalToConstant: 10).isActive = true
        //bottomstack.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
//        timestatus.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        busystatus.widthAnchor.constraint(equalToConstant: 25).isActive = true
        //im.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        
        
        topstack.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        topstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        topstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        topstack.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
