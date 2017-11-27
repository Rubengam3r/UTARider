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
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let menuButton = UIBarButtonItem(image: UIImage(named:"icon-menu")?.withRenderingMode(.alwaysOriginal),style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItem = (menuButton)
    }
   // THIS CODE IS ONLY CALLED ONCE IF menueLanucher is nil
    lazy var menuLauncher: MenuLauncher = {
        let launcher = MenuLauncher()
        launcher.mainView = self
        return launcher
    }()
    
    @objc func handleMore() {
        menuLauncher.ShowMenu()
       
    }
    func showControllerForMenu(menu: Menu) {
        if menu.name == "Plan My Trip" {
            performSegue(withIdentifier: "TripPlanner", sender: nil)
        }
        else if menu.name == "Alerts & Detours"{
            performSegue(withIdentifier: "AlertsDetours", sender: nil)
        }
        else if menu.name == "Contact Dispatch"{
            let dispatchNum: NSURL = URL(string: "TEL://8017433882")! as NSURL
            UIApplication.shared.open(dispatchNum as URL, options: [:], completionHandler: nil)
        }

       //let dummyMenuViewController = UIViewController()
        //navigationController?.pushViewController(dummyMenuViewController, animated: true)
    }
    
}
