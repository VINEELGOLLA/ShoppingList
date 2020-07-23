//
//  MapViewController.swift
//  SList
//
//  Created by naga vineel golla on 7/19/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import UIKit
import MapKit

protocol locationdataSourceDelegate {
    func locationtextfield(selectedlocation: SelectedLocation)
}


class MapViewController: UIViewController, UISearchControllerDelegate, MKMapViewDelegate {
    
    var tableView = UITableView()
    let searchBar = UISearchBar()
    
    var currentcoordinate : CLLocation?
    var pincoordinate : CLLocation?
    var selectedPlacemark : Placemark?
    
    var selectedLocation : SelectedLocation?
    
    
    
    var bottomSheetVC = BottomSheetViewController()
    
    var bottomSheetFav = BottomSheetFavoriteViewController()
    
    private var placemarks = [Placemark]()
    
    var delegate : locationdataSourceDelegate?

    
    // for search location
    private var localSearchRequest: MKLocalSearch.Request!
    private var localSearch: MKLocalSearch!
    
    // location manager
    var locationManager: CLLocationManager = CLLocationManager()
    
    lazy var mapview : MKMapView = {
        let mapview = MKMapView()
        mapview.mapType = MKMapType.standard
        mapview.isZoomEnabled = true
        mapview.isScrollEnabled = true
        return mapview
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        let width = self.view.frame.width
        
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        
        self.view.addSubview(navigationBar)
        
        let navigationItem = UINavigationItem()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(finishmapview))
        navigationItem.rightBarButtonItem = doneBtn
        navigationBar.setItems([navigationItem], animated: false)
        
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search for places"
        searchBar.showsCancelButton = false
        
        searchBar.delegate = self
        
//        addBottomSheetView()
//
//        addBottomSheetViewFav()
        
        
        print("mapview viewwillappear")

        
        
    }
    
    @objc func finishmapview() {
        bottomSheetVC.moveview(state: .close)
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("mapview viewdidload")


        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
         
        mapview.showsUserLocation = true
        mapview.isRotateEnabled = false
        mapview.delegate = self
        
        setupview()
        setuptableview()
        
        addBottomSheetView()
            
        addBottomSheetViewFav()

    }
    
    func setupview() {
        let leftMargin:CGFloat = 0
        let topMargin:CGFloat = 0
        let mapWidth:CGFloat = view.frame.size.width
        let mapHeight:CGFloat = view.frame.size.height
            
        mapview.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        view.addSubview(mapview)
        
        //self.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
    }
    
    deinit {

          mapview.annotations.forEach{mapview.removeAnnotation($0)}
          mapview.delegate = nil
          print("deinit: MapViewController")
    }
    
    
    func setuptableview(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "cell4")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addBottomSheetViewFav(){
        //bottomSheetFav.bottomdelegate = self
        
        print("mapview addBottomSheetViewFav")

        
        bottomSheetFav.gdelegate = self
        
        self.addChild(bottomSheetFav)
        self.view.addSubview(bottomSheetFav.view)
        bottomSheetFav.didMove(toParent: self)
        
        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetFav.view.frame = CGRect(x: 0, y: view.frame.maxY, width: width, height: height)

    }
    
    func addBottomSheetView() {
        
        print("mapview addBottomSheetView")

        
        bottomSheetVC.bottomdelegate = self
        
        
        self.addChild(bottomSheetVC)
        self.view.addSubview(bottomSheetVC.view)
        bottomSheetVC.didMove(toParent: self)
        
        let height = view.frame.height
        let width  = view.frame.width
        bottomSheetVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: width, height: height)
        
    }

}

extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }

        currentcoordinate = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        render(location: location)
        
        locationManager.stopUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error)")
    }
    
    func render(location : CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1200, longitudinalMeters: 1200)
        mapview.setRegion(coordinateRegion, animated: true)
    }
    
    func render() {
        guard let curr = currentcoordinate else {
            return
        }
        let coordinate = CLLocationCoordinate2D(latitude: curr.coordinate.latitude  , longitude:  curr.coordinate.longitude)
        
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1200, longitudinalMeters: 1200)
        mapview.setRegion(coordinateRegion, animated: true)
    }
    
}

extension MapViewController : UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = true
        
        bottomSheetVC.moveview(state: .close)
        
        bottomSheetFav.fstate = true
        
        guard let search = searchBar.text else {
            return true
        }
        
        if !placemarks.isEmpty  && !search.isEmpty{
            self.tableView.isHidden = false
        }
        
        bottomSheetFav.closeView()

        
        
        
        
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        searchBar.text = ""
        tableView.isHidden = true
            
        bottomSheetVC.moveview(state: .close)
        
        bottomSheetFav.fstate = true
        
        render()
        removeannotations()
        
        bottomSheetFav.reopenView()
        
    
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

    }
    
    
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        localSearchRequest = MKLocalSearch.Request()
        localSearchRequest.naturalLanguageQuery = searchText
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { [weak self]  (localSearchResponse, error) -> Void in
           guard let items = localSearchResponse?.mapItems else {
                         return
                     }

            
        self?.tableView.isHidden = false
        self?.placemarks = items.map { Placemark(item: $0) }
        self?.tableView.reloadData()

        }
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    
}

extension MapViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if placemarks.count == 0{
            tableView.isHidden = true
        }
        return placemarks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! SearchTableViewCell
        let item = placemarks[indexPath.row]

        cell.Title.text = item.locationName
        cell.SubTitle.text = item.thoroughfare
        cell.Title.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        self.tableView.isHidden = true
        
        removeannotations()
        
        pincoordinate = CLLocation(latitude: placemarks[indexPath.row].latitude, longitude: placemarks[indexPath.row].longitude)
        
        selectedPlacemark = placemarks[indexPath.row]
        
        
        
        
        setPinUsingMKAnnotation(location: placemarks[indexPath.row])
        
    }
    
    func setPinUsingMKAnnotation(location: Placemark) {
       let pin1 = MapPin(title: location.locationName, locationName: location.locationName, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
       let coordinateRegion = MKCoordinateRegion(center: pin1.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
       mapview.setRegion(coordinateRegion, animated: true)
       mapview.addAnnotations([pin1])
        
       bottomsheetsetinfo()
       bottomSheetVC.setuptext()
       bottomSheetVC.moveview(state: .open)
        
        bottomSheetFav.fstate = false
        
    }
    
    func removeannotations() {
        let allAnnotations = self.mapview.annotations
        self.mapview.removeAnnotations(allAnnotations)
    }
    
    func bottomsheetsetinfo(){
        if let currcoordinate = currentcoordinate  {
                bottomSheetVC.currentcoordinate = currcoordinate
            }
            
            if let pcoordinate = pincoordinate  {
                       bottomSheetVC.pincoordinate = pcoordinate
            }
            
            if let slocation = selectedPlacemark  {
                bottomSheetVC.locationdetail = slocation
            }
    }
}

extension MapViewController: bottomsheetDelegate{
    func sendsubmitdata(aliasName: String) {
        guard let sp = selectedPlacemark else {
            return
        }
        selectedLocation = SelectedLocation(item: sp, aName: aliasName)
        
        self.delegate?.locationtextfield(selectedlocation: self.selectedLocation!)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func senddata() {

        guard let loc = selectedPlacemark else{
            return
        }
        
        alertbox(selectedlocation: loc)

    }
    
    func close() {
        //reset map and search bar
        render()
        removeannotations()
        
        searchBar.text = ""
        searchBar.showsCancelButton = false
        
        bottomSheetFav.reopenView()

        
//        guard let loc = selectedPlacemark else {
//            return
//        }
        
        //delegate?.locationtextfield(selectedlocation: loc)
        
    }
    
    func alertbox(selectedlocation: Placemark){
        
        
        let ac = UIAlertController(title: "Rename Location", message: nil, preferredStyle: .alert)
         ac.addTextField { (textField) in

            textField.frame = CGRect(x: 20, y: 100, width: 300, height: 80)
            textField.text = selectedlocation.locationName
        }
    

           let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            guard let answer = ac.textFields?[0].text else {
                
                self.selectedLocation = SelectedLocation(item: selectedlocation)
                
                self.delegate?.locationtextfield(selectedlocation: self.selectedLocation!)
                
                
                self.dismiss(animated: true, completion: nil)
                return
            }
            
            
            self.selectedLocation = SelectedLocation(item: selectedlocation, aName: answer)

            
            self.delegate?.locationtextfield(selectedlocation: self.selectedLocation!)

            
            self.dismiss(animated: true, completion: nil)

            
           }

           ac.addAction(submitAction)

           present(ac, animated: true)
        

    }
    
    
}

extension MapViewController : gestureprotocol{
    func gesturep(state: GState) {
        switch state {
        case .full:
            print("full")
            //self.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
            self.isModalInPresentation = true
        case .partial:
            print("partial")
            //self.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = true
            self.isModalInPresentation = false


            
        }
    }
    
    
}


