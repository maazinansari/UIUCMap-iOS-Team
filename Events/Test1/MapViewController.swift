//
//  ViewController.swift
//  Test1
//
//  Created by Ignatius Ian on 6/3/15.
//  Copyright (c) 2015 Ignatius Ian. All rights reserved.
//

import UIKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var marker: GMSMarker?
    
    @IBAction func showOnMap(segue: UIStoryboardSegue){
            println("segue check")
            let showEventController = segue.sourceViewController as EventListViewController
            let focusAddress = showEventController.address
            var position = showEventController.coords
            //position = CLLocationCoordinate2DMake(10, 10)
            let name = showEventController.name
            /*var geocoder = CLGeocoder()
            geocoder.geocodeAddressString (focusAddress, {(placesmarks: AnyObject[]!, error: NSError!)-> Void
                if let placemark = placemarks?[0] as? CLPlacemark {
                    self.mapView.addAnnotation(MKPlacemark(placemark: placemark))}
                })*/
            marker = GMSMarker(position: position!)
            println("is marker working? I hope so")
            marker!.title = name
            //marker!.map = mapView
    }
    
        
    let locationManager=CLLocationManager()
    
    // 1
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 2
        if status == .AuthorizedWhenInUse {
            
            // 3
            locationManager.startUpdatingLocation()
            
            //4
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    // 5
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        if let location = locations.first as? CLLocation {
            
            // 6
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            
            // 7
            locationManager.stopUpdatingLocation()
        }
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response , error in
            if let address = response?.firstResult() {
                
                // 3
                let lines = address.lines as [String]
                self.addressLabel.text = join("\n", lines)
                self.addressLabel.backgroundColor=UIColor.whiteColor()
                let labelHeight=self.addressLabel.intrinsicContentSize().height
                self.mapView.padding=UIEdgeInsets(top:self.topLayoutGuide.length, left:0,bottom:labelHeight,right:0)
                
                // 4
                UIView.animateWithDuration(0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }


    
    func mapView(mapView: GMSMapView!, idleAtCameraPosition position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(position.target)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate=self
        println("loading")
        /*var position = CLLocationCoordinate2DMake(10, 10)
        var marker = GMSMarker(position: position)
        marker.title = "test"
        marker.map = mapView*/
        
        if let marker = marker {
            marker.map = mapView
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        
        navigationItem.title = "Map"
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

