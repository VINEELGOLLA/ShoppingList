//
//  locationTableViewCell.swift
//  SList
//
//  Created by naga vineel golla on 8/5/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import MapKit

class locationTableViewCell: UITableViewCell {
    
    lazy var mapview : MKMapView = {
        let mapview = MKMapView()
        mapview.mapType = MKMapType.standard
        mapview.isZoomEnabled = false
        mapview.isScrollEnabled = false
        return mapview
    }()
    
    
    lazy var locationlabel : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "location set to Walmart"
        listname.textColor = UIColor.black
        listname.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return listname
    }()
    
    
    


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
           setupviews()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}

extension locationTableViewCell {
    func setupviews() {
        
        let stackView = UIStackView(arrangedSubviews: [mapview,locationlabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        

    }

}
