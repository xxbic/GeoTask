//
//  AddInfoViewController.h
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Activity.h"

@interface POIActivityViewController : UIViewController
- (instancetype)initWithPOI:(POI *)poi andActivity:(Activity *)activity;
@end
