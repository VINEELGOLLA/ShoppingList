//
//  ViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var safeArea: UILayoutGuide!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        safeArea = view.layoutMarginsGuide
        
        setuptableview()
        
        setupnavigaionitems()
    }
    
    func setupnavigaionitems() {
          
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
          navigationItem.title = "ShoppingList"
          
          //navigationItem.largeTitleDisplayMode = .always
          navigationController?.navigationBar.prefersLargeTitles = true
          
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
          
          let searchController = UISearchController(searchResultsController: nil)
          searchController.obscuresBackgroundDuringPresentation = false
          searchController.searchBar.placeholder = "Search lists"
          self.navigationItem.searchController = searchController
          self.definesPresentationContext = true
      }
    
    func setuptableview() {
         
         view.addSubview(tableView)
         tableView.translatesAutoresizingMaskIntoConstraints = false
         
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         
         tableView.frame = self.view.frame
         tableView.backgroundColor = UIColor.white
         tableView.delegate = self
         tableView.dataSource = self
         tableView.separatorColor = UIColor.clear
         self.view.addSubview(tableView)
         
         tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "Cell")
         tableView.separatorColor = UIColor.gray
     }
    
    @objc func addTapped() {
        
        let addlist = AddListViewController()
        navigationController?.pushViewController(addlist, animated: true)

    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
