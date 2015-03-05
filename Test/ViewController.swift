//
//  ViewController.swift
//  First Map
//
//  Created by Maazin Ansari on 3/2/15.
//  Copyright (c) 2015 Maazin Ansari. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var firstMapTest: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Loclatitude: CLLocationDegrees = 40.110500
        var Loclongitude: CLLocationDegrees = -88.228400
        
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        
        var firstLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(Loclatitude, Loclongitude)
        
        var theSpan: MKCoordinateSpan = MKCoordinateSpanMake(lonDelta, lonDelta)
        var theRegion: MKCoordinateRegion = MKCoordinateRegionMake(firstLocation, theSpan)
        
        self.firstMapTest.setRegion(theRegion, animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}