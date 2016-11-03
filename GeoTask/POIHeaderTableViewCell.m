//
//  DetailsTableCell.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIHeaderTableViewCell.h"
#import "Masonry.h"

@interface POIHeaderTableViewCell()
@property (nonatomic, strong) UILabel *labelViewAddress;
@property (nonatomic, strong) UILabel *labelViewLatitude;
@property (nonatomic, strong) UILabel *labelViewLongitude;
@end

@implementation POIHeaderTableViewCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.labelViewAddress];
        [self.contentView addSubview:self.labelViewLatitude];
        [self.contentView addSubview:self.labelViewLongitude];
        self.contentView.backgroundColor = [UIColor lightGrayColor];
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (UILabel *)labelViewAddress{
    if (!_labelViewAddress) {
        _labelViewAddress = [UILabel new];
    }
    return _labelViewAddress;
}

- (UILabel *)labelViewLatitude{
    if (!_labelViewLatitude) {
        _labelViewLatitude = [UILabel new];
    }
    return _labelViewLatitude;
}

- (UILabel *)labelViewLongitude{
    if (!_labelViewLongitude) {
        _labelViewLongitude = [UILabel new];
    }
    return _labelViewLongitude;
}

- (void)setAddress:(NSString *)address{
    self.labelViewAddress.text = address;
}

- (void)setLatitude:(NSNumber *)latitude{
    self.labelViewLatitude.text = [NSString stringWithFormat:@"Latitude: %f", latitude.floatValue];
}

- (void)setLongitude:(NSNumber *)longitude{
    self.labelViewLongitude.text = [NSString stringWithFormat:@"Longitude: %f", longitude.floatValue];;
}

- (void)updateConstraints{
    
    [self.labelViewAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.top.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    [self.labelViewLatitude mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.top.equalTo(self.labelViewAddress.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(25);
    }];
    
    [self.labelViewLongitude mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.top.equalTo(self.labelViewLatitude.mas_bottom).mas_offset(5);
        make.height.mas_equalTo(25);
    }];
    
    [super updateConstraints];
    
}

@end
