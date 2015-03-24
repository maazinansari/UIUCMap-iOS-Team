//
//  ViewController.m
//  ObjCMap
//
//  Created by Maazin Ansari on 3/19/15.
//  Copyright (c) 2015 Maazin Ansari. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation ViewController {
    CLLocationManager *manager_;
    GMSMapView *mapView_;
    GMSMarker         *locationMarker_;
}

- (void)viewDidLoad {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude: 40.109900
                                                            longitude:-88.227174
                                                                 zoom:14];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.settings.myLocationButton = NO;
    mapView_.settings.indoorPicker = NO;
    mapView_.myLocationEnabled = YES;
    
    
    // Setup location services
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"Please enable location services");
        return;
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        NSLog(@"Please authorize location services");
        return;
    }
    
    // Listen to the myLocation property of GMSMapView.
    [mapView_ addObserver:self
               forKeyPath:@"myLocation"
                  options:NSKeyValueObservingOptionNew
                  context:NULL];
    
    self.view = mapView_;
    
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        mapView_.myLocationEnabled = YES;
    });

    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.109850, -88.227174);
    marker.title = @"Illini Union";
    marker.snippet = @"No Events";
    marker.tappable = YES;
    marker.map = mapView_;
    //linker button here
    
    
    
//    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(10, 10);
//    GMSMarker *marker = [GMSMarker markerWithPosition:position];
//    marker.title = @"Hello World";
//    marker.map = mapView_;
}
@end
