//
//  mainbottomView.swift
//  SList
//
//  Created by naga vineel golla on 8/3/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class mainbottomView: UIView {
    
    let tableView = UICollectionView()
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        
          
            self.backgroundColor = UIColor.white

            setupviews()

        }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}


extension mainbottomView{
    func setupviews() {
        self.addSubview(tableView)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        tableView.register(HomeTableViewCell.self, forCellWithReuseIdentifier: "Cell")

    }
}
