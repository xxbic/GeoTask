//
//  RootViewController.m
//  GeoTask
//
//  Created by Denis Katic on 28/10/2016.
//  Copyright © 2016 Denis Katic. All rights reserved.
//

#import "MapViewController.h"
#import "MapView.h"
#import "POIListTableViewController.h"
#import "POIDetailsTableViewController.h"
#import "TapCoordinate.h"
#import "WorkingArea.h"
#import "POI.h"
#import "Activity.h"
#import "TapCoordinate.h"
#import "LocationController.h"
#import "MagicalRecord.h"

@interface MapViewController () <GMSMapViewDelegate, MapViewDelegate, LocationControllerDelegate>

@property (nonatomic, strong) MapView *mainView;
@property (nonatomic, strong) LocationController *locationController;
@property (nonatomic, strong) UIBarButtonItem *buttonCancelEditing;
@property (nonatomic, strong) UIBarButtonItem *buttonDeleteAllWorkingAreas;
@property (nonatomic, strong) NSMutableArray *workingAreas;
@property (nonatomic, strong) NSMutableArray *workingAreasGMSPolygones;
@property (nonatomic, strong) NSMutableArray *listOfPOIs;
@property (nonatomic, strong) NSMutableArray *tappedCoordinates;
@property (nonatomic, strong) GMSPolyline *tempPolyline;
@property (nonatomic, assign) BOOL isDrawingMode;
@property (nonatomic, assign) BOOL overlayTapped;

@end

@implementation MapViewController

- (void)loadView{

    self.mainView = [MapView new];
    self.mainView.delegate = self;
    self.mainView.googleMapView.delegate = self;
    self.view = self.mainView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GeoTask";
    self.isDrawingMode = NO;
    self.locationController = [LocationController sharedInstance];
    self.locationController.delegate = self;
    
    self.buttonCancelEditing = [[UIBarButtonItem alloc]initWithTitle:@"POI List"
                                                               style:UIBarButtonItemStyleDone
                                                              target:self
                                                              action:@selector(buttonPOIListPressed)];
    
    self.buttonDeleteAllWorkingAreas = [[UIBarButtonItem alloc]initWithTitle:@"Delete Areas"
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:@selector(buttonDeleteAllWorkingAreasPressed)];
    self.navigationItem.rightBarButtonItem = self.buttonCancelEditing;
    self.navigationItem.leftBarButtonItem = self.buttonDeleteAllWorkingAreas;

    [self loadData];
}

- (void)loadData{

    self.workingAreas = [NSMutableArray new];
    self.workingAreasGMSPolygones = [NSMutableArray new];
    self.listOfPOIs = [NSMutableArray new];
    
    self.workingAreas = [NSMutableArray arrayWithArray:[WorkingArea findAll]];
    for (WorkingArea *workingArea in self.workingAreas) {
        [self.workingAreasGMSPolygones addObject:[self drawPolygonesForArea:workingArea]];
    }
    
    self.listOfPOIs = [NSMutableArray arrayWithArray:[POI findAll]];
    for (POI *poi in self.listOfPOIs) {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(poi.latitude.doubleValue, poi.longitude.doubleValue);
        [self createMarkerWith:poi.localId atCoordinate:coordinate];
    }
}

- (void)buttonPOIListPressed{
    [self.navigationController pushViewController:[POIListTableViewController new] animated:YES];
}


- (void)buttonDrawPressed{
    
    self.isDrawingMode = YES;
    self.tappedCoordinates = [NSMutableArray new];
}

- (void)buttonDonePressed{
    
    if (self.isDrawingMode == YES) {
        if (self.tappedCoordinates.count > 2) {
            WorkingArea *workingArea = [WorkingArea MR_createEntity];
            for (TapCoordinate *tapCoordinate in self.tappedCoordinates) {
                [workingArea addTapcoordinateObject:tapCoordinate];
            }
            [self.workingAreas addObject:workingArea];
            [self.workingAreasGMSPolygones addObject:[self drawPolygonesForArea:workingArea]];
            [workingArea save];
        }
    }
    [self clearTempLines];
    self.isDrawingMode = NO;
}

- (void)buttonCancelPressed{
    self.isDrawingMode = NO;
    self.tappedCoordinates = [NSMutableArray new];
    [self clearTempLines];
}

- (void)clearTempLines{
    self.tempPolyline.map = nil;
}


- (GMSPolygon *)drawPolygonesForArea:(WorkingArea *)workignArea{
    
    GMSPolygon *polygon = [[GMSPolygon alloc] init];
    polygon.path = [self generatePathFromTouchsesForWorkingAre:workignArea];
    polygon.title = @"Title";
    polygon.fillColor = [UIColor colorWithRed:0.25 green:0 blue:0 alpha:0.2f];
    polygon.strokeColor = [UIColor blackColor];
    polygon.strokeWidth = 2;
    polygon.tappable = YES;
    polygon.map = self.mainView.googleMapView;
    return polygon;
}

- (GMSPath *)generatePathFromTouchsesForWorkingAre:(WorkingArea *)workignArea {
    GMSMutablePath *path = [GMSMutablePath path];
    NSArray *tapCoordinates = [workignArea getAllTouches];
    for (TapCoordinate *tapCoordinate in tapCoordinates) {
        [path addLatitude:tapCoordinate.latitude.floatValue
                longitude:tapCoordinate.longitude.floatValue];
    }
    return path;
}

- (GMSPath *)generatePathFromTouchses{
    GMSMutablePath *path = [GMSMutablePath path];
    for (TapCoordinate *tapCoordinate in self.tappedCoordinates) {
        [path addLatitude:tapCoordinate.latitude.floatValue
                longitude:tapCoordinate.longitude.floatValue];
    }
    return path;
}

#pragma GMSMapView delegate
- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    if (self.isDrawingMode) {
        TapCoordinate *tapCoordinate = [TapCoordinate MR_createEntity];
        tapCoordinate.longitude = [NSNumber numberWithFloat:coordinate.longitude];
        tapCoordinate.latitude = [NSNumber numberWithFloat:coordinate.latitude];
        tapCoordinate.createDate = [NSDate date];
        [self.tappedCoordinates addObject:tapCoordinate];
        
        if ([self.tappedCoordinates count] > 1) {
            self.tempPolyline = [GMSPolyline polylineWithPath:[self generatePathFromTouchses]];
            self.tempPolyline.strokeWidth = 2.f;
            self.tempPolyline.tappable = YES;
            self.tempPolyline.map = self.mainView.googleMapView;
        }
    }
}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
    for (GMSPolygon *polygon in self.workingAreasGMSPolygones) {
        if (GMSGeometryContainsLocation(coordinate, polygon.path, YES)) {
            [POI createPOIonLocation:coordinate withCompletion:^(NSString * _Nonnull localId) {
                [self createMarkerWith:localId atCoordinate:coordinate];
            }];
        }
    }
}

- (void)createMarkerWith:(NSString *)localId atCoordinate:(CLLocationCoordinate2D)coordinate{
    GMSMarker *marker = [GMSMarker markerWithPosition:coordinate];
    marker.map = self.mainView.googleMapView;
    marker.userData = localId;
    [self.mainView.googleMapView setSelectedMarker:marker];
}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    
    POI *poi = [POI findPOIByLocalId:marker.userData];
    POIDetailsTableViewController *vc = [[POIDetailsTableViewController alloc]initWithPOI:poi];
    [self.navigationController pushViewController:vc animated:YES];
    
    return YES;
}


#pragma LocationController delegate
- (void)locationUpdate:(CLLocation *)location{
    if (location) {
        GMSCameraPosition *position = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude
                                                                  longitude:location.coordinate.longitude
                                                                       zoom:10];
        [self.mainView.googleMapView animateToCameraPosition:position];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDeleteAllWorkingAreasPressed{
    [WorkingArea deleteAll];
    [POI deleteAll];
    [Activity deleteAll];
    [TapCoordinate deleteAll];
    [self.mainView.googleMapView clear];
    [self loadData];
}

@end
