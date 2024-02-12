//
//  CustomUserLocationDelegate.swift
//  GeoBoothUIKit
//
//  Created by Gregorius Yuristama Nugraha on 2/9/24.
//

import Foundation
import CoreLocation

protocol ChangeLocationAuthDelegate: AnyObject {
    func authorizationChanged(authStatus: CLAuthorizationStatus)
}
