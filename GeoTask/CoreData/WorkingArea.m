//
//  WorkingArea.m
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "WorkingArea.h"
#import "TapCoordinate.h"
#import "MagicalRecord.h"


@implementation WorkingArea

+ (NSArray *)findAll{
    return [WorkingArea MR_findAll];
}

- (NSArray *)getAllTouches{
    NSMutableArray *touches = [NSMutableArray arrayWithArray:[self.tapcoordinate allObjects]];
    [touches sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"createDate" ascending:YES]]];
    return touches;
}

+ (void)deleteAll{
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext * _Nonnull localContext) {
        NSArray *workingAreas = [WorkingArea MR_findAll];
        for (WorkingArea *woringArea in workingAreas) {
            [woringArea MR_deleteEntityInContext:localContext];
        }
    }];
}

- (void)save{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}


@end
