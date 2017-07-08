//
//  MapViewController.swift
//  hipHopHackathon2017
//
//  Created by C4Q on 6/24/17.
//  Copyright © 2017 Marty Hernandez Avedon. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager: CLLocationManager = {
        let location: CLLocationManager = CLLocationManager()
        location.desiredAccuracy = kCLLocationAccuracyHundredMeters
        location.distanceFilter = 50.0
        return location
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        zoom(manager: locationManager, mapView: mapView)
    }
}

// map display & authorization

extension MapViewController {
    func locate(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .denied, .restricted:
            let alertController = UIAlertController(title: "Request denied!", message: "We can't currently access your location. We were denied or restricted from having that info. Sorry!", preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        default:
            print("We need to authorize")
            manager.requestAlwaysAuthorization()
        }
    }
    
    // zoom in on current location
    
    func zoom(manager: CLLocationManager, mapView: MKMapView) {
        // zoom to show all markers, resource: http://stackoverflow.com/questions/3434020/ios-mkmapview-zoom-to-show-all-markers
        let region = MKCoordinateRegion()
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, 1000, 1000)
        mapView.setRegion(coordinateRegion, animated: true)
        DispatchQueue.main.async {
            
            let annotation: MKPointAnnotation = MKPointAnnotation()
            
            annotation.coordinate = (manager.location?.coordinate)!
            annotation.title = "This is you!"
            
            mapView.addAnnotation(annotation)
            
            let cirlceOverLay: MKCircle = MKCircle(center: annotation.coordinate, radius: 100.0)
            
            mapView.add(cirlceOverLay)
        }
    }
    
    // alter color of circle overlay
    
    func mapView(mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleOverlayRenderer: MKCircleRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
        
        circleOverlayRenderer.fillColor = UIColor(red: 158/255, green: 170/255, blue: 237/255, alpha: 0.25)
        circleOverlayRenderer.strokeColor = UIColor(red: 158/255, green: 170/255, blue: 237/255, alpha: 1)
        circleOverlayRenderer.lineWidth = 3.0
        
        return circleOverlayRenderer
    }
    
    // update mapview based on user movements
    
    func recenter(mapView: MKMapView, forCurrentLocation userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }

    // ??
//    func locate(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let _ = locations.first else { return }
//    }
    
}
