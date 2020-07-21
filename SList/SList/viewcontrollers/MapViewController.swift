//
//  MapViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/19/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    fileprivate var locationManager: CLLocationManager = CLLocationManager()
    
    lazy var mapview : MKMapView = {
        let mapview = MKMapView()
        mapview.mapType = MKMapType.standard
        mapview.isZoomEnabled = true
        mapview.isScrollEnabled = true
        return mapview
    }()
    
    
    override func viewWillLayoutSubviews() {
        let width = self.view.frame.width

        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))

        self.view.addSubview(navigationBar)
        
        let navigationItem = UINavigationItem()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
        navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
        
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.titleView = searchController.searchBar
        searchController.automaticallyShowsCancelButton = true
        searchController.searchBar.placeholder = "Search Place"
        self.definesPresentationContext = true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
         
        mapview.showsUserLocation = true
        
        setupview()
    }
    
    func setupview() {
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 0
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height
            
        mapview.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        view.addSubview(mapview)
    }
    
    deinit {

          mapview.annotations.forEach{mapview.removeAnnotation($0)}

          mapview.delegate = nil

          print("deinit: MapViewController")
    }

}

extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.first != nil {
              print("location:: (location)")
          }
      }

    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
          print("error:: (error)")
      }
}



