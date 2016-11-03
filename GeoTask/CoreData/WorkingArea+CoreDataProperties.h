//
//  WorkingArea+CoreDataProperties.h
//  GeoTask
//
//  Created by Denis Katic on 03/11/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "WorkingArea.h"

NS_ASSUME_NONNULL_BEGIN

@interface WorkingArea (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<TapCoordinate *> *tapcoordinate;

@end

@interface WorkingArea (CoreDataGeneratedAccessors)

- (void)addTapcoordinateObject:(TapCoordinate *)value;
- (void)removeTapcoordinateObject:(TapCoordinate *)value;
- (void)addTapcoordinate:(NSSet<TapCoordinate *> *)values;
- (void)removeTapcoordinate:(NSSet<TapCoordinate *> *)values;

@end

NS_ASSUME_NONNULL_END
