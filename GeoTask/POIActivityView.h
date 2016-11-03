//
//  ActivityView.h
//  GeoTask
//
//  Created by Denis Katic on 30/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol POIActivityViewDelegate <NSObject>
- (void)saveActivity;
@end

@interface POIActivityView : UIView

@property (nonatomic, weak) id <POIActivityViewDelegate> delegate;

- (void)setDescription:(NSString *)description;
- (NSString *)getDescription;

- (void)setTitle:(NSString *)title;
- (NSString *)getTitle;

@end
