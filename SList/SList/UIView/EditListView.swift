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
    
    var QuantityTypeIndexPath: IndexPath?

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
        
        tableView.register(listname.self, forCellReuseIdentifier: "Cell")
        tableView.register(Favorite.self, forCellReuseIdentifier: "Cell1")
        tableView.register(quantity.self, forCellReuseIdentifier: "Cell2")
        tableView.register(quantityValue.self, forCellReuseIdentifier: "Cell3")
        tableView.register(priority.self, forCellReuseIdentifier: "Cell4")
        tableView.register(notes.self, forCellReuseIdentifier: "Cell5")
        tableView.register(picker.self, forCellReuseIdentifier: "picker")

              
        tableView.separatorColor = UIColor.opaqueSeparator
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        tableView.delegate = self
        tableView.dataSource = self
              
        tableView.tableFooterView = UIView()
      }
}

class listname : UITableViewCell{
    
    static var identifier: String = "Cell"

    lazy var itemname : UITextField = {
        let itemname = UITextField()
        itemname.translatesAutoresizingMaskIntoConstraints = false
        itemname.keyboardType = .default
        itemname.returnKeyType = .done
        itemname.font = UIFont.systemFont(ofSize: 18)
        itemname.clearButtonMode = UITextField.ViewMode.whileEditing;
        itemname.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        itemname.borderStyle = .none
        itemname.backgroundColor = UIColor.white
        itemname.placeholder = "Name"
        itemname.text = "item1"
        itemname.textColor = UIColor.black
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: itemname.frame.height - 2, width: itemname.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        itemname.layer.addSublayer(bottomLine)
        return itemname
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(itemname)
        
        itemname.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        itemname.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        itemname.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        itemname.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}

class Favorite : UITableViewCell {
    static var identifier: String = "Cell"

    lazy var listname : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false
        listname.text = "Favorite"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 18)
        return listname
    }()
    
    lazy var checkbox: UIButton = {
        let checkbox = UIButton()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "star", withConfiguration: symbolConfig)
        
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.setImage(symbol, for: .normal)
        checkbox.tintColor = UIColor.lightGray
        return checkbox
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(listname)
        self.addSubview(checkbox)
        
        listname.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        listname.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        checkbox.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        checkbox.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true

        
    }
    
}

class quantity : UITableViewCell{
    
    static var identifier: String = "Cell"
    
    
    lazy var QuantityType : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Quantity Type"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 18)
        return listname
    }()
    
    
    lazy var QuantityTypevalue : UILabel = {
         let listname = UILabel()
         listname.translatesAutoresizingMaskIntoConstraints = false

         listname.text = "numeric"
         listname.textColor = UIColor.black
         listname.numberOfLines = 0
         listname.adjustsFontSizeToFitWidth = true
         listname.font = UIFont.systemFont(ofSize: 18)
         return listname
     }()
    
    lazy var picker : UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(QuantityType)
        self.addSubview(QuantityTypevalue)
        
        
        QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        QuantityTypevalue.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        QuantityTypevalue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true
        
        
    }
    
    

}

class quantityValue : UITableViewCell{
    static var identifier: String = "Cell"
    
    
    lazy var QuantityType : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Quantity Value"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 18)
        return listname
    }()
    
    
    lazy var QuantityTypevalue : UILabel = {
         let listname = UILabel()
         listname.translatesAutoresizingMaskIntoConstraints = false

         listname.text = "1000"
         listname.textColor = UIColor.black
         listname.numberOfLines = 0
         listname.font = UIFont.systemFont(ofSize: 18)
        listname.textAlignment = .center
        listname.numberOfLines = 1
         return listname
     }()
    
    private let decreaseButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "minus.circle", withConfiguration: symbolConfig)
        btn.setImage(symbol, for: .normal)
        return btn
    }()
    
    
    private let IncreaseButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 21.0, weight: .light, scale: .medium)
        let symbol = UIImage(systemName: "plus.circle", withConfiguration: symbolConfig)
        btn.setImage(symbol, for: .normal)
        return btn
    }()
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(QuantityType)
        //self.addSubview(QuantityTypevalue)
        
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton,QuantityTypevalue,IncreaseButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        
        QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        QuantityTypevalue.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        

    }
    
    

}

class priority : UITableViewCell{
    static var identifier: String = "Cell"
    
    
    lazy var QuantityType : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "Prority"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 18)
        return listname
    }()
    
    
    lazy var QuantityTypevalue : UILabel = {
         let listname = UILabel()
         listname.translatesAutoresizingMaskIntoConstraints = false

         listname.text = "None"
         listname.textColor = UIColor.black
         listname.numberOfLines = 0
         listname.adjustsFontSizeToFitWidth = true
         listname.font = UIFont.systemFont(ofSize: 18)
         return listname
     }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(QuantityType)
        self.addSubview(QuantityTypevalue)
        
        QuantityType.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        QuantityType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        
        QuantityTypevalue.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        QuantityTypevalue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35).isActive = true

    }
    
}


class notes : UITableViewCell{
    static var identifier: String = "Cell"
    
    lazy var noteslabel : UILabel = {
        let listname = UILabel()
        listname.translatesAutoresizingMaskIntoConstraints = false

        listname.text = "notes"
        listname.textColor = UIColor.black
        listname.numberOfLines = 0
        listname.adjustsFontSizeToFitWidth = true
        listname.font = UIFont.systemFont(ofSize: 18)
        return listname
    }()
    

    lazy var notes : UITextView = {
         let listname = UITextView()
         listname.translatesAutoresizingMaskIntoConstraints = false
         //listname.text = "notes"
        listname.textColor = UIColor.lightGray
         listname.font = UIFont.systemFont(ofSize: 18)
         return listname
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        
        
        let stackView = UIStackView(arrangedSubviews: [noteslabel,notes])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 10
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        notes.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}


class picker : UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{
    
                var QuantityTypeList : [String]  = ["numeric","Piece","Gallon","Dozen","Each","Bag","Bottle","Box","Case","Pack","Roll","Jar","Can","Bunch","Gram","Kg","litre","ml","lbs","qt","oz","cup","tbsp","tsp","pt"]
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
    
    static var identifier: String = "Cell"
    

    
    lazy var picker : UIPickerView = {
       let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupviews()  {
        self.addSubview(picker)
        
        picker.delegate = self
        picker.dataSource = self
        
   
        picker.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        picker.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
    }
}

extension EditListView: UITableViewDelegate, UITableViewDataSource{

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if QuantityTypeIndexPath != nil {
            if section == 2 {
                return 2
            }
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! listname
            cell.contentView.backgroundColor = UIColor.white
            return cell
            
        }
        else if (indexPath.section == 1){
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! Favorite

                return cell
        }
        else if (indexPath.section == 2){
            if QuantityTypeIndexPath != nil && QuantityTypeIndexPath!.row == indexPath.row {
                let cell = tableView.dequeueReusableCell(withIdentifier: "picker", for: indexPath) as! picker
                return cell

            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! quantity
                cell.accessoryType = .disclosureIndicator
                return cell

            }
        }
        else if (indexPath.section == 3){
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! quantityValue

                   return cell
        }
        else if (indexPath.section == 4){
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell4", for: indexPath) as! priority
            cell.accessoryType = .disclosureIndicator

                   return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell5", for: indexPath) as! notes

                   return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5{
            return 400
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

            print("loppol")
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
    
    
}



