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
        
    }
}

extension ListDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lol = UIView()
        lol.translatesAutoresizingMaskIntoConstraints = false
        lol.addSubview(topView)

        lol.heightAnchor.constraint(equalToConstant: 80).isActive = true

        return lol
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! AddListViewCellTableViewCell
        return cell
    }
    
    
}

