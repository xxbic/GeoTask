//
//  POIActivityTableViewCell.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIActivityTableViewCell.h"
#import "Masonry.h"

@interface POIActivityTableViewCell()
@property (nonatomic, strong) UILabel *textViewTitle;
@property (nonatomic, strong) UILabel *textViewDescription;
@end

@implementation POIActivityTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.textViewTitle];
        [self.contentView addSubview:self.textViewDescription];
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}


- (UILabel *)textViewTitle{
    if (!_textViewTitle) {
        _textViewTitle = [UILabel new];
        _textViewTitle.backgroundColor = [UIColor lightGrayColor];
    }
    return _textViewTitle;
}

- (UILabel *)textViewDescription{
    if (!_textViewDescription) {
        _textViewDescription = [UILabel new];
        _textViewDescription.backgroundColor = [UIColor lightGrayColor];
        
    }
    return _textViewDescription;
}

- (void)setTitleText:(NSString *)text{
    self.textViewTitle.text = text;
}

- (void)setDescriptionText:(NSString *)text{
    self.textViewDescription.text = text;
}

- (void)updateConstraints{
    
    [self.textViewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.top.equalTo(self).mas_offset(10);
        make.height.mas_equalTo(30);
    }];
    
    [self.textViewDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(self).mas_offset(-10);
    }];
    
    [super updateConstraints];
    
}

@end
