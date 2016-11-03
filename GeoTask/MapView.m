//
//  MainView.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "MapView.h"
#import "Masonry.h"

@interface MapView()
@property (nonatomic, strong) UIButton *buttonDraw;
@property (nonatomic, strong) UIButton *buttonDone;
@property (nonatomic, strong) UIButton *buttonCancel;
@end

@implementation MapView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.googleMapView];
        [self addSubview:self.buttonDraw];
        [self addSubview:self.buttonDone];
        [self addSubview:self.buttonCancel];
        [self setDrawingMode:NO];
        
        [self setNeedsUpdateConstraints];
        
    }
    return self;
}

- (void)setDrawingMode:(BOOL)mode{
    
    if (mode == YES) {
        self.buttonDraw.hidden = YES;
        self.buttonDone.hidden = NO;
        self.buttonCancel.hidden = NO;

    }else{
        self.buttonDraw.hidden = NO;
        self.buttonDone.hidden = YES;
        self.buttonCancel.hidden = YES;
    }
}

- (GMSMapView *)googleMapView{
    if (!_googleMapView) {
        _googleMapView = [GMSMapView mapWithFrame:CGRectZero camera:[GMSCameraPosition cameraWithLatitude:0 longitude:0 zoom:4]];
        _googleMapView.accessibilityElementsHidden = NO;
        _googleMapView.userInteractionEnabled = YES;
        
    }
    return _googleMapView;
}

- (UIButton *)buttonDraw{
    if (!_buttonDraw) {
        _buttonDraw = [UIButton new];
        [_buttonDraw setTitle:@"Start drawing" forState:UIControlStateNormal];
        _buttonDraw.backgroundColor = [UIColor lightGrayColor];
        [_buttonDraw setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonDraw addTarget:self action:@selector(buttonDrawPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonDraw;
}

- (UIButton *)buttonDone{
    if (!_buttonDone) {
        _buttonDone = [UIButton new];
        [_buttonDone setTitle:@"Done" forState:UIControlStateNormal];
        _buttonDone.backgroundColor = [UIColor grayColor];
        [_buttonDone setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonDone addTarget:self action:@selector(buttonDonePressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonDone;
}

- (UIButton *)buttonCancel{
    if (!_buttonCancel) {
        _buttonCancel = [UIButton new];
        [_buttonCancel setTitle:@"Cancel" forState:UIControlStateNormal];
        _buttonCancel.backgroundColor = [UIColor grayColor];
        [_buttonCancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_buttonCancel addTarget:self action:@selector(buttonCancelPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonCancel;
}

- (void)buttonDrawPressed:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(buttonDrawPressed)]) {
        [self.delegate buttonDrawPressed];
        [self setDrawingMode:YES];

    }
}

- (void)buttonDonePressed:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(buttonDonePressed)]) {
        [self.delegate buttonDonePressed];
        [self setDrawingMode:NO];

    }
}

- (void)buttonCancelPressed:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(buttonCancelPressed)]) {
        [self.delegate buttonCancelPressed];
        [self setDrawingMode:NO];
    }
}

- (void)updateConstraints{
    
    [self.googleMapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.buttonCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).mas_offset(5);
        make.right.equalTo(self).mas_offset(-5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);

    }];
    
    [self.buttonDraw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_equalTo(-10);
        make.bottom.equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(60);
        
    }];
    
    [self.buttonDone mas_makeConstraints:^(MASConstraintMaker *make) {
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
