//
//  SiriStartVideoCallIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/30/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriStartVideoCallIntentHandler.h"

@implementation SiriStartVideoCallIntentHandler
- (void)handleStartVideoCall:(INStartVideoCallIntent *)intent
                  completion:(void (^)(INStartVideoCallIntentResponse *response))completion NS_SWIFT_NAME(handle(startVideoCall:completion:)){
    completion([[INStartVideoCallIntentResponse alloc] initWithCode:INStartVideoCallIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmStartVideoCall:(INStartVideoCallIntent *)intent
                   completion:(void (^)(INStartVideoCallIntentResponse *response))completion NS_SWIFT_NAME(confirm(startVideoCall:completion:)){
    completion([[INStartVideoCallIntentResponse alloc] initWithCode:INStartVideoCallIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveContactsForStartVideoCall:(INStartVideoCallIntent *)intent
                          withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveContacts(forStartVideoCall:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.contacts enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
    }];
    completion(array);
}
@end
