//
//  EditListView.swift
//  SList
//
//  Created by naga vineel golla on 7/28/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import UIKit

class EditListView: UIView {
    
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

extension EditListView {
    func setupviews() {
      
         self.addSubview(tableView)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
          
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        tableView.register(listNameTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(Favorite2TableViewCell.self, forCellReuseIdentifier: "Cell1")
        tableView.register(QuatityTypeTableViewCell.self, forCellReuseIdentifier: "Cell2")
        tableView.register(QuantityValueTableViewCell.self, forCellReuseIdentifier: "Cell3")
        tableView.register(PriorityTableViewCell.self, forCellReuseIdentifier: "Cell4")
        tableView.register(notesTableViewCell.self, forCellReuseIdentifier: "Cell5")
        tableView.register(pickerTableViewCell.self, forCellReuseIdentifier: "picker")

              
        tableView.separatorColor = UIColor.opaqueSeparator
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        

              
        tableView.tableFooterView = UIView()
      }
}



