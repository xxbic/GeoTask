//
//  Activity.h
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "POI.h"

NS_ASSUME_NONNULL_BEGIN

@interface Activity : NSManagedObject

- (void)save;
+ (void)deleteAll;
+ (void)createActivityForPOI:(POI *)poi withCompletion:(void (^)(Activity *activity))completion;

@end

NS_ASSUME_NONNULL_END

#import "Activity+CoreDataProperties.h"
