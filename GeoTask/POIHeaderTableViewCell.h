//
//  DetailsTableCell.h
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface POIHeaderTableViewCell : UITableViewHeaderFooterView

- (void)setAddress:(NSString *)address;
- (void)setLatitude:(NSNumber *)latitude;
- (void)setLongitude:(NSNumber *)longitude;


@end
