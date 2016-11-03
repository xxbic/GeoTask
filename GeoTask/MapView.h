//
//  MainView.h
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GMSMapView.h>

@protocol MapViewDelegate <NSObject>

- (void)buttonDrawPressed;
- (void)buttonDonePressed;
- (void)buttonCancelPressed;

@end

@interface MapView : UIView
@property (nonatomic, strong) GMSMapView *googleMapView;
@property (nonatomic, weak) id <MapViewDelegate> delegate;
@end
