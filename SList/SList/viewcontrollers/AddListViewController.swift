//
//  AddListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

protocol AddlistProtocol{
    func finallist(list: MainList)
}

class AddListViewController: UIViewController{
    
    var tableView = UITableView()
    
    var listname : String?
    
    var listdata : [ListData]? = [ListData]()
    var mainlist : MainList?
    var selectedlocation : SelectedLocation?
    var count: Int = 0
    var editindex: Int?
    let button = UIButton.init(type: .custom)
    
    var nlist : ListData?
    
    let topView = AddlistView()
    
    var delegate: AddlistProtocol?
    

    
    override func viewDidAppear(_ animated: Bool) {
        
        //topView.ListName.addBottomBorderWithColor(color: UIColor.opaqueSeparator, width: 0.5)
        //topView.Location.addBottomBorderWithColor(color: UIColor.opaqueSeparator, width: 0.5)
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 34)!]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        
        setup_toolbartransparent()
        setup_toolbarbutton()
        
        setupview()
        setuptableview()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupnavigaionitems()
        
        topView.Location.delegate = self
        
        
        topView.plusbtn.addTarget(self, action: #selector(plus), for: .touchUpInside)
        
      
    }
    
    @objc func plus() {
        let map = MapViewController()
          map.delegate = self
        //navigationController?.pushViewController(map, animated: true)
        //map.isModalInPresentation = true
          self.present(map, animated: true)
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
    
    
    @objc func additem() {
        button.showAnimation()
        
        nlist = ListData(listname: "", order: 1,mark: false)
        count = count+1
        tableView.reloadData()
    }
    
    func setupview() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(topView)
        
        topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
//        topView.layer.shadowOffset = CGSize(width: 0, height: 2.0);
//        topView.layer.shadowOpacity = 0.2
//        topView.layer.shadowRadius = 0.5
//        topView.layer.masksToBounds = false
//
//        topView.layer.cornerRadius = 25
//        topView.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        topView.ListName.delegate = self
        
    
    }
    
    func setuptableview() {
        view.addSubview(tableView)
        
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0).isActive = true
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(sendtohome))
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        
    }
    
    @objc func sendtohome() {
        
        let list = MainList(listName: listname!, locationdata: selectedlocation, itemdata: listdata)
        delegate?.finallist(list: list)
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension AddListViewController : UITableViewDelegate, UITableViewDataSource {
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            //return mainlist?.itemdata?.count ?? 0
            print("flop")
            return listdata?.count ?? 0
        }
        
        return count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! AddListViewCellTableViewCell
            cell.itemtext.text = listdata?[indexPath.row].listName
            cell.itemtext.tag = indexPath.row
            cell.index = indexPath.row
            cell.delegate = self
            
            if listdata?[indexPath.row].mark == true{
                cell.animate(ismarked: false)
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddList2TableViewCell
        cell.accessoryType = .detailButton
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
        

        if (indexPath.section == 1){
            edit.listdata = nlist
            edit.delegate = self
            present(edit, animated: true, completion: nil)
            return
        }
        edit.listdata = listdata?[indexPath.row]
        edit.index = indexPath.row
        edit.delegate = self
        present(edit, animated: true, completion: nil)
    }
}

extension AddListViewController : UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        if textField.tag == 2 {
            //textField.clearButtonMode = .never
            textField.resignFirstResponder()
        }
        print("fool")

        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

       print("fool1")
   }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("fool2")

        if textField.tag == 2 {
            textField.resignFirstResponder()
//            let map = MapViewController()
//            map.delegate = self
//          //navigationController?.pushViewController(map, animated: true)
//          //map.isModalInPresentation = true
//            self.present(map, animated: true)
            return  false
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.tag == 3{
            listname = textField.text
            print(listname)
            return true
        }
     
       
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.tag == 3{
                   listname = textField.text
               }
    }
   
}

extension AddListViewController : locationdataSourceDelegate {
    
    func locationtextfield(selectedlocation: SelectedLocation) {
        topView.Location.text = selectedlocation.locationName
        topView.Location.clearButtonMode = .always
    
        print(selectedlocation)
        
        self.selectedlocation = selectedlocation
        
        //topView.animate()
        //btnanimate()
    }
    
}



extension AddListViewController: AddList2protocol{
    func mark() {
        nlist?.mark = true
    }
    
    func unmark() {
        nlist?.mark = false

    }
    
    
    
    
    func finallistname(name: String) {
        print("came")
        if name.isEmpty {
            print("lol")

            count = 0
            nlist = nil
            print(nlist)
            tableView.reloadData()
        }
        else{
            addtomainlist(ld:  nlist!)
        }
    }
    
    func listname(name: String) {
        nlist?.listName = name
    }
    
    func addtomainlist(ld: ListData){
           listdata?.append(ld)
           tableView.reloadData()

       }
    
    
}


extension AddListViewController: AddListMarkprotocol{
    func itemname(name: String, index: Int?) {
        if name.isEmpty == true {
            guard let ind = index else { return }
            listdata?.remove(at: ind)
            tableView.deleteRows(at: [IndexPath(item: ind, section: 0)], with: .automatic)
        }
        else{
            guard let ind = index else { return }
            
            listdata?[ind].listName = name
            tableView.reloadData()
        }
    }
    
    func mark(index: Int) {
        listdata?[index].mark = true
    }
    
    func unmark(index: Int) {
        listdata?[index].mark = false
    }
}

extension AddListViewController: editlist{
    func reload() {
        tableView.reloadData()
    }
    
    
    func editedlist(listdata: ListData, index: Int?) {
        
        guard let ind = index else {
            self.listdata?.append(listdata)
            tableView.reloadData()
            return
        }
        print(listdata)
        self.listdata?[ind] = listdata
        tableView.reloadData()
    }
    
    
}


