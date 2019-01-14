//
//  MapViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var place: TTPlace?
    private let regionRadius: CLLocationDistance = 1000

    override func viewDidLoad() {
        super.viewDidLoad()

        updatePosition()
    }
    
    private func updatePosition() {
        guard let place = place else { return }
        let location = CLLocation(latitude: Double(place.latitude) ?? 0.0, longitude: Double(place.longitude) ?? 0.0)
        
        centerMapOnLocation(location: location)
    }
    
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction private func backButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
