//
//  EditMainViewController.swift
//  SList
//
//  Created by naga vineel golla on 8/5/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class EditMainViewController: UIViewController {
    
    let editmainview = EditMainListView()
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupnavbar()
        setupviews()
        
        editmainview.tableView.delegate  = self
        editmainview.tableView.dataSource = self
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

    }
    

}

extension EditMainViewController {
      func setupnavbar() {
            
            let width = self.view.frame.width
            let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
            navigationBar.backgroundColor = UIColor.white
                    
            self.view.addSubview(navigationBar)
                     
            let navigationItem = UINavigationItem()
            let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save1))
            
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(Cancel))
            //navigationItem.title = "Details"
            
            navigationItem.leftBarButtonItem = cancelBtn
            navigationItem.rightBarButtonItem = doneBtn
            navigationBar.setItems([navigationItem], animated: false)
    //      navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    //      navigationBar.shadowImage = UIImage()
            
            //navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 0)!]
        }
      
        @objc func Cancel() {
                print("cancel")
            //delegate?.reload()
                dismiss(animated: true, completion: nil)

            }
        
        @objc func save1() {
                  print("save")
              //delegate?.editedlist(listdata: listdata!, index : index)
                  dismiss(animated: true, completion: nil)
              }
}

extension EditMainViewController{
    func setupviews() {
        view.addSubview(editmainview)
        
        editmainview.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        editmainview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        editmainview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        editmainview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension EditMainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
