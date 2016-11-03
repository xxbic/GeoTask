//
//  TapCoordinate.m
//  GeoTask
//
//  Created by Denis Katic on 31/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "TapCoordinate.h"
#import "WorkingArea.h"
#import "MagicalRecord.h"

@implementation TapCoordinate

+ (void)deleteAll{
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext * _Nonnull localContext) {
        NSArray *tapCoordinates = [TapCoordinate MR_findAll];
        for (TapCoordinate *tapCoordinate in tapCoordinates) {
            [tapCoordinate MR_deleteEntityInContext:localContext];
        }
    }];
}
@end
