//
//  DetailsView.h
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol POIDetailsViewDelegate <NSObject>
- (void)addNewActivity;
@end

@interface POIDetailsView : UIView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id <POIDetailsViewDelegate> delegate;

@end
