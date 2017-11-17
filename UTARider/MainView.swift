//
//  MainView.swift
//  UTARider
//
//  Created by Matthew Ruben on 11/16/17.
//  Copyright © 2017 Rubenmobile. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MainView: UITableViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var MapView: MKMapView!
    
    var locationManger = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations [0] // gets the most recent position of the user
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: span)
        self.MapView.setRegion(region, animated: true)
        self.MapView.showsUserLocation = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
    }
    
    
}
