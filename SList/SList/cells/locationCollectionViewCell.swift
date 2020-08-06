//
//  locationCollectionViewCell.swift
//  SList
//
//  Created by naga vineel golla on 8/3/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class locationCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "Cell"
    
    lazy var current : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Currently in walmart"
        listname.textColor = UIColor.black
        //listname.numberOfLines = 0
        //listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        return listname
    }()
    
    lazy var listitems : UILabel = {
           let listname = UILabel()
           listname.translatesAutoresizingMaskIntoConstraints = false

           listname.text = "24 Items"
           listname.textColor = UIColor.systemBlue
           //listname.numberOfLines = 0
           //listname.adjustsFontSizeToFitWidth = true
           listname.font = UIFont.boldSystemFont(ofSize:18)
           return listname
       }()
       
       lazy var listname: UILabel = {
          let shopname = UILabel()
           shopname.translatesAutoresizingMaskIntoConstraints = false
           
           shopname.text = "Grocery List"
           shopname.textColor = UIColor.black
           //shopname.numberOfLines = 0
           //shopname.adjustsFontSizeToFitWidth = true
           shopname.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
           return shopname
       }()
       
       lazy var time : UILabel = {
           let numberofitems = UILabel()
           
           numberofitems.translatesAutoresizingMaskIntoConstraints = false

           numberofitems.text = "closes in 1 hour"
           numberofitems.textColor = UIColor.black
           numberofitems.numberOfLines = 0
           numberofitems.adjustsFontSizeToFitWidth = true
           numberofitems.font = UIFont.systemFont(ofSize: 15)
           return numberofitems
           
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
        addSubview(progressBar)
        
        topstack.addArrangedSubview(current)
        topstack.addArrangedSubview(time)
        topstack.addArrangedSubview(listitems)
        topstack.addArrangedSubview(listname)
                
        // topstack.
        topstack.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        topstack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topstack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true

        topstack.setCustomSpacing(8, after: current)
        topstack.setCustomSpacing(14, after: time)
        topstack.setCustomSpacing(8, after: listitems)
        
        
        progressBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


