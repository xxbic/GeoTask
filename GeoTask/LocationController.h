//
//  LocationController.h
//  GeoTask
//
//  Created by Denis Katic on 01/11/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GMSMapView.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation*)location;
@optional
- (void)addressForLocation:(NSString*)address;

@end

@interface LocationController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, weak) id <LocationControllerDelegate> delegate;

+ (LocationController *)sharedInstance;

- (void)getAddressForLocation:(CLLocationCoordinate2D)location withCompletion:(void (^)(NSString *, NSError *))completion;

@end