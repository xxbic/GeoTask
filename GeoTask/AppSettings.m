//
//  AppConfiguration.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "AppSettings.h"
#import "BFApp.h"
#import "LocationController.h"

@implementation AppSettings

+ (AppSettings *)sharedInstance {
    
    static AppSettings *appSettings = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        appSettings = [[AppSettings alloc] init];
    });
    
    return appSettings;
}

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)setup{

    [self setupDatabase];
    [self startLocationController];
    [self configureGoogleMapsAPI];
    
}

- (void)startLocationController{
    [LocationController sharedInstance];
}

- (void)configureGoogleMapsAPI{
    [GMSServices provideAPIKey:kAPIKey];
}

- (void)setupDatabase
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"GeoTaskDB.sqlite"];
    NSLog(@"%@", [NSPersistentStore MR_urlForStoreName:[MagicalRecord defaultStoreName]]);
}


@end
