//
//  POI.h
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "LocationController.h"

@class Activity, WorkingArea;

NS_ASSUME_NONNULL_BEGIN

@interface POI : NSManagedObject

+ (POI *)findPOIByLocalId:(NSString*)localId;
+ (NSArray *)findAll;
+ (NSArray *)findAllSortedByDistance;
+ (void)createPOIonLocation:(CLLocationCoordinate2D)location withCompletion:(void (^)(NSString *id))completion;
+ (void)deleteAll;


@end

NS_ASSUME_NONNULL_END

#import "POI+CoreDataProperties.h"
