//
//  LocationManager.swift
//  hipHopHackathon2017
//
//  Created by Marty Avedon on 6/27/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit
import CoreLocation

func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
        manager.startUpdatingLocation()
    case .denied, .restricted:
        let alertController = UIAlertController(title: "Request denied!", message: "We can't currently access your location. We were denied or restricted from having that info. Sorry!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        // add alert controller sweetener from graphy
        //self.present(alertController, animated: true, completion: nil)
    default:
        print("")
        // hmmmm...add this uiview specific stuff in as a parameter?
        // self.locationManager.requestAlwaysAuthorization()
    }
}

func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let _ = locations.first else { return }
}

