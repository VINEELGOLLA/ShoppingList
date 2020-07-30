//
//  AddListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController{
    
    var tableView = UITableView()
    var listdata : [ListData]? = [ListData]()
    var mainlist : MainList?
    var selectedlocation : SelectedLocation?
    var count: Int = 0
    var editindex: Int?
    let button = UIButton.init(type: .custom)
    
    lazy var ListName : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.whileEditing;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.borderStyle = .none
        namefield.backgroundColor = UIColor.white
        namefield.placeholder = "Name"
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: namefield.frame.height - 2, width: namefield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        namefield.layer.addSublayer(bottomLine)
        namefield.tag = 3
        
        return namefield
    }()
    
    lazy var Location : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.placeholder = "Location (Optional)"
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.never;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.borderStyle = .none
        namefield.tag = 2
        return namefield
    }()

    let topstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        ListName.addBottomBorderWithColor(color: UIColor.opaqueSeparator, width: 0.5)
        Location.addBottomBorderWithColor(color: UIColor.opaqueSeparator, width: 0.5)
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 34)!]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        
        setup_toolbartransparent()
        setup_toolbarbutton()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        
        setupkeyboardnotification()

        setuptableview()
        
        setupnavigaionitems()
        
        Location.delegate = self
    }
    
    func setup_toolbartransparent(){
        navigationController?.toolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        navigationController?.toolbar.backgroundColor = .clear
        navigationController?.toolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
    }
    
    func setup_toolbarbutton() {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .heavy, scale: .medium)
        let symbol = UIImage(systemName: "plus.circle.fill", withConfiguration: symbolConfig)
            
        button.setImage(symbol, for: .normal)
        button.setTitle(" New Item", for: .normal)
        button.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 18)
        button.tintColor = UIColor.black
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(additem), for: .touchUpInside)
            
        let barButton = UIBarButtonItem(customView: button)
        
        var items = [UIBarButtonItem]()
          
        items.append(barButton)
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
            
        setToolbarItems(items, animated: true)
        
    }
    
    func setupkeyboardnotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){

         }
    
    @objc func keyboardWillChange(_ notification: NSNotification){

           }
    
    @objc func keyboardWillHide(_ notification: NSNotification){
                
            }
    
    @objc func additem() {
        button.showAnimation()
        count = count+1
        tableView.reloadData()
    }
    
    func setupview() {
        view.backgroundColor = UIColor.white

        view.addSubview(topstack)
        
        topstack.addArrangedSubview(ListName)
        topstack.addArrangedSubview(Location)
        
        topstack.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        topstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        topstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        topstack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        ListName.delegate = self
    }
    
    func setuptableview() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.topAnchor.constraint(equalTo: topstack.bottomAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.autoresizingMask = .flexibleHeight
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        
        
        tableView.register(AddList2TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.register(AddListViewCellTableViewCell.self, forCellReuseIdentifier: "Cell2")
        
        tableView.separatorColor = UIColor.gray
        tableView.sectionIndexBackgroundColor = UIColor.white
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0)
        
        tableView.tableFooterView = UIView()
        
    }

    
    func setupnavigaionitems() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        navigationItem.title = "New List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil)
        
    }
    
    
}

extension AddListViewController : UITableViewDelegate, UITableViewDataSource {
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            //return mainlist?.itemdata?.count ?? 0
            return listdata?.count ?? 0
        }
        
        return count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! AddListViewCellTableViewCell
            cell.itemtext.text = listdata?[indexPath.row].listName
            cell.itemtext.tag = indexPath.row
            cell.index = indexPath
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddList2TableViewCell
        cell.accessoryType = .detailButton
        cell.edittext.text = ""
        cell.delegate = self
        cell.edittext.becomeFirstResponder()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let edit = EditListViewController()
        present(edit, animated: true, completion: nil)
    }
}

extension AddListViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.tag == 3{
            return
        }
        if textField.clearButtonMode == .never && textField.tag == 2{
            
            textField.resignFirstResponder()
            let map = MapViewController()
            map.delegate = self
          //navigationController?.pushViewController(map, animated: true)
          //map.isModalInPresentation = true
            self.present(map, animated: true)
        
        }
        else
        {
            textField.clearButtonMode = .never
            textField.resignFirstResponder()
        }
   }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   
}

extension AddListViewController : locationdataSourceDelegate {
    
    func locationtextfield(selectedlocation: SelectedLocation) {
        Location.text = selectedlocation.locationName
        Location.clearButtonMode = .always
    
        print(selectedlocation)
    }
    
}

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,
                              width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}

extension AddListViewController: AddListaddNewItem{
    func editextdone(listname: String) {
        if listname.isEmpty {
            count = 0
            tableView.reloadData()
        }
        else{
            let ld = ListData(listname: listname, quantityvalue: 1, order: 1, date: Date(), mark: false)
            addtomainlist(ld: ld)
        }
    }

    func addtomainlist(ld: ListData){
        listdata?.append(ld)
        tableView.reloadData()
    }
}


extension AddListViewController: AddListMarkonpress{
    func mark(index: Int) {
        listdata?[index].mark = true
    }
    
    func unmark(index: Int) {
        listdata?[index].mark = false
    }
}

