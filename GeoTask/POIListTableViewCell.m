//
//  ListTableViewCell.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIListTableViewCell.h"
#import "Masonry.h"

@interface POIListTableViewCell()
@property (nonatomic, strong) UILabel *textViewDistance;

@end

@implementation POIListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.textViewDistance];
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (UILabel *)textViewDistance{
    if (!_textViewDistance) {
        _textViewDistance = [UILabel new];
        _textViewDistance.backgroundColor = [UIColor lightGrayColor];
    }
    return _textViewDistance;
}

- (void)setDistanceText:(NSString *)text{
    self.textViewDistance.text = text;
}

- (void)updateConstraints{
    
    
    [self.textViewDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(5);
        make.right.equalTo(self).mas_offset(-5);
        make.top.equalTo(self);
        make.bottom.equalTo(self).mas_offset(-5);
    }];
    
    [super updateConstraints];
    
}

@end
