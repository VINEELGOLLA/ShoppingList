//
//  BottomSheetFavoriteViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/21/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import  UIKit
import MapKit

protocol gestureprotocol{
    func gesturep(state : GState)
}

enum GState {
      case full
      case partial
  }

extension BottomSheetFavoriteViewController {
    
    
    enum State {
        case full
        case partial
        case minimum
    }
    
    private enum Constant {
        static let fullViewYPosition: CGFloat = 150
        static var partialViewYPosition: CGFloat { UIScreen.main.bounds.height - 150 }
        static var minimumViewYPosition: CGFloat { UIScreen.main.bounds.height - 150 }
        static var closeViewYPosition:CGFloat { UIScreen.main.bounds.height }

    }
}

class BottomSheetFavoriteViewController: UIViewController {
    
    var fstate = true

    
    var tableView = UITableView()
    
    var gdelegate: gestureprotocol?

    
    var places : [SelectedLocation] = [SelectedLocation(locationName: "Walmart Supercenter", locationCoordinate: CLLocationCoordinate2D(latitude: 9.00, longitude: 7.98766) , thoroughfare: "18121 Marsh Ln, Dallas, TX 75287", aliasName: "wal"),SelectedLocation(locationName: "Whole Foods Market", locationCoordinate: CLLocationCoordinate2D(latitude: 9.00, longitude: 7.98766) , thoroughfare: "5100 Belt Line Rd Ste 1012, Dallas, TX 75254", aliasName: "wal"), SelectedLocation(locationName: "Kroger", locationCoordinate: CLLocationCoordinate2D(latitude: 9.00, longitude: 7.98766) , thoroughfare: "3770 Belt Line Rd, Addison, TX 75001", aliasName: "wal"), SelectedLocation(locationName: "ALDI", locationCoordinate: CLLocationCoordinate2D(latitude: 9.00, longitude: 7.98766) , thoroughfare: "3632 Frankford Rd Suite 200C, Dallas, TX 75287", aliasName: "wal"),  ]
    
    let imageview : UIImageView = {
        var image = UIImageView(image: UIImage(systemName: "minus"))
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.contentMode = .scaleAspectFill
        image.tintColor = UIColor.gray
        image.layer.cornerRadius = 8.0

        return image
    }()
    
    let Favplace : UILabel = {
           let locationname = UILabel()
           locationname.translatesAutoresizingMaskIntoConstraints = false
           locationname.text = "Favorite Places"
           locationname.textColor = UIColor.black
           locationname.numberOfLines = 0
           locationname.adjustsFontSizeToFitWidth = true
           locationname.font = UIFont.boldSystemFont(ofSize:33)
           return locationname
       }()
    
    let line : UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(gesture)
        
        view.backgroundColor = UIColor.white

        roundViews()
        
        setupviews()
        
        setuptableview()
        
        
        
        print("bofav oncreate")
        
         
        

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("bofav viewWillAppear")
        
        

               
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if fstate == true{
        UIView.animate(withDuration: 0.6, animations: {
            self.moveView(state: .partial)
        })
        }
        
        print("bofav didappear")

    }
    
    func reopenView() {
        UIView.animate(withDuration: 0.6, animations: {
            let yPosition = Constant.partialViewYPosition
            self.view.frame = CGRect(x: 0, y: yPosition, width: self.view.frame.width, height: self.view.frame.height)
        })

    }
    
    func closeView() {
        UIView.animate(withDuration: 0.6, animations: {
            let yPosition = Constant.closeViewYPosition
            self.view.frame = CGRect(x: 0, y: yPosition, width: self.view.frame.width, height: self.view.frame.height)
        })
    }
    
    private func moveView(state: State) {
        let yPosition = state == .partial ? Constant.partialViewYPosition : Constant.fullViewYPosition
        view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
        
        print("mnb vineel vineel")
        
        switch state {
        case .full:
            gdelegate?.gesturep(state: .full)
        case .partial:
            gdelegate?.gesturep(state: .partial)

        case .minimum:
            return
        }
        
        
    }

    private func moveView(panGestureRecognizer recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        let minY = view.frame.minY
        
        if (minY + translation.y >= Constant.fullViewYPosition) && (minY + translation.y <= Constant.partialViewYPosition) {
            view.frame = CGRect(x: 0, y: minY + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: view)
        }
    }
    
    @objc private func panGesture(_ recognizer: UIPanGestureRecognizer) {
        moveView(panGestureRecognizer: recognizer)
        
        if recognizer.state == .ended {
            UIView.animate(withDuration: 1, delay: 0.0, options: [.allowUserInteraction], animations: {
                let state: State = recognizer.velocity(in: self.view).y >= 0 ? .partial : .full
                self.moveView(state: state)
            }, completion: nil)
        }
    }
    
    func roundViews() {
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
    }
    
    func setupviews(){
        view.addSubview(Favplace)
        view.addSubview(imageview)
        view.addSubview(line)
        
        imageview.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        Favplace.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 0).isActive = true
        Favplace.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        Favplace.widthAnchor.constraint(equalToConstant: 300).isActive = true
        Favplace.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        line.topAnchor.constraint(equalTo: Favplace.bottomAnchor, constant: 7).isActive = true
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        line.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
    }
    
    func setuptableview(){
           view.addSubview(tableView)
        tableView.separatorStyle = .singleLine
        

           tableView.translatesAutoresizingMaskIntoConstraints = false
           
           tableView.topAnchor.constraint(equalTo: Favplace.bottomAnchor, constant: 10).isActive = true
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
           tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
           
           tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "cell4")
           tableView.delegate = self
           tableView.dataSource = self
       }
    
    
}

extension BottomSheetFavoriteViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! FavoriteTableViewCell
        let item = places[indexPath.row]

        cell.Title.text = item.locationName
        cell.SubTitle.text = item.thoroughfare
        cell.Title.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    
}
