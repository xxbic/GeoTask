//
//  DetailsTableViewController.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIDetailsTableViewController.h"
#import "POIActivityViewController.h"
#import "POIDetailsView.h"
#import "POIHeaderTableViewCell.h"
#import "POIActivityTableViewCell.h"
#import "Activity.h"

static NSString *const cellIdentifyerPOIHeader = @"cellIdentifyerPOIHeader";
static NSString *const cellIdentifyerActivity = @"cellIdentifyerActivity";


@interface POIDetailsTableViewController ()<UITableViewDelegate, UITableViewDataSource, POIDetailsViewDelegate>
@property (nonatomic, strong) POIDetailsView *detailsView;
@property (nonatomic, strong) POI *poi;
@property (nonatomic, strong) NSArray *activities;

@end

@implementation POIDetailsTableViewController

- (instancetype)initWithPOI:(POI *)poi
{
    self = [super init];
    if (self) {
        self.poi = poi;
    }
    return self;
}

- (void)loadView{
    self.detailsView = [POIDetailsView new];
    self.view = self.detailsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POI Details";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.detailsView.tableView.delegate = self;
    self.detailsView.tableView.dataSource = self;
    self.detailsView.delegate = self;
    
    [self.detailsView.tableView registerClass:[POIHeaderTableViewCell class]
           forHeaderFooterViewReuseIdentifier:cellIdentifyerPOIHeader];
    
    [self.detailsView.tableView registerClass:[POIActivityTableViewCell class]
                       forCellReuseIdentifier:cellIdentifyerActivity];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Load activities
    self.activities = [self.poi.activity allObjects];
    [self.detailsView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.activities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    POIActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifyerActivity forIndexPath:indexPath];
    Activity *activity = [self.activities objectAtIndex:indexPath.row];
    [cell setTitleText:activity.title];
    [cell setDescriptionText:activity.activityDescription];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    POIHeaderTableViewCell *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifyerPOIHeader];
    [headerFooterView setAddress:self.poi.address];
    [headerFooterView setLongitude:self.poi.longitude];
    [headerFooterView setLatitude:self.poi.latitude];
    return headerFooterView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Activity *activity = [self.activities objectAtIndex:indexPath.row];
    POIActivityViewController *vc = [[POIActivityViewController alloc]initWithPOI:self.poi andActivity:activity];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 110;
}

#pragma DetailsViewDelegate delegate
- (void)addNewActivity{
    
    POIActivityViewController *vc = [[POIActivityViewController alloc]initWithPOI:self.poi andActivity:nil];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
