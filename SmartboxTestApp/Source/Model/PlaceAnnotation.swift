//
//  PlaceAnnotation.swift
//  SmartboxTestApp
//
//  Created by Andrew on 1/15/19.
//  Copyright © 2019 Andrew. All rights reserved.
//

import MapKit

class PlaceAnnotation: NSObject, MKAnnotation {
    let title: String?
    let placeType: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, placeType: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.placeType = placeType
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return placeType
    }
}
