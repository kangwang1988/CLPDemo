//
//  SiriListRideOptionsIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriListRideOptionsIntentHandler.h"
#import "CLPDemoCore.h"

@implementation SiriListRideOptionsIntentHandler
- (void)handleListRideOptions:(INListRideOptionsIntent *)intent
                   completion:(void (^)(INListRideOptionsIntentResponse *response))completion NS_SWIFT_NAME(handle(listRideOptions:completion:)){
    INListRideOptionsIntentResponse *resp = [[INListRideOptionsIntentResponse alloc] initWithCode:INListRideOptionsIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeListRideOptions]];
    resp.expirationDate = [NSDate dateWithTimeIntervalSinceNow:1200];
    resp.supportsApplePayForPayment = @(YES);
    INPaymentMethod *paymentMethod = [[INPaymentMethod alloc] initWithType:INPaymentMethodTypeCredit name:kAuthorEmail identificationHint:@"hint" icon:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]]];
    INRideOption *option = [[INRideOption alloc] initWithName:kDriverNickname estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    [resp setRideOptions:@[option]];
    [resp setPaymentMethods:@[paymentMethod]];
    completion(resp);
}

- (void)confirmListRideOptions:(INListRideOptionsIntent *)intent
                    completion:(void (^)(INListRideOptionsIntentResponse *response))completion NS_SWIFT_NAME(confirm(listRideOptions:completion:)){
    INListRideOptionsIntentResponse *resp = [[INListRideOptionsIntentResponse alloc] initWithCode:INListRideOptionsIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeListRideOptions]];
    resp.expirationDate = [NSDate dateWithTimeIntervalSinceNow:1200];
    resp.supportsApplePayForPayment = @(YES);
    INPaymentMethod *paymentMethod = [[INPaymentMethod alloc] initWithType:INPaymentMethodTypeCredit name:kAuthorEmail identificationHint:@"hint" icon:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]]];
    INRideOption *option = [[INRideOption alloc] initWithName:kDriverNickname estimatedPickupDate:[NSDate dateWithTimeIntervalSinceNow:120]];
    [resp setRideOptions:@[option]];
    [resp setPaymentMethods:@[paymentMethod]];
    completion(resp);
}

- (void)resolvePickupLocationForListRideOptions:(INListRideOptionsIntent *)intent
                                 withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePickupLocation(forListRideOptions:with:)){
        completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.pickupLocation]);
}

- (void)resolveDropOffLocationForListRideOptions:(INListRideOptionsIntent *)intent
                                  withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDropOffLocation(forListRideOptions:with:)){
    completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.dropOffLocation]);
}
@end
