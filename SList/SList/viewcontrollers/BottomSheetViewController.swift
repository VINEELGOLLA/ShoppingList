//
//  BottomSheetViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/20/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


protocol  bottomsheetDelegate {
    func close()
    func senddata()
    func sendsubmitdata(aliasName: String)
}

extension BottomSheetViewController {
    
    enum State {
        case open
        case close
    }
    
    private enum Constant {
        static let fullViewYPosition: CGFloat = 100
        static var partialViewYPosition: CGFloat { UIScreen.main.bounds.height - 270 }
        static var closeViewYPosition: CGFloat { UIScreen.main.bounds.height }

    }
}

class BottomSheetViewController: UIViewController {
    
    var bottomdelegate: bottomsheetDelegate?
    
    var currentcoordinate : CLLocation?
    var pincoordinate : CLLocation?
    var locationdetail : Placemark?
    
    let LocationName : UILabel = {
        let locationname = UILabel()
        locationname.translatesAutoresizingMaskIntoConstraints = false
        locationname.textColor = UIColor.black
        locationname.numberOfLines = 0
        locationname.adjustsFontSizeToFitWidth = true
        locationname.font = UIFont.boldSystemFont(ofSize:22)
        return locationname
    }()
    
    lazy var LocationAddress : UILabel =  {
        let locationaddress = UILabel()
        locationaddress.translatesAutoresizingMaskIntoConstraints = false
        locationaddress.textColor = UIColor.darkGray
        locationaddress.numberOfLines = 0
        locationaddress.adjustsFontSizeToFitWidth = true
        locationaddress.font = UIFont.boldSystemFont(ofSize:13)
        return locationaddress
    }()
    
    lazy var mileslabel : UILabel =  {
        let miles = UILabel()
        miles.translatesAutoresizingMaskIntoConstraints = false
        miles.text = ""
        miles.textColor = UIColor.systemYellow
        miles.numberOfLines = 0
        miles.adjustsFontSizeToFitWidth = true
        miles.font = UIFont.boldSystemFont(ofSize:13)
        return miles
    }()
    
    lazy var cancel : UIButton = {
         let image1 = UIButton()
         image1.translatesAutoresizingMaskIntoConstraints = false
         image1.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
         image1.tintColor = UIColor.gray
         return image1
     }()
    
    lazy var selectbutton : UIButton = {
        let selectbutton = UIButton()
        selectbutton.translatesAutoresizingMaskIntoConstraints = false
        selectbutton.setTitle("Select", for: .normal)
        selectbutton.backgroundColor = UIColor.systemBlue
        selectbutton.tintColor = UIColor.white
        selectbutton.titleLabel?.font = .systemFont(ofSize: 17)
        selectbutton.layer.cornerRadius = 9
        selectbutton.layer.borderWidth = 1
        selectbutton.layer.borderColor = UIColor.clear.cgColor
        selectbutton.titleLabel?.lineBreakMode = .byWordWrapping
        return selectbutton
    }()
    
    lazy var favourite : UIButton = {
        let favourite = UIButton()
        favourite.translatesAutoresizingMaskIntoConstraints = false
        favourite.setTitle(" Favorite", for: .normal)
        favourite.setTitleColor(UIColor.black, for: .normal)
        favourite.imageView?.contentMode = .scaleAspectFit
        favourite.imageEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
        favourite.contentEdgeInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        favourite.titleColor(for: .normal)
        favourite.setImage(UIImage(systemName: "star"), for: .normal)
        favourite.titleLabel?.font = .systemFont(ofSize: 10)
        return favourite
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("BottomSheetViewController viewDidLoad")

        view.backgroundColor = UIColor.white


        roundViews()
        setupview()
        
        cancel.addTarget(self, action: #selector(bottomsheetclose), for: .touchUpInside)
        selectbutton.addTarget(self, action: #selector(locationselected), for: .touchUpInside)
        favourite.addTarget(self, action: #selector(favoriteselected), for: .touchUpInside)
        
        
    }
    
    @objc func bottomsheetclose(){
        bottomdelegate?.close()
        
        UIView.animate(withDuration: 0.6, animations: {
            self.closeView()
        })
    }
    
    @objc func locationselected(){
        bottomdelegate?.senddata()
           
           
       }
    
    @objc func favoriteselected() {
        let alertcontroller = UIAlertController(title: "Add to Favorite Locations", message: "Rename Location", preferredStyle: .alert)
        alertcontroller.addTextField{ (textfield) in
            
            textfield.frame = CGRect(x: 20, y: 100, width: 300, height: 80)
            textfield.text = self.locationdetail?.locationName
            
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { _ in
            guard let answer = alertcontroller.textFields?[0] else {
                print("vineel")
                return
            }
            
            self.favourite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        }
        
        let submitSelectAction = UIAlertAction(title: "Submit and Select", style: .default) { _ in
            self.favourite.setImage(UIImage(systemName: "star.fill"), for: .normal)
            //self.bottomdelegate?.senddata()
            
            guard let answer = alertcontroller.textFields?[0].text else {
                self.bottomdelegate?.sendsubmitdata(aliasName: self.locationdetail!.locationName)
                return
            }
            
            self.bottomdelegate?.sendsubmitdata(aliasName: answer)

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in

            alertcontroller.dismiss(animated: true, completion: nil)

        }
        
        
        
        alertcontroller.addAction(submitAction)
        alertcontroller.addAction(submitSelectAction)
        alertcontroller.addAction(cancelAction)

        present(alertcontroller, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("BottomSheetViewController viewDidAppear")

//        UIView.animate(withDuration: 3, animations: {
//            self.launchView()
//        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("BottomSheetViewController viewWillAppear")

//              UIView.animate(withDuration: 3, animations: {
//                  self.launchView()
//              })
    }
    

    func moveview(state: State){
        switch state {
        case .close:
            UIView.animate(withDuration: 0.6, animations: {
                self.closeView()
            })
        case .open:
            UIView.animate(withDuration: 0.6, animations: {
                self.moveView()
            })
        }
    }
    

    
    func launchView(){
         let yPosition = Constant.closeViewYPosition
         view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
    }
    
    func moveView() {
        let yPosition = Constant.partialViewYPosition
        view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
    }
    
    func closeView() {
        let yPosition = Constant.closeViewYPosition
        view.frame = CGRect(x: 0, y: yPosition, width: view.frame.width, height: view.frame.height)
    }


    
    func roundViews() {
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
    }
    
    func setupview() {
        view.addSubview(LocationName)
        view.addSubview(LocationAddress)
        view.addSubview(cancel)
        view.addSubview(selectbutton)
        view.addSubview(mileslabel)
        view.addSubview(favourite)
        
        favourite.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        favourite.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        favourite.widthAnchor.constraint(equalToConstant: 90).isActive = true
        favourite.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        
        LocationName.topAnchor.constraint(equalTo: favourite.topAnchor, constant: 25).isActive = true
        LocationName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        LocationName.widthAnchor.constraint(equalToConstant: 200).isActive = true
        LocationName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        LocationAddress.topAnchor.constraint(equalTo: LocationName.bottomAnchor, constant: 2).isActive = true
        LocationAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        LocationAddress.widthAnchor.constraint(equalToConstant: 300).isActive = true
        LocationAddress.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        cancel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        cancel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cancel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        mileslabel.topAnchor.constraint(equalTo: LocationAddress.bottomAnchor, constant: 2).isActive = true
        mileslabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        mileslabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        mileslabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        selectbutton.topAnchor.constraint(equalTo: mileslabel.bottomAnchor, constant: 20).isActive = true
        selectbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        selectbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        selectbutton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
    }
    
    func setuptext() {
        
        LocationName.text = locationdetail?.locationName
        LocationAddress.text = locationdetail?.thoroughfare
        

         if let cloc = currentcoordinate , let ploc = pincoordinate {
            CalculateDistance.getDistance(startLocation: cloc, endLocation: ploc, completionHandler: {distance, time in
                 
                 let meters = Measurement(value: distance, unit: UnitLength.meters)
                 let meterstomiles = meters.converted(to: .miles).value
                 let miles = round(meterstomiles*10)/10
                 
                 let seconds = Measurement(value: time, unit: UnitDuration.seconds)
                 let secondstominutes = seconds.converted(to: UnitDuration.minutes).value.rounded(.awayFromZero)
                 let final = Int(secondstominutes)
                                  
                 self.selectbutton.setTitle("    Select \n" + "\(String(final))" + " min drive ", for: .normal)
        
                 self.mileslabel.text = "\(miles) miles away"

             })

         }
        
       
    }

}

extension UIView {

    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
}
