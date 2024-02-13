//
//  AddAlbumViewController.swift
//  GeoBoothStoryboard
//
//  Created by Gregorius Yuristama Nugraha on 2/12/24.
//

import UIKit
import MapKit

class AddAlbumTableViewController: UITableViewController {

    @IBOutlet weak var addAlbumTextFIeld: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 20
        self.setupLocationManager()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doAddAlbum(_ sender: Any) {
        // TODO: Change to CoreData add Album
        print(addAlbumTextFIeld.text)
        print(LocationServices.shared.locationManager.location)
    }
}
extension AddAlbumTableViewController: ChangeLocationAuthDelegate {
    private func setupLocationManager() {
        LocationServices.shared.locationManager.requestWhenInUseAuthorization()
        LocationServices.shared.changeAuthDelegate = self
    }
    
    private func followUserIfPossible(authStatus: CLAuthorizationStatus) {
        if authStatus == .authorizedWhenInUse {
            mapView.setUserTrackingMode(.follow, animated: true)
        } else if authStatus == .authorizedAlways {
            LocationServices.shared.locationManager.allowsBackgroundLocationUpdates = true
            mapView.setUserTrackingMode(.follow, animated: true)
        }
    }
    
    func authorizationChanged(authStatus: CLAuthorizationStatus) {
        followUserIfPossible(authStatus: authStatus)
    }
}
