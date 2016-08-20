//
//  SiriSearchCallHistoryIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/30/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriSearchCallHistoryIntentHandler.h"
@implementation SiriSearchCallHistoryIntentHandler
- (void)handleSearchCallHistory:(INSearchCallHistoryIntent *)intent
                     completion:(void (^)(INSearchCallHistoryIntentResponse *response))completion NS_SWIFT_NAME(handle(searchCallHistory:completion:)){
    completion([[INSearchCallHistoryIntentResponse alloc] initWithCode:INSearchCallHistoryIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmSearchCallHistory:(INSearchCallHistoryIntent *)intent
                      completion:(void (^)(INSearchCallHistoryIntentResponse *response))completion NS_SWIFT_NAME(confirm(searchCallHistory:completion:)){
        completion([[INSearchCallHistoryIntentResponse alloc] initWithCode:INSearchCallHistoryIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveCallTypeForSearchCallHistory:(INSearchCallHistoryIntent *)intent
                             withCompletion:(void (^)(INCallRecordTypeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveCallType(forSearchCallHistory:with:)){
        completion([INCallRecordTypeResolutionResult successWithResolvedValue:intent.callType]);
}

- (void)resolveDateCreatedForSearchCallHistory:(INSearchCallHistoryIntent *)intent
                                withCompletion:(void (^)(INDateComponentsRangeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDateCreated(forSearchCallHistory:with:)){
        completion([INDateComponentsRangeResolutionResult successWithResolvedDateComponentsRange:intent.dateCreated]);
}

- (void)resolveRecipientForSearchCallHistory:(INSearchCallHistoryIntent *)intent
                              withCompletion:(void (^)(INPersonResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveRecipient(forSearchCallHistory:with:)){
    completion([INPersonResolutionResult successWithResolvedPerson:intent.recipient]);
}

- (void)resolveCallCapabilitiesForSearchCallHistory:(INSearchCallHistoryIntent *)intent
                                     withCompletion:(void (^)(INCallCapabilityOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveCallCapabilities(forSearchCallHistory:with:)){
        completion([INCallCapabilityOptionsResolutionResult successWithResolvedValue:intent.callCapabilities]);
}
@end
