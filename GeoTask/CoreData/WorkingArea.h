//
//  WorkingArea.h
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TapCoordinate;

NS_ASSUME_NONNULL_BEGIN

@interface WorkingArea : NSManagedObject

+ (NSArray *)findAll;
- (NSArray *)getAllTouches;
+ (void)deleteAll;
- (void)save;

@end

NS_ASSUME_NONNULL_END

#import "WorkingArea+CoreDataProperties.h"
