//
//  POI.m
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POI.h"
#import "Activity.h"
#import "WorkingArea.h"
#import "MagicalRecord.h"
#import "BFKit.h"
@implementation POI

+ (NSArray *)findAll{
    return [POI MR_findAll];
}

+ (POI *)findPOIByLocalId:(NSString*)localId{
    return [POI MR_findFirstByAttribute:@"localId" withValue:localId];
}

+ (NSArray *)findAllSortedByDistance{

    NSArray *allPOIs = [POI MR_findAll];
    
    CLLocation *userLocation = [[LocationController sharedInstance] location];
    NSMutableDictionary *distances = [NSMutableDictionary dictionary];

    for (POI *poi in allPOIs) {
        CLLocation *location = [[CLLocation alloc] initWithLatitude:poi.latitude.floatValue longitude:poi.longitude.floatValue];
        CLLocationDistance distance = [location distanceFromLocation:userLocation];
        [distances setObject:poi forKey:@(distance)];
        
        poi.distance = [NSString stringWithFormat:@"%f", distance];
    }
    
    NSArray *sortedKeys = [[distances allKeys] sortedArrayUsingSelector:@selector(compare:)];    
    return [distances objectsForKeys:sortedKeys notFoundMarker:[NSNull null]];
}

+ (void)createPOIonLocation:(CLLocationCoordinate2D)location withCompletion:(void (^)(NSString *id))completion{
    
    LocationController *locationController = [LocationController sharedInstance];
    [locationController getAddressForLocation:location withCompletion:^(NSString *address, NSError *error) {
        NSString *UUID = [NSString generateUUID];
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            POI *poi = [POI MR_createEntityInContext:localContext];
            if (address) {
                poi.address = address;
            }else{
                poi.address = @"Unknown address";
            }
            poi.localId = UUID;
            poi.longitude = [NSNumber numberWithFloat:location.longitude];
            poi.latitude = [NSNumber numberWithFloat:location.latitude];
        }];
        completion(UUID);
    }];
}

+ (void)deleteAll{
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext * _Nonnull localContext) {
        NSArray *pois = [POI MR_findAll];
        for (POI *poi in pois) {
            [poi MR_deleteEntityInContext:localContext];
        }
    }];
}


@end
