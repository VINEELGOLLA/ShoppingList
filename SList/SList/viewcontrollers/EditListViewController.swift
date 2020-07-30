//
//  EditListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/24/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController {

    let editView = EditListView()
    
    var selectedQuantityType: String?
    
    var QuantityTypeList : [String]  = ["numeric","Piece","Gallon","Dozen","Each","Bag","Bottle","Box","Case","Pack","Roll","Jar","Can","Bunch","Gram","Kg","litre","ml","lbs","qt","oz","cup","tbsp","tsp","pt"]
    
    var QuantityTypeIndexPath: IndexPath?

    
    
    override func viewWillAppear(_ animated: Bool) {
        setupnavbar()
        setupview()
        editView.tableView.delegate  = self
        editView.tableView.dataSource = self
 
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    


}

extension EditListViewController {
    func setupview() {
        
        view.addSubview(editView)
        
        editView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        editView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        editView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        editView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension EditListViewController: UITableViewDelegate, UITableViewDataSource{
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        if QuantityTypeIndexPath != nil && section == 2 {
            return 2
        }
        return 1
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! listNameTableViewCell
            cell.contentView.backgroundColor = UIColor.white
            cell.itemname.delegate = self
            return cell
               
        }
        else if (indexPath.section == 1)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Favorite2TableViewCell
            return cell
        }
        else if (indexPath.section == 2)
        {
            if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row == indexPath.row
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath) as! pickerTableViewCell
            return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! QuatityTypeTableViewCell
                return cell
            }
        }
        else if (indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! QuantityValueTableViewCell
            return cell
        }
        else if (indexPath.section == 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! PriorityTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! notesTableViewCell
        cell.notes.delegate = self
        return cell
           
       }
       
       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 4 {
            return 88
        }
        
           if indexPath.section == 5{
               return 250
           }
           
            if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row == indexPath.row {
                return 200
            }
           return 68
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
         
           switch indexPath.section {
           case 2:
               tableView.beginUpdates()

               if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row - 1 == indexPath.row { // case 2
                   tableView.deleteRows(at: [QuantityTypeIndexPath!], with: .fade)
                   QuantityTypeIndexPath = nil
               } else { // case 1、3
                   if QuantityTypeIndexPath != nil { // case 3
                       tableView.deleteRows(at: [QuantityTypeIndexPath!], with: .fade)
                   }
                   QuantityTypeIndexPath = calculateDatePickerIndexPath(indexPathSelected: indexPath, section: 2)
                   tableView.insertRows(at: [QuantityTypeIndexPath!], with: .fade)
               }
               tableView.deselectRow(at: indexPath, animated: true)
               tableView.endUpdates()
    
           default:
               tableView.beginUpdates()

               if QuantityTypeIndexPath != nil { // case 2
                     tableView.deleteRows(at: [QuantityTypeIndexPath!], with: .fade)
                     QuantityTypeIndexPath = nil
               }
               tableView.deselectRow(at: indexPath, animated: true)

               tableView.endUpdates()

           }
       
       }
       
       func calculateDatePickerIndexPath(indexPathSelected: IndexPath, section: Int) -> IndexPath {
           if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row  < indexPathSelected.row { // case 3.2
               return IndexPath(row: indexPathSelected.row, section: section)
           } else { // case 1、3.1
               return IndexPath(row: indexPathSelected.row + 1, section: section)
           }
       }
    
    @objc func tapDone(sender: Any) {
           self.view.endEditing(true)
       }
}


extension EditListViewController {
    func setupnavbar() {
        
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        navigationBar.backgroundColor = UIColor.white
                
        self.view.addSubview(navigationBar)
                 
        let navigationItem = UINavigationItem()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save))
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(Cancel))
        //navigationItem.title = ""
        
        navigationItem.leftBarButtonItem = cancelBtn
        navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
//      navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//      navigationBar.shadowImage = UIImage()
        
        //navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 12)!]

    }
    
    @objc func save() {
            print("save")
            dismiss(animated: true, completion: nil)
        }
        
    @objc func Cancel() {
            print("cancel")

            dismiss(animated: true, completion: nil)

        }
    

}

extension EditListViewController: UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension EditListViewController: UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}







