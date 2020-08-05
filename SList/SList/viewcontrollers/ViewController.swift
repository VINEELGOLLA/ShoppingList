//
//  ViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/18/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UICollectionViewController {
    
    
    var flist = [MainList]()
    var ld = [ListData]()
    let footer = Footer()
    
//    lazy var pageind : UIPageControl = {
//        let pageind = UIPageControl()
//        pageind.translatesAutoresizingMaskIntoConstraints = false
//        pageind.currentPage = 0
//        pageind.pageIndicatorTintColor = UIColor.systemFill
//        pageind.currentPageIndicatorTintColor = UIColor.black
//        return pageind
//    }()
    
    init() {
        super.init(collectionViewLayout: ViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout{
        return  UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    
                    item.contentInsets.trailing = 20
                    item.contentInsets.top = 10
                    item.contentInsets.leading = 20
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: "lol10", alignment: .bottomTrailing )
                
                ]
            
                
                section.orthogonalScrollingBehavior = .paging
                return section
            }
            else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                item.contentInsets.trailing = 10
                item.contentInsets.top = 5
                item.contentInsets.leading = 10
                    
                    
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(110)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                
                //section.orthogonalScrollingBehavior = .continuous
                return section
            }
        
    }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            //footer.pageind.numberOfPages = 3
            Footer.setnumberpages(ind: 3)

            return 3
            
        }
        else {
         return 5
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.layer.cornerRadius = 10
            cell.backgroundColor = UIColor(red: 12/255, green: 0/255, blue: 0/255, alpha: 1)
            
            cell.layer.addShadow()

            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            cell.layer.cornerRadius = 8
            cell.backgroundColor = UIColor.white
            
            //cell.layer.addShadow2()

            return cell
        }
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(indexPath.row)
            //footer.pageind.currentPage = indexPath.row
            Footer.setcurrentpage(ind: indexPath.row)
        }
    }
    

    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer", for: indexPath)
        return footer
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        print("ll \(offSet)")
        let width = scrollView.frame.width
        let horizontalCenter = width / 3

        //Footer.setcurrentpage(ind:Int(offSet + horizontalCenter) / Int(width))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        view.addSubview(pageind)
//
//        pageind.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        pageind.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 280).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
         navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 34)!]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.systemGray6
        
        collectionView.register(locationCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(HomeTableViewCell.self, forCellWithReuseIdentifier: "Cell2")
        
        collectionView.register(Footer.self, forSupplementaryViewOfKind: "lol10", withReuseIdentifier: "footer")
        
        setupnavigaionitems()
        
        ld.append(ListData(listname: "apples", order: 1, mark: false))
        ld.append(ListData(listname: "oranges", order: 2, mark: true))


        
        flist.append(MainList(listName: "Trader Joe",locationdata: SelectedLocation(locationName: "Trader Joe", locationCoordinate: CLLocationCoordinate2D(latitude: 12.33, longitude: 12.11), thoroughfare: "lol", aliasName: "lol"), itemdata: ld))
        
    }
    
    func setupnavigaionitems() {
          
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
          //navigationItem.title = "ShoppingList"
          
          //navigationItem.largeTitleDisplayMode = .always
          navigationController?.navigationBar.prefersLargeTitles = false
          
          navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
          
          let searchController = UISearchController(searchResultsController: nil)
          searchController.obscuresBackgroundDuringPresentation = false
          searchController.searchBar.placeholder = "Search lists"
          self.navigationItem.searchController = searchController
          self.definesPresentationContext = true
      }
    
    
    
    @objc func addTapped() {
        
        let addlist = AddListViewController()
        addlist.delegate = self
        navigationController?.pushViewController(addlist, animated: true)

    }
}






extension ViewController: AddlistProtocol{
    func finallist(list: MainList) {
        
//        flist.append(list)
//        tableView.reloadData()
    }
    
    
}

class Footer : UICollectionReusableView {
       static var pageind : UIPageControl = {
          let pageind = UIPageControl()
          pageind.translatesAutoresizingMaskIntoConstraints = false
          pageind.currentPage = 0
          pageind.pageIndicatorTintColor = UIColor.systemFill
          pageind.currentPageIndicatorTintColor = UIColor.black
          return pageind
      }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addSubview(Footer.pageind)
        self.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Footer.pageind.frame = bounds
    }
    
    static func setnumberpages(ind: Int) {
        Footer.pageind.numberOfPages = ind
    }
    
    static func setcurrentpage(ind: Int) {
        Footer.pageind.currentPage = ind
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CALayer {
    func addShadow() {
        self.shadowOffset = CGSize(width: 0, height: 2)
        self.shadowOpacity = 0.5
        self.shadowRadius = 5
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
       
    }
    
    func addShadow2() {
        self.shadowOffset = .zero
        self.shadowOpacity = 0.2
        self.shadowRadius = 2
        self.shadowColor = UIColor.gray.cgColor
        self.masksToBounds = false
       
    }
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
        
    }
}





    
    

