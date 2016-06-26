//
//  NKLocationService.m
//  CLPDemo
//
//  Created by KyleWong on 6/26/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKLocationService.h"
#import <CoreLocation/CoreLocation.h>

@interface NKLocationService()<CLLocationManagerDelegate>
@property(nonatomic,strong) CLLocationManager *locationManager;
@end

@implementation NKLocationService
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
        [self requestLocationPermission];
    }
    return self;
}

- (void)commonInit{
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    if([_locationManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)])
        [_locationManager setAllowsBackgroundLocationUpdates:YES];
}

- (void)requestLocationPermission{
    [_locationManager requestAlwaysAuthorization];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{

}
@end
