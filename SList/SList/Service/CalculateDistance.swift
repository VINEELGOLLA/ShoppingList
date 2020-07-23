//
//  CalculateDistance.swift
//  SList
//
//  Created by naga vineel golla on 7/21/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CalculateDistance {
    
    static func calculateDistancefrom(sourceLocation: MKMapItem, destinationLocation: MKMapItem, doneSearching: @escaping (_ distance: CLLocationDistance, _ time : TimeInterval) -> Void) {

        let request: MKDirections.Request = MKDirections.Request()

        request.source = sourceLocation
        request.destination = destinationLocation

        request.requestsAlternateRoutes = true
        request.transportType = .automobile

        let directions = MKDirections(request: request)
        directions.calculate { (directions, error) in
            if var routeResponse = directions?.routes {
                routeResponse.sort(by: {$0.expectedTravelTime <
                    $1.expectedTravelTime})
                let quickestRouteForSegment: MKRoute = routeResponse[0]
                
                //print(quickestRouteForSegment.expectedTravelTime)
                doneSearching(quickestRouteForSegment.distance, quickestRouteForSegment.expectedTravelTime)
            }
        }
    }
    
    static func getDistance(startLocation : CLLocation, endLocation : CLLocation, completionHandler: @escaping (_ distance: CLLocationDistance, _ time: TimeInterval) -> Void) {

        let destinationItem =  MKMapItem(placemark: MKPlacemark(coordinate: startLocation.coordinate))
        let sourceItem      =  MKMapItem(placemark: MKPlacemark(coordinate: endLocation.coordinate))
        self.calculateDistancefrom(sourceLocation: sourceItem, destinationLocation: destinationItem, doneSearching: { distance, time in
            completionHandler(distance, time)
        })
    }
}
