//
//  MapPin.swift
//  SList
//
//  Created by naga vineel golla on 7/20/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import MapKit

class MapPin: NSObject, MKAnnotation {
   let title: String?
   let locationName: String
   let coordinate: CLLocationCoordinate2D
init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
      self.title = title
      self.locationName = locationName
      self.coordinate = coordinate
   }
}
