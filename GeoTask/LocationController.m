//
//  LocationController.m
//  GeoTask
//
//  Created by Denis Katic on 01/11/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "LocationController.h"

static LocationController* sharedCLDelegate = nil;

@implementation LocationController

+ (LocationController *)sharedInstance
{
    static LocationController *sharedLocationControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLocationControllerInstance = [[self alloc] init];
    });
    return sharedLocationControllerInstance;
}

- (id)init
{
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]){
            [self.locationManager requestAlwaysAuthorization];
        }
        
        [self.locationManager startMonitoringSignificantLocationChanges];
        [self.locationManager startUpdatingLocation];
        
    }
    return self;
}

- (void)getAddressForLocation:(CLLocationCoordinate2D)location withCompletion:(void (^)(NSString *, NSError *))completion{
    
    GMSGeocoder *geocoder = [GMSGeocoder geocoder];
    [geocoder reverseGeocodeCoordinate:location completionHandler:^(GMSReverseGeocodeResponse *response, NSError *error) {
        if (error || (response.firstResult.thoroughfare == nil &&
                      response.firstResult.locality == nil)) {
            completion(nil, error);
        }else{
            NSString *address = [NSString stringWithFormat:@"%@, %@", response.firstResult.thoroughfare, response.firstResult.locality];
            completion(address, error);
        }
    }];
}



- (void)locationManager:(CLLocationManager*)manager
    didUpdateToLocation:(CLLocation*)newLocation
           fromLocation:(CLLocation*)oldLocation
{
    if (newLocation.coordinate.longitude != oldLocation.coordinate.longitude ||
        newLocation.coordinate.latitude != oldLocation.coordinate.latitude) {
        self.location = newLocation;
        [self.delegate locationUpdate:newLocation];
    }
}

- (void)locationManager:(CLLocationManager*)manager
       didFailWithError:(NSError*)error
{
    NSLog(@"CLLocationManager error:%@", error.localizedDescription);
}

@end