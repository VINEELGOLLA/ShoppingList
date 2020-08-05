//
//  HomeTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class HomeTableViewCell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    lazy var listname : UILabel = {
           let listname = UILabel()
           listname.translatesAutoresizingMaskIntoConstraints = false

           listname.text = "List1"
           listname.textColor = UIColor.black
           listname.numberOfLines = 0
           listname.adjustsFontSizeToFitWidth = true
           listname.font = UIFont.boldSystemFont(ofSize:18)
           return listname
       }()
       
       lazy var shopname: UILabel = {
          let shopname = UILabel()
           shopname.translatesAutoresizingMaskIntoConstraints = false
           
           shopname.text = "Reminder set for Walmart Supercenter"
           shopname.textColor = UIColor.systemBlue
           shopname.numberOfLines = 0
           shopname.adjustsFontSizeToFitWidth = true
           shopname.font = UIFont.systemFont(ofSize: 12)
           return shopname
       }()
       
       lazy var numberofitems : UILabel = {
           let numberofitems = UILabel()
           
           numberofitems.translatesAutoresizingMaskIntoConstraints = false

           numberofitems.text = "2 pending items"
           numberofitems.textColor = UIColor.gray
           numberofitems.numberOfLines = 0
           numberofitems.adjustsFontSizeToFitWidth = true
           numberofitems.font = UIFont.systemFont(ofSize: 15)
           return numberofitems
           
       }()
    
    lazy var image1 : UIImageView = {
        let image1 = UIImageView()
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.image = UIImage(systemName: "chevron.right")
        image1.tintColor = UIColor.gray
        return image1
    }()
    
    let topstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        //stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let progressBar : CircularProgress = {
        let prog = CircularProgress(frame: CGRect(x: 0.0, y: 4.0, width: 50.0, height: 50.0))
        prog.progressColor = UIColor.systemBlue
        prog.trackColor = UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 0.5)
        prog.tag = 101
        prog.setProgressWithAnimation(duration: 2, value: 0.7)
        
        prog.translatesAutoresizingMaskIntoConstraints = false

        return prog
    }()
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        setupviews()
    }
    
    
    func setupviews() {
        addSubview(topstack)
        addSubview(image1)
        addSubview(progressBar)
        
        topstack.addArrangedSubview(listname)
        topstack.addArrangedSubview(shopname)
        topstack.addArrangedSubview(numberofitems)
        
        topstack.backgroundColor = UIColor.white
                
        // topstack.
        topstack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topstack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        topstack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        //topstack.trailingAnchor.constraint(equalTo: progressBar.leadingAnchor, constant: -30).isActive = true

        topstack.setCustomSpacing(10, after: listname)
        topstack.setCustomSpacing(10, after: shopname)
        
        image1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        image1.widthAnchor.constraint(equalToConstant: 13).isActive = true
        image1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        progressBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: image1.leadingAnchor, constant: -20).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

