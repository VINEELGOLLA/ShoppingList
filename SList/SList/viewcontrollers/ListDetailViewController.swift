//
//  ListDetailViewController.swift
//  SList
//
//  Created by naga vineel golla on 8/1/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    let topView = ListDetailTopView()
    
    let bottomView = ListDetailBottomView()
    let button = UIButton.init(type: .custom)
    
    var mainlist : MainList?
    var count: Int = 0
    var nlist : ListData?




    
    lazy var img : UIImageView = {
        let im = UIImageView()
        im.backgroundColor = UIColor.systemBlue
        im.translatesAutoresizingMaskIntoConstraints = false
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .heavy, scale: .medium)
         let symbol = UIImage(systemName: "ellipsis.circle.fill", withConfiguration: symbolConfig)
        let lol = symbol
        im.image = lol
        return im
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor.white
        navigationController?.setToolbarHidden(false, animated: false)

        setupview()
        setupnavigaionitems()
        setup_toolbarbutton()
        setup_toolbartransparent()
        
        
        
        
        bottomView.tableView.delegate = self
        bottomView.tableView.dataSource = self
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(mainlist?.itemdata)

        //
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //self.navigationController?.toolbar.shadowImage(forToolbarPosition: .)
        topView.segmented.addTarget(self, action:  #selector(EditListViewController.indexChanged(_:)), for: .valueChanged)

        
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
//     if sender.selectedSegmentIndex == 0 {
//         listdata?.Priority = 0
//         } else if sender.selectedSegmentIndex == 1 {
//             listdata?.Priority = 1
//         } else if sender.selectedSegmentIndex == 2 {
//             listdata?.Priority = 2
//         }else if sender.selectedSegmentIndex == 3 {
//             listdata?.Priority = 3
//         }
     }

    
    

}

extension ListDetailViewController{
    
    func setup_toolbartransparent(){
        navigationController?.toolbar.setBackgroundImage(UIImage(), forToolbarPosition: .bottom, barMetrics: .compactPrompt)
        navigationController?.toolbar.backgroundColor = UIColor.systemGray6
        navigationController?.toolbar.setShadowImage(UIImage(), forToolbarPosition: .bottom)
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
    

    
    func setupnavigaionitems() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Trader Joe"

        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .heavy, scale: .medium)
        let symbol = UIImage(systemName: "ellipsis", withConfiguration: symbolConfig)
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: symbol, style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
        
    
        
    }
    func setupview() {
        view.addSubview(bottomView)
        
        
        bottomView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        

    }
}

extension ListDetailViewController{
    @objc func additem(){
        button.showAnimation()
        
        nlist = ListData(listname: "", order: 1,mark: false)
        count = count+1
        bottomView.tableView.reloadData()
    }
}

extension ListDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
        let lol = UIView()
        lol.translatesAutoresizingMaskIntoConstraints = false
        lol.addSubview(topView)

        lol.heightAnchor.constraint(equalToConstant: 80).isActive = true

        return lol
        }
        if section == 1{
            let lol = UIView()
            lol.translatesAutoresizingMaskIntoConstraints = false
            lol.heightAnchor.constraint(equalToConstant: 0).isActive = true
            lol.backgroundColor = UIColor.white
            return lol
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 80
        }
        else
        {
            return 0
        }
    }
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            //return mainlist?.itemdata?.count ?? 0
            print("flop")
            return mainlist?.itemdata?.count ?? 0
        }
        
        return count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! AddListViewCellTableViewCell
            cell.itemtext.text = mainlist?.itemdata?[indexPath.row].listName
            cell.itemtext.tag = indexPath.row
            cell.index = indexPath.row
            cell.delegate = self
            
            if mainlist?.itemdata?[indexPath.row].mark == true{
                cell.animate(ismarked: false)
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! AddList2TableViewCell
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
        edit.listdata = mainlist?.itemdata?[indexPath.row]
        edit.index = indexPath.row
        edit.delegate = self
        present(edit, animated: true, completion: nil)
    }
    
    
}

extension ListDetailViewController: AddList2protocol{
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
            bottomView.tableView.reloadData()
            //tableView.reloadData()
        }
        else{
            addtomainlist(ld:  nlist!)
        }
    }
    
    func listname(name: String) {
        nlist?.listName = name
    }
    
    func addtomainlist(ld: ListData){
        mainlist?.itemdata?.append(ld)
           //listdata?.append(ld)
        bottomView.tableView.reloadData()
           //tableView.reloadData()

       }
    
    
}


extension ListDetailViewController: AddListMarkprotocol{
    func itemname(name: String, index: Int?) {
        if name.isEmpty == true {
            guard let ind = index else { return }
            mainlist?.itemdata?.remove(at: ind)
            bottomView.tableView.deleteRows(at: [IndexPath(item: ind, section: 0)], with: .automatic)
            //listdata?.remove(at: ind)
            //tableView.deleteRows(at: [IndexPath(item: ind, section: 0)], with: .automatic)
        }
        else{
            guard let ind = index else { return }
            
            mainlist?.itemdata?[ind].listName = name
            bottomView.tableView.reloadData()
            //listdata?[ind].listName = name
            //tableView.reloadData()
        }
    }
    
    func mark(index: Int) {
        mainlist?.itemdata?[index].mark = true
        //listdata?[index].mark = true
    }
    
    func unmark(index: Int) {
        mainlist?.itemdata?[index].mark = false

        //listdata?[index].mark = false
    }
}

extension ListDetailViewController: editlist{
    func reload() {
        bottomView.tableView.reloadData()
        //tableView.reloadData()
    }
    
    
    func editedlist(listdata: ListData, index: Int?) {
        
        guard let ind = index else {
            mainlist?.itemdata?.append(listdata)
            bottomView.tableView.reloadData()
            return
            //self.listdata?.append(listdata)
            //tableView.reloadData()
            //return
        }
        print(listdata)
        mainlist?.itemdata?[ind] = listdata
        bottomView.tableView.reloadData()
        //self.listdata?[ind] = listdata
        // tableView.reloadData()
    }
    
    
}

