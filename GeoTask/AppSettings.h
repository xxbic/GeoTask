//
//  AppConfiguration.h
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MagicalRecord.h"
#import "Constants.h"
#import <GoogleMaps/GoogleMaps.h>

@interface AppSettings : NSObject

+ (AppSettings *)sharedInstance;
- (void)setup;

@end
