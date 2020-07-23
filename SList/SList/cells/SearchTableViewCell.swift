//
//  SearchTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/20/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit




class SearchTableViewCell: UITableViewCell {
    
    static var identifier: String = "cell4"
    
    lazy var Title : UILabel = {
        let Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = "Title"
        Title.textColor = UIColor.black
        Title.numberOfLines = 0
        Title.adjustsFontSizeToFitWidth = true
        Title.font = UIFont.boldSystemFont(ofSize:15)
        return Title
        
    }()
    
    lazy var SubTitle : UILabel = {
        let SubTitle = UILabel()
        SubTitle.translatesAutoresizingMaskIntoConstraints = false
        SubTitle.text = "SubTitle"
        SubTitle.textColor = UIColor.lightGray
        SubTitle.numberOfLines = 0
        SubTitle.adjustsFontSizeToFitWidth = true
        SubTitle.font = UIFont.boldSystemFont(ofSize:13)
        return SubTitle
    }()
    
    lazy var imageview : UIImageView = {
           let image = UIImageView(image: UIImage(systemName: "magnifyingglass"))
           
           image.translatesAutoresizingMaskIntoConstraints = false
           //image.contentMode = .scaleAspectFill
           image.tintColor = UIColor.systemBlue
           image.layer.cornerRadius = 8.0

           return image
       }()
    lazy var stack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupviews()
       }
    
    
    
    
    func setupviews(){
        addSubview(stack)
        addSubview(imageview)

        
        stack.addArrangedSubview(Title)
        stack.addArrangedSubview(SubTitle)
        
        imageview.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stack.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 10).isActive = true
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

