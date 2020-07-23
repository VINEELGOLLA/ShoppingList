//
//  Placemark.swift
//  SList
//
//  Created by naga vineel golla on 7/20/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import MapKit

struct Placemark {
    
    let locationName: String
    let thoroughfare: String?
    let latitude: Double
    let longitude: Double
    
    init(item: MKMapItem) {
        
        
        var locationN: String = ""
        var locationAddress : String = ""
        let lat  = item.placemark.coordinate.latitude
        let long = item.placemark.coordinate.longitude
        
        if let name = item.name {
            locationN += "\(name)"
        }

        
        if let locality = item.placemark.locality, locality != item.name {
            locationAddress += "\( locality) ,"
        }

        if let administrativeArea = item.placemark.administrativeArea,
            administrativeArea != item.placemark.locality {
            locationAddress += "\(administrativeArea) ,"
        }

        if let country = item.placemark.country, country != item.name {
            locationAddress += "\(country) ,"
        }

        if let thoroughfare = item.placemark.thoroughfare {
            locationAddress += "\(thoroughfare)"
        }
        
        locationName = locationN
        thoroughfare = locationAddress
        latitude = lat
        longitude = long
    }
}

