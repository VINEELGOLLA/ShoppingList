//
//  EditListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/24/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
    let editView = EditListView()
    
    var selectedQuantityType: String?
    
    var QuantityTypeList : [String]  = ["numeric","Piece","Gallon","Dozen","Each","Bag","Bottle","Box","Case","Pack","Roll","Jar","Can","Bunch","Gram","Kg","litre","ml","lbs","qt","oz","cup","tbsp","tsp","pt"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        editView.tableView.delegate  = self
        editView.tableView.delegate = self
        setupnavbar()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(editView)
        
        editView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        editView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        editView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        editView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }

    
    

    

}


extension EditListViewController {
    func setupnavbar() {
        let width = self.view.frame.width
                
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        navigationBar.backgroundColor = UIColor.white
                
        self.view.addSubview(navigationBar)
                
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "star", withConfiguration: symbolConfig)
                
        let button = UIButton.init(type: .custom)
        button.setImage(symbol, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(lol), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        let barButton = UIBarButtonItem(customView: button)

                
        let navigationItem = UINavigationItem()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: nil, action: #selector(Done))
        //let cancelBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: nil, action: #selector(Cancel))
        navigationItem.rightBarButtonItem = doneBtn
        navigationItem.title = "Edit"
        //navigationItem.leftBarButtonItem = barButton
        navigationBar.setItems([navigationItem], animated: false)
        
//        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationBar.shadowImage = UIImage()
        
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 12)!]

    }
    
    @objc func lol() {
        
    }
    
    @objc func Done() {
        
    }
}






