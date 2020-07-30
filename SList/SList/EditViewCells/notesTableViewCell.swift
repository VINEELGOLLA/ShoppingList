//
//  notesTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 7/29/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class notesTableViewCell: UITableViewCell {

    static var identifier: String = "Cell"
       
       lazy var noteslabel : UILabel = {
           let listname = UILabel()
           listname.translatesAutoresizingMaskIntoConstraints = false

           listname.text = "notes"
           listname.textColor = UIColor.black
           listname.numberOfLines = 0
           listname.adjustsFontSizeToFitWidth = true
           listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
           return listname
       }()
       

       lazy var notes : UITextView = {
            let listname = UITextView()
            listname.translatesAutoresizingMaskIntoConstraints = false
            //listname.text = "notes"
           listname.textColor = UIColor.lightGray
        

            listname.font = UIFont.systemFont(ofSize: 18)
            return listname
        }()
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupviews()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func setupviews()  {
           
           
           let stackView = UIStackView(arrangedSubviews: [noteslabel,notes])
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.distribution = .equalSpacing
           stackView.axis = .vertical
           stackView.spacing = 10
           addSubview(stackView)
           
           stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
           stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
           stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
           notes.heightAnchor.constraint(equalToConstant: 400).isActive = true
       }

}
