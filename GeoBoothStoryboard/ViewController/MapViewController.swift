//
//  MapViewController.swift
//  GeoBoothStoryboard
//
//  Created by Gregorius Yuristama Nugraha on 2/12/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocationManager()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupLocationManager() {
        LocationServices.shared.locationManager.requestWhenInUseAuthorization()
        LocationServices.shared.changeAuthDelegate = self
    }
    
    func followUserIfPossible(authStatus: CLAuthorizationStatus) {
        if authStatus == .authorizedWhenInUse {
            mapView.setUserTrackingMode(.follow, animated: true)
        } else if authStatus == .authorizedAlways {
            LocationServices.shared.locationManager.allowsBackgroundLocationUpdates = true
            mapView.setUserTrackingMode(.follow, animated: true)
        }
    }

}

extension MapViewController: ChangeLocationAuthDelegate {
    func authorizationChanged(authStatus: CLAuthorizationStatus) {
        followUserIfPossible(authStatus: authStatus)
    }
    
}

