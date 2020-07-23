//
//  SelectedLocation.swift
//  SList
//
//  Created by naga vineel golla on 7/21/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import MapKit

struct SelectedLocation {
    let locationName: String
    let locationCoordinate: CLLocationCoordinate2D
    let thoroughfare: String?
    let aliasName: String?
    
    init(locationName: String,locationCoordinate: CLLocationCoordinate2D, thoroughfare: String, aliasName: String ) {
        self.locationName = locationName
        self.locationCoordinate = locationCoordinate
        self.thoroughfare = thoroughfare
        self.aliasName = aliasName
    }
    
    
    init (item: Placemark, aName: String){
        locationName = item.locationName
        locationCoordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        thoroughfare = item.thoroughfare
        aliasName = aName
    }
    
    init (item: Placemark){
        locationName = item.locationName
        locationCoordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
        thoroughfare = item.thoroughfare
        aliasName = item.locationName
    }
}
