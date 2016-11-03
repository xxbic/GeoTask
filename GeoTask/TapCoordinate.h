//
//  TapCoordinate.h
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WorkingArea;

NS_ASSUME_NONNULL_BEGIN

@interface TapCoordinate : NSManagedObject

+ (void)deleteAll;

@end

NS_ASSUME_NONNULL_END

#import "TapCoordinate+CoreDataProperties.h"
