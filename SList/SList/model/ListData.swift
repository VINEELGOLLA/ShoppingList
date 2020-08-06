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
    let uuid = UUID()
    var listName: String
    var quantityvalue: Int = 1
    let order: Int
    let itemDate = Date()
    var mark: Bool = false
    
    var star : Bool = false
    var Quantitytype: Int = 0
    var Priority: Int = 0
    var notes : String?
    
    init( listname: String, order: Int, mark: Bool) {
        self.listName = listname
        self.order = order
        self.mark = mark
    }
}
