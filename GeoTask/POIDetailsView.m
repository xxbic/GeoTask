//
//  DetailsView.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIDetailsView.h"
#import "Masonry.h"

@interface POIDetailsView()
@property (nonatomic, strong) UIButton *buttonAddNewActivity;
@end

@implementation POIDetailsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.tableView];
        [self addSubview:self.buttonAddNewActivity];
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
    }
    return _tableView;
}

- (UIButton *)buttonAddNewActivity{
    if (!_buttonAddNewActivity) {
        _buttonAddNewActivity = [UIButton new];
        _buttonAddNewActivity.backgroundColor = [UIColor lightGrayColor];
        [_buttonAddNewActivity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonAddNewActivity setTitle:@"Add new activity" forState:UIControlStateNormal];
        [_buttonAddNewActivity addTarget:self action:@selector(buttonAddNewActivityPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonAddNewActivity;
}

- (void)buttonAddNewActivityPressed:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(addNewActivity)]){
        [self.delegate addNewActivity];
    }
}

- (void)updateConstraints{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.bottom.equalTo(self.buttonAddNewActivity.mas_top).mas_offset(-10);
        make.left.equalTo(self);
        make.right.equalTo(self);
    }];
    
    [self.buttonAddNewActivity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_equalTo(-10);
        make.bottom.equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(60);
    }];
    
    [super updateConstraints];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
