//
//  AddInfoViewController.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIActivityViewController.h"
#import "POIActivityView.h"
#import "MagicalRecord.h"


@interface POIActivityViewController () <POIActivityViewDelegate>
@property (nonatomic, strong)POIActivityView *activityView;
@property (nonatomic, strong)POI *poi;
@property (nonatomic, strong)Activity *activity;

@end

@implementation POIActivityViewController

- (instancetype)initWithPOI:(POI *)poi andActivity:(Activity *)activity{
    self = [super init];
    if (self) {
        self.poi = poi;
        self.activity = activity;
    }
    return self;
}

- (void)loadView{
    
    self.activityView = [POIActivityView new];
    self.activityView.delegate = self;
    self.view = self.activityView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Activity";
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (self.activity) {
        [self loadViewData];
    }
}

- (void)loadViewData{
    
    [self.activityView setTitle:self.activity.title];
    [self.activityView setDescription:self.activity.activityDescription];
}

- (void)saveActivity{
    
    if (self.activity == nil) {
        self.activity = [Activity MR_createEntity];
        [self.poi addActivityObject:self.activity];
    }
    self.activity.title = [self.activityView getTitle];
    self.activity.activityDescription = [self.activityView getDescription];
    [self.activity save];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
