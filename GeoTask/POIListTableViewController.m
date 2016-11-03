//
//  ListTableViewController.m
//  GeoTask
//
//  Created by Denis Katic on 29/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "POIListTableViewController.h"
#import "POIDetailsTableViewController.h"
#import "POIListTableViewCell.h"
#import "POI.h"

static NSString *const cellIdentifyer = @"cellIdentifyer";

@interface POIListTableViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *allPOIs;
@end

@implementation POIListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"POI List";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[POIListTableViewCell class] forCellReuseIdentifier:cellIdentifyer];
    
    self.allPOIs = [POI findAllSortedByDistance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allPOIs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    POIListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifyer forIndexPath:indexPath];
    POI *poi = self.allPOIs[indexPath.row];
    [cell setDistanceText:poi.distance];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    POI *poi = [self.allPOIs objectAtIndex:indexPath.row];
    POIDetailsTableViewController *vc = [[POIDetailsTableViewController alloc]initWithPOI:poi];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


@end
