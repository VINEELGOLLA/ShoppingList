//
//  ListData.swift
//  SList
//
//  Created by naga vineel golla on 7/23/20.
//  Copyright © 2020 naga vineel golla. All rights reserved.
//

import Foundation
import MapKit

struct ListData {
    let listName: String
    let quantityvalue: Int?
    let order: Int
    let Date: Date
    var mark: Bool
    
    init( listname: String, quantityvalue: Int, order: Int, date: Date, mark: Bool) {
        self.listName = listname
        self.quantityvalue = quantityvalue
        self.order = order
        self.Date = date
        self.mark = mark
    }
}
