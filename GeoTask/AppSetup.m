//
//  AppConfiguration.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "AppSetup.h"
#import "BFApp.h"
#import "LocationController.h"

@implementation AppSetup

+ (void)setup{

    [AppSetup setupDatabase];
    [AppSetup startLocationController];
    [AppSetup configureGoogleMapsAPI];
}

+ (void)startLocationController{
    [LocationController sharedInstance];
}

+ (void)configureGoogleMapsAPI{
    [GMSServices provideAPIKey:kAPIKey];
}

+ (void)setupDatabase
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"GeoTaskDB.sqlite"];
    NSLog(@"%@", [NSPersistentStore MR_urlForStoreName:[MagicalRecord defaultStoreName]]);
}


@end
