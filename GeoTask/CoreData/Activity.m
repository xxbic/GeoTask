//
//  Activity.m
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "Activity.h"
#import "MagicalRecord.h"
#import "NSManagedObjectContext+MagicalSaves.h"

@implementation Activity

- (void)save{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (void)deleteAll{
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext * _Nonnull localContext) {
        NSArray *activities = [Activity MR_findAll];
        for (Activity *activity in activities) {
            [activity MR_deleteEntityInContext:localContext];
        }
    }];
}

+ (void)createActivityForPOI:(POI *)poi withCompletion:(void (^)(Activity *activity))completion{
    
    NSManagedObjectContext *context = [NSManagedObjectContext MR_defaultContext];
    Activity *activity = [Activity MR_createEntityInContext:context];
    [poi.activity setByAddingObject:activity];
    [context MR_saveToPersistentStoreAndWait];
    completion(activity);
    
}
@end
