//
//  ActivityView.m
//  GeoTask
//
//  Created by Denis Katic on 30/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIActivityView.h"
#import "Masonry.h"

@interface POIActivityView()
@property (nonatomic, strong) UITextView *textViewDescription;
@property (nonatomic, strong) UITextField *textFieldTitle;
@property (nonatomic, strong) UIButton *buttonSave;

@end

@implementation POIActivityView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.textFieldTitle];
        [self addSubview:self.textViewDescription];
        [self addSubview:self.buttonSave];
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

- (NSString *)getDescription{
    return self.textViewDescription.text;
}
- (NSString *)getTitle{
    return self.textFieldTitle.text;
}

- (void)setDescription:(NSString *)description{
    self.textViewDescription.text = description;
}
- (void)setTitle:(NSString *)title{
    self.textFieldTitle.text = title;
}

- (UIButton *)buttonSave{
    if (!_buttonSave) {
        _buttonSave = [UIButton new];
        _buttonSave.backgroundColor = [UIColor lightGrayColor];
        [_buttonSave setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonSave setTitle:@"Save" forState:UIControlStateNormal];
        [_buttonSave addTarget:self action:@selector(buttonSavePressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonSave;
}

- (void)buttonSavePressed:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(saveActivity)]) {
        [self.delegate saveActivity];
    }
}

- (UITextView *)textViewDescription{
    if (!_textViewDescription) {
        _textViewDescription = [UITextView new];
        _textViewDescription.backgroundColor = [UIColor lightGrayColor];
        _textViewDescription.scrollEnabled = NO;
        [_textViewDescription setContentOffset:CGPointZero animated:NO];
    }
    return _textViewDescription;
}

- (UITextField *)textFieldTitle{
    if (!_textFieldTitle) {
        _textFieldTitle = [UITextField new];
        _textFieldTitle.placeholder = @"Title";
        _textFieldTitle.backgroundColor = [UIColor lightGrayColor];
    }
    return _textFieldTitle;
}

- (void)updateConstraints{
    

    [self.textFieldTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(44+20+10);
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    
    [self.textViewDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textFieldTitle.mas_bottom).mas_offset(10);
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_equalTo(-10);
        make.height.mas_equalTo(200);
    }];
    
    [self.buttonSave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_equalTo(-10);
        make.top.equalTo(self.textViewDescription.mas_bottom).mas_offset(10);
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
