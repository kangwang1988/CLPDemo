//
//  SiriStartAudioCallIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/30/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//
#import "CLPDemoCore.h"
#import "SiriStartAudioCallIntentHandler.h"
#import "SiriIntentHandler.h"

@implementation SiriStartAudioCallIntentHandler
- (void)handleStartAudioCall:(INStartAudioCallIntent *)intent
                  completion:(void (^)(INStartAudioCallIntentResponse *response))completion NS_SWIFT_NAME(handle(startAudioCall:completion:)){
    NSUserActivity *activity = [[NSUserActivity alloc] initWithActivityType:kActivityTypeAudioCall];
    [NKUtil searchContactWithCategory:NKContactCategoryFullname value:((INPerson *)intent.contacts.firstObject).displayName completionBlock:^(CNContact *aContact) {
        if(aContact.identifier)
            [activity setUserInfo:@{kKeyActivityUserInfoContactIdentifier:aContact.identifier}];
        completion([[INStartAudioCallIntentResponse alloc] initWithCode:INStartAudioCallIntentResponseCodeReady userActivity:activity]);
    }];
}

- (void)confirmStartAudioCall:(INStartAudioCallIntent *)intent
                   completion:(void (^)(INStartAudioCallIntentResponse *response))completion NS_SWIFT_NAME(confirm(startAudioCall:completion:)){
    completion([[INStartAudioCallIntentResponse alloc] initWithCode:INStartAudioCallIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeAudioCall]]);
}

- (void)resolveContactsForStartAudioCall:(INStartAudioCallIntent *)intent
                          withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveContacts(forStartAudioCall:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.contacts enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
    }];
    completion(array);
}
@end
