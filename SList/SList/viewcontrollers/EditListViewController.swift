//
//  EditListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/24/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

protocol editlist {
    func editedlist(listdata: ListData, index: Int?)
    func reload()
}

enum typelist {
    case numeric
    case Piece
    case Gallon
    case Dozen
    
}

class EditListViewController: UIViewController {

    
    var doneBtn:UIBarButtonItem = UIBarButtonItem()

    
    
    var listdata : ListData?
    var index: Int?

    let editView = EditListView()
    
    var selectedQuantityType: String?
    
    var delegate : editlist?

    
    
    var QuantityTypeList : [String]  = ["numeric","Piece","Gallon","Dozen"]
    //"Each","Bag","Bottle","Box","Case","Pack","Roll","Jar","Can","Bunch","Gram","Kg","litre","ml","lbs","qt","oz","cup","tbsp","tsp","pt"]
    
    var QuantityTypeIndexPath: IndexPath?

    
    
    override func viewWillAppear(_ animated: Bool) {
        setupnavbar()
        setupview()
        editView.tableView.delegate  = self
        editView.tableView.dataSource = self
 
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        checksavebtn()
        
    

    }
    
    func checksavebtn() {
        if (listdata?.listName.isEmpty)! {
            doneBtn.isEnabled = false
        }
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
            cell.itemname.text = listdata?.listName
            cell.itemname.tag = 10
            return cell
               
        }
        else if (indexPath.section == 1)
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Favorite2TableViewCell
            if(listdata?.star == true){
                cell.toggle.isOn = true
            }
            
            cell.toggle.addTarget(self, action: #selector(favorite), for: UIControl.Event.valueChanged)
            return cell
        }
        else if (indexPath.section == 2)
        {
            if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row == indexPath.row
            {
            let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath) as! pickerTableViewCell
                cell.picker.delegate = self
                cell.picker.dataSource = self
                
                cell.picker.selectRow(listdata?.Quantitytype ?? 0, inComponent: 0, animated: true)

            return cell
            }
            else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! QuatityTypeTableViewCell
                switch listdata?.Quantitytype {
                case 0:
                    cell.QuantityTypevalue.text = "numeric"
                case 1:
                    cell.QuantityTypevalue.text = "Piece"
                case 2:
                    cell.QuantityTypevalue.text = "Gallon"
                case 3:
                    cell.QuantityTypevalue.text = "Dozen"
                
                case .none:
                    cell.QuantityTypevalue.text = "numeric"
                case .some(_):
                    cell.QuantityTypevalue.text = "numeric"

                }
                return cell
            }
        }
        else if (indexPath.section == 3)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! QuantityValueTableViewCell
            cell.QuantityTypevalue.text = String(listdata!.quantityvalue)
            cell.decreaseButton.isEnabled = true
            cell.IncreaseButton.isEnabled = true

            
            if listdata?.quantityvalue == 1{
                cell.decreaseButton.isEnabled = false
            }
            
            if listdata?.quantityvalue == 100{
                cell.IncreaseButton.isEnabled = false
            }
            cell.IncreaseButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
            cell.decreaseButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)

            return cell
        }
        else if (indexPath.section == 4)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! PriorityTableViewCell
            cell.segmented.selectedSegmentIndex = listdata!.Priority
            cell.segmented.addTarget(self, action:  #selector(EditListViewController.indexChanged(_:)), for: .valueChanged)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! notesTableViewCell
        cell.notes.delegate = self
        cell.notes.text = listdata?.notes
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
    
    @objc func favorite(myswitch: UISwitch) {
        print("iop")
        switch myswitch.isOn {
        case true:
            self.listdata?.star = true
        case false:
            self.listdata?.star = false
        }
        
    }
    
    @objc func increase() {
        listdata?.quantityvalue += 1
        editView.tableView.reloadData()
    }
         
    @objc func decrease() {
        listdata?.quantityvalue -= 1
        editView.tableView.reloadData()

    }
    
   @objc func indexChanged(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
        listdata?.Priority = 0
        } else if sender.selectedSegmentIndex == 1 {
            listdata?.Priority = 1
        } else if sender.selectedSegmentIndex == 2 {
            listdata?.Priority = 2
        }else if sender.selectedSegmentIndex == 3 {
            listdata?.Priority = 3
        }
    }

}


extension EditListViewController {
    func setupnavbar() {
        
        let width = self.view.frame.width
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        navigationBar.backgroundColor = UIColor.white
                
        self.view.addSubview(navigationBar)
                 
        let navigationItem = UINavigationItem()
        //doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save))
        doneBtn = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(save1))

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
        delegate?.reload()
            dismiss(animated: true, completion: nil)

        }
    
    @objc func save1() {
              print("save")
          delegate?.editedlist(listdata: listdata!, index : index)
              dismiss(animated: true, completion: nil)
          }
    

}

extension EditListViewController: UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        listdata?.listName = textField.text!
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if(textField.text!.isEmpty){
            doneBtn.isEnabled = false
        }
        else{
            doneBtn.isEnabled = true
        }
        
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
            listdata?.notes = textView.text

            return false
        }
        return true
    }
    
}

extension EditListViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
   func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        QuantityTypeList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       let row = QuantityTypeList[row]
       return row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selected = QuantityTypeList[row]
        print("called")
        print(selected)
        switch selected {
         case "numeric":
             listdata?.Quantitytype = 0
         case "Piece":
             listdata?.Quantitytype = 1
         case "Gallon":
             listdata?.Quantitytype = 2
         case "Dozen":
             listdata?.Quantitytype = 3
        default:
            listdata?.Quantitytype = 0
        }
        editView.tableView.reloadData()
        //editView.tableView.reloadSections([3], with: .none)
    }
    
    
}







