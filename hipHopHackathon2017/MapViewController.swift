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
        zoom()
    }
    
    // Taken from Annie's work on Cheers
    
    // MARK: - CoreLocation Delegate
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
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
            self.locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.first else { return }
    }
    
    // MARK: - Mapview Delegate
    
    func zoom() {
        // zoom to show all markers, resource: http://stackoverflow.com/questions/3434020/ios-mkmapview-zoom-to-show-all-markers
        let region = MKCoordinateRegion()
        self.mapView.setRegion(self.mapView.regionThatFits(region), animated: true)
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance((locationManager.location?.coordinate)!, 1000, 1000)
        self.mapView.setRegion(coordinateRegion, animated: true)
        DispatchQueue.main.async {
            
            let annotation: MKPointAnnotation = MKPointAnnotation()
            annotation.coordinate = (self.locationManager.location?.coordinate)!
            annotation.title = "This is you!"
            self.mapView.addAnnotation(annotation)
            let cirlceOverLay: MKCircle = MKCircle(center: annotation.coordinate, radius: 100.0)
            self.mapView.add(cirlceOverLay)
        }
    }
    
    // not currently working...
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let circleOverlayRenderer: MKCircleRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
//        circleOverlayRenderer.fillColor = UIColor.orange.withAlphaComponent(0.25)
//        circleOverlayRenderer.strokeColor = .orange
//        circleOverlayRenderer.lineWidth = 3.0
//        return circleOverlayRenderer
//    }
    
    // update mapview based on user movements
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    

}
