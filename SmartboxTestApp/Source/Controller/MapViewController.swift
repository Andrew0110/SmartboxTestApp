//
//  MapViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController {
    
    @IBOutlet weak private var mapView: MKMapView!
    
    private var place: Place?
    private let regionRadius: CLLocationDistance = 3000
    
    //   MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePosition()
    }
    
    //  MARK: - Setters
    func setPlace(_ place: Place) {
        self.place = place
    }
    
    //   MARK: - Map Actions
    private func updatePosition() {
        guard let place = place else { return }
        let location = CLLocation(latitude: Double(place.latitude) ?? 0.0, longitude: Double(place.longitude) ?? 0.0)
        
        centerMapOnLocation(location: location)
        addAnnotation()
    }
    
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func addAnnotation() {
        guard let place = place else { return }
        let annotation = PlaceAnnotation(title: place.title,
                                         placeType: place.type.rawValue,
                                         coordinate: CLLocationCoordinate2D(latitude: Double(place.latitude) ?? 0.0, longitude: Double(place.longitude) ?? 0.0))
        mapView.addAnnotation(annotation)
    }
    
    //   MARK: - Actions
    @IBAction private func backButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
