//
//  ListDetailBottomView.swift
//  SList
//
//  Created by naga vineel golla on 8/1/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class ListDetailBottomView: UIView {
    
//    let screenSize = UIScreen.main.bounds
//    let screenHeight = screenSize.height
//    let screenWidth = screenSize.width
//

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

extension ListDetailBottomView{
    func setupviews() {
        self.addSubview(tableView)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        tableView.register(AddListViewCellTableViewCell.self, forCellReuseIdentifier: "Cell2")
        
        tableView.separatorColor = UIColor.gray
        tableView.sectionIndexBackgroundColor = UIColor.white
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
        
        tableView.tableFooterView = UIView()

        
        
    }
}
