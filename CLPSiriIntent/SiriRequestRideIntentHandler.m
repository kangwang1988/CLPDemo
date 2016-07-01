//
//  SiriRequestRideIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriRequestRideIntentHandler.h"
#import "CLPDemoCore.h"

@implementation SiriRequestRideIntentHandler
- (void)handleRequestRide:(INRequestRideIntent *)intent
               completion:(void (^)(INRequestRideIntentResponse *response))completion NS_SWIFT_NAME(handle(requestRide:completion:)){
    INRequestRideIntentResponse *resp = [[INRequestRideIntentResponse alloc] initWithCode:INRequestRideIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestRide]];
    INRideStatus *status = [[INRideStatus alloc] init];
    status.rideIdentifier = @"rideIdentifier";
    status.phase = INRidePhaseCompleted;
    
    INRideVehicle *vehicle = [[INRideVehicle alloc] init];
    vehicle.location = intent.pickupLocation.location;
    vehicle.registrationPlate = @"plate";
    vehicle.model = @"BMW3";
    vehicle.manufacturer = @"BWM";
    vehicle.mapAnnotationImage = [INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]];
    
    status.vehicle = vehicle;
    
    status.driver = [[INRideDriver alloc] initWithHandle:@"handle" displayName:kDriverNickname image:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]] rating:@"4.5" phoneNumber:kDriverMob];
    status.estimatedPickupDate = [NSDate dateWithTimeIntervalSinceNow:120];
    status.estimatedDropOffDate = [NSDate dateWithTimeIntervalSinceNow:720];
    status.pickupLocation = intent.pickupLocation;
    status.waypoints = @[intent.pickupLocation,intent.dropOffLocation];
    status.dropOffLocation = intent.dropOffLocation;
    status.rideOption = [[INRideOption alloc] initWithName:@"RideOption" estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    status.userActivityForCancelingInApplication = [[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestRide];
    resp.rideStatus = status;
    completion(resp);
}

- (void)confirmRequestRide:(INRequestRideIntent *)intent
                completion:(void (^)(INRequestRideIntentResponse *response))completion NS_SWIFT_NAME(confirm(requestRide:completion:)){
    INRequestRideIntentResponse *resp = [[INRequestRideIntentResponse alloc] initWithCode:INRequestRideIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestRide]];
    INRideStatus *status = [[INRideStatus alloc] init];
    status.rideIdentifier = @"rideIdentifier";
    status.phase = INRidePhaseCompleted;
   
    INRideVehicle *vehicle = [[INRideVehicle alloc] init];
    vehicle.location = intent.pickupLocation.location;
    vehicle.registrationPlate = @"plate";
    vehicle.model = @"BMW3";
    vehicle.manufacturer = @"BWM";
    vehicle.mapAnnotationImage = [INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]];
   
    status.vehicle = vehicle;
    
    status.driver = [[INRideDriver alloc] initWithHandle:@"handle" displayName:kDriverNickname image:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]] rating:@"4.5" phoneNumber:kDriverMob];
    status.estimatedPickupDate = [NSDate dateWithTimeIntervalSinceNow:120];
    status.estimatedDropOffDate = [NSDate dateWithTimeIntervalSinceNow:720];
    status.pickupLocation = intent.pickupLocation;
    status.waypoints = @[intent.pickupLocation,intent.dropOffLocation];
    status.dropOffLocation = intent.dropOffLocation;
    status.rideOption = [[INRideOption alloc] initWithName:@"RideOption" estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    status.userActivityForCancelingInApplication = [[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestRide];
    resp.rideStatus = status;
    completion(resp);
}

- (void)resolvePickupLocationForRequestRide:(INRequestRideIntent *)intent
                             withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePickupLocation(forRequestRide:with:)){
    completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.pickupLocation]);
}

- (void)resolveDropOffLocationForRequestRide:(INRequestRideIntent *)intent
                              withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDropOffLocation(forRequestRide:with:)){
    completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.dropOffLocation]);
}

- (void)resolveRideOptionNameForRequestRide:(INRequestRideIntent *)intent
                             withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveRideOptionName(forRequestRide:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.rideOptionName]);
}

- (void)resolvePartySizeForRequestRide:(INRequestRideIntent *)intent
                        withCompletion:(void (^)(INIntegerResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePartySize(forRequestRide:with:)){
    completion([INIntegerResolutionResult successWithResolvedValue:intent.partySize]);
}

- (void)resolvePaymentMethodNameForRequestRide:(INRequestRideIntent *)intent
                                withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePaymentMethodName(forRequestRide:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.paymentMethodName]);
}

- (void)resolveUsesApplePayForPaymentForRequestRide:(INRequestRideIntent *)intent
                                     withCompletion:(void (^)(INBooleanResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveUsesApplePayForPayment(forRequestRide:with:)){
    completion([INBooleanResolutionResult successWithResolvedValue:intent.usesApplePayForPayment.boolValue]);
}
@end
