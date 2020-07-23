//
//  AddListViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit

class AddListViewController: UIViewController {
    
    lazy var ListName : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.whileEditing;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.borderStyle = .none
        namefield.backgroundColor = UIColor.opaqueSeparator
        namefield.layer.shadowColor = UIColor.darkGray.cgColor
        namefield.layer.shadowOpacity = 0.2
        namefield.layer.shadowOffset = .zero
        namefield.layer.shadowRadius = 1
        namefield.layer.cornerRadius = 10
        namefield.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
        return namefield
    }()
    
    lazy var Location : UITextField = {
        let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        //namefield.placeholder = "Location (Optional)"
        namefield.keyboardType = .default
        namefield.returnKeyType = .done
        namefield.font = UIFont.systemFont(ofSize: 18)
        namefield.clearButtonMode = UITextField.ViewMode.whileEditing;
        namefield.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        namefield.backgroundColor = UIColor.opaqueSeparator
        namefield.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);


        namefield.borderStyle = .none
        
        
              
        namefield.layer.shadowColor = UIColor.darkGray.cgColor
        namefield.layer.shadowOpacity = 0.2
        namefield.layer.shadowOffset = .zero
        namefield.layer.shadowRadius = 1
        namefield.layer.cornerRadius = 10
        return namefield
    }()
    
    lazy var AddItemsLabel : UILabel =  {
        let label = UILabel()
        label.text = "Add Items"
        label.textColor = UIColor.systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize:18)
        return label
    }()
    
    lazy var AddItemsIcon : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus.circle")

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.tintColor = UIColor.systemBlue
        button.setImage(image, for: .normal)
        return button
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
    
    var tableView = UITableView()
    
    let sec1 = ["Name","Location"]
    let sec2: [String] = ["     Name","     Location","djksndsk"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setToolbarHidden(false, animated: false)
        navigationController?.toolbar.backgroundColor = UIColor.white
        
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(title: "Add Items", style: .plain, target: self, action: nil)
        )
        
        toolbarItems = items
        
        
        view.backgroundColor = UIColor.white
        
        setupview()

        setuptableview()
        
        setupnavigaionitems()
        
        Location.delegate = self
        
        

        
    }
    
    func setupview() {
        
        view.addSubview(topstack)
        //view.addSubview(AddItemsLabel)
        //view.addSubview(AddItemsIcon)
        
        topstack.addArrangedSubview(ListName)
        topstack.addArrangedSubview(Location)
        
        topstack.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        topstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        topstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        topstack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
//        AddItemsLabel.topAnchor.constraint(equalTo: topstack.bottomAnchor, constant: 20).isActive = true
//        AddItemsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        AddItemsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
//        AddItemsIcon.topAnchor.constraint(equalTo: topstack.bottomAnchor, constant: 20).isActive = true
//        AddItemsIcon.leadingAnchor.constraint(equalTo: AddItemsLabel.trailingAnchor, constant: 0).isActive = true
//        AddItemsIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setuptableview() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        tableView.topAnchor.constraint(equalTo: topstack.bottomAnchor, constant: 5).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.register(AddListViewCellTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.separatorColor = UIColor.gray
        tableView.sectionIndexBackgroundColor = UIColor.white
        
    }

    
    func setupnavigaionitems() {
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        navigationItem.title = "Add New List"
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: nil)
    }
    
    
}

extension AddListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        tableView.isHidden = true
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddListViewCellTableViewCell
        cell.accessoryType = .detailButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension AddListViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        let map = MapViewController()
        map.delegate = self
       //navigationController?.pushViewController(map, animated: true)
        //map.isModalInPresentation = true
        
        
        self.present(map, animated: true)
        //present(map, animated: true, completion: nil)
    }
}

extension AddListViewController : locationdataSourceDelegate {
func locationtextfield(selectedlocation: SelectedLocation) {
    Location.text = selectedlocation.locationName
    
    print(selectedlocation)
    }
    
}
