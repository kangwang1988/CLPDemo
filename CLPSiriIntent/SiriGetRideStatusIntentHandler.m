//
//  SiriGetRideStatusIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriGetRideStatusIntentHandler.h"
#import "CLPDemoCore.h"

@implementation SiriGetRideStatusIntentHandler
- (void)handleGetRideStatus:(INGetRideStatusIntent *)intent
                 completion:(void (^)(INGetRideStatusIntentResponse *response))completion NS_SWIFT_NAME(handle(getRideStatus:completion:)){
    INGetRideStatusIntentResponse *resp = [[INGetRideStatusIntentResponse alloc] initWithCode:INGetRideStatusIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeGetRideStatus]];
    INRideStatus *status = [[INRideStatus alloc] init];
    status.rideIdentifier = @"rideIdentifier";
    status.phase = INRidePhaseCompleted;
    
    INRideVehicle *vehicle = [[INRideVehicle alloc] init];
    vehicle.location = [[CLLocation alloc] initWithLatitude:30.27951009114583 longitude:120.1210639105903];
    vehicle.registrationPlate = @"plate";
    vehicle.model = @"BMW3";
    vehicle.manufacturer = @"BWM";
    vehicle.mapAnnotationImage = [INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]];
    
    status.vehicle = vehicle;
    
    status.driver = [[INRideDriver alloc] initWithHandle:@"handle" displayName:kDriverNickname image:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]] rating:@"4.5" phoneNumber:kDriverMob];
    status.estimatedPickupDate = [NSDate dateWithTimeIntervalSinceNow:120];
    status.estimatedDropOffDate = [NSDate dateWithTimeIntervalSinceNow:720];
    //    status.pickupLocation = intent.pickupLocation;
    //    status.waypoints = @[intent.pickupLocation,intent.dropOffLocation];
    //    status.dropOffLocation = intent.dropOffLocation;
    status.rideOption = [[INRideOption alloc] initWithName:@"RideOption" estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    status.userActivityForCancelingInApplication = [[NSUserActivity alloc] initWithActivityType:kActivityTypeGetRideStatus];
    resp.rideStatus = status;
    completion(resp);
}

- (void)startSendingUpdatesForGetRideStatus:(INGetRideStatusIntent *)intent
                                 toObserver:(id<INGetRideStatusIntentResponseObserver>)observer NS_SWIFT_NAME(startSendingUpdates(forGetRideStatus:to:)){

}

- (void)stopSendingUpdatesForGetRideStatus:(INGetRideStatusIntent *)intent NS_SWIFT_NAME(stopSendingUpdates(forGetRideStatus:)){
    
}

- (void)confirmGetRideStatus:(INGetRideStatusIntent *)intent
                  completion:(void (^)(INGetRideStatusIntentResponse *response))completion NS_SWIFT_NAME(confirm(getRideStatus:completion:)){
    INGetRideStatusIntentResponse *resp = [[INGetRideStatusIntentResponse alloc] initWithCode:INGetRideStatusIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeGetRideStatus]];
    INRideStatus *status = [[INRideStatus alloc] init];
    status.rideIdentifier = @"rideIdentifier";
    status.phase = INRidePhaseCompleted;
    
    INRideVehicle *vehicle = [[INRideVehicle alloc] init];
    vehicle.location = [[CLLocation alloc] initWithLatitude:30.27951009114583 longitude:120.1210639105903];
    vehicle.registrationPlate = @"plate";
    vehicle.model = @"BMW3";
    vehicle.manufacturer = @"BWM";
    vehicle.mapAnnotationImage = [INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]];
    
    status.vehicle = vehicle;
    
    status.driver = [[INRideDriver alloc] initWithHandle:@"handle" displayName:kDriverNickname image:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]] rating:@"4.5" phoneNumber:kDriverMob];
    status.estimatedPickupDate = [NSDate dateWithTimeIntervalSinceNow:120];
    status.estimatedDropOffDate = [NSDate dateWithTimeIntervalSinceNow:720];
//    status.pickupLocation = intent.pickupLocation;
//    status.waypoints = @[intent.pickupLocation,intent.dropOffLocation];
//    status.dropOffLocation = intent.dropOffLocation;
    status.rideOption = [[INRideOption alloc] initWithName:@"RideOption" estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    status.userActivityForCancelingInApplication = [[NSUserActivity alloc] initWithActivityType:kActivityTypeGetRideStatus];
    resp.rideStatus = status;
    completion(resp);
}

- (void)getRideStatusResponseDidUpdate:(INGetRideStatusIntentResponse *)response NS_SWIFT_NAME(didUpdate(getRideStatus:)){
}
@end
