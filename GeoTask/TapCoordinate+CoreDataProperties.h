//
//  TapCoordinate+CoreDataProperties.h
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TapCoordinate.h"

NS_ASSUME_NONNULL_BEGIN

@interface TapCoordinate (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSDate *createDate;
@property (nullable, nonatomic, retain) WorkingArea *workingarea;

@end

NS_ASSUME_NONNULL_END
