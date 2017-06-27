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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleOverlayRenderer: MKCircleRenderer = MKCircleRenderer(circle: overlay as! MKCircle)
        circleOverlayRenderer.fillColor = UIColor(red: 158/255, green: 170/255, blue: 237/255, alpha: 0.25)
        circleOverlayRenderer.strokeColor = UIColor(red: 158/255, green: 170/255, blue: 237/255, alpha: 1)
        circleOverlayRenderer.lineWidth = 3.0
        return circleOverlayRenderer
    }
    
    // update mapview based on user movements
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    

}
