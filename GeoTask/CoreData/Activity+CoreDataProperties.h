//
//  Activity+CoreDataProperties.h
//  GeoTask
//
//  Created by Denis Katic on 02/11/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Activity.h"

NS_ASSUME_NONNULL_BEGIN

@interface Activity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *activityDescription;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) POI *poi;

@end

NS_ASSUME_NONNULL_END
