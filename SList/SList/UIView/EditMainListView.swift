//
//  EditMainListView.swift
//  SList
//
//  Created by naga vineel golla on 8/5/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class EditMainListView: UIView {
        //var QuantityTypeIndexPath: IndexPath?

        let tableView = UITableView()

        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = UIColor.white


            setupviews()
            
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
    }

    extension EditMainListView {
        func setupviews() {
          
             self.addSubview(tableView)
            
            self.translatesAutoresizingMaskIntoConstraints = false
            self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            
            tableView.register(listMainNameTableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.register(locationTableViewCell.self, forCellReuseIdentifier: "location")

            tableView.separatorColor = UIColor.white
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
            tableView.tableFooterView = UIView()
          }
    }
