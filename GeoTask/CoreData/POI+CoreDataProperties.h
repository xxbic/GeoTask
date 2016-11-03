//
//  POI+CoreDataProperties.h
//  GeoTask
//
//  Created by Denis Katic on 03/11/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "POI.h"

NS_ASSUME_NONNULL_BEGIN

@interface POI (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSString *localId;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *distance;
@property (nullable, nonatomic, retain) NSSet<Activity *> *activity;

@end

@interface POI (CoreDataGeneratedAccessors)

- (void)addActivityObject:(Activity *)value;
- (void)removeActivityObject:(Activity *)value;
- (void)addActivity:(NSSet<Activity *> *)values;
- (void)removeActivity:(NSSet<Activity *> *)values;

@end

NS_ASSUME_NONNULL_END
