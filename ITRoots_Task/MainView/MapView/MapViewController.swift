//
//  MapViewController.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupLocationManager()
    }
    
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            
            // Add a marker
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = "You are here"
            mapView.addAnnotation(annotation)
        }
    }
    
}
