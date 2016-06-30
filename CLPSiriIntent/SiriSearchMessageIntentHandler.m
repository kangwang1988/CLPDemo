//
//  SiriSearchMessageIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriSearchMessageIntentHandler.h"
#import "SiriIntentHandler.h"

@implementation SiriSearchMessageIntentHandler
- (void)handleSearchForMessages:(INSearchForMessagesIntent *)intent completion:(void (^)(INSearchForMessagesIntentResponse * _Nonnull))completion{
    completion([[INSearchForMessagesIntentResponse alloc] initWithCode:INSearchForMessagesIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)resolveRecipientsForSearchForMessages:(INSearchForMessagesIntent *)intent
                               withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveRecipients(forSearchForMessages:with:)){
    [SiriIntentHandler searchContactWithName:((INPerson *)intent.recipients.firstObject).displayName completionBlock:^(INPerson *aPerson){
        if(aPerson)
            completion(@[[INPersonResolutionResult successWithResolvedPerson:aPerson]]);
        else{
            completion(nil);
        }
    }];
}

- (void)resolveSendersForSearchForMessages:(INSearchForMessagesIntent *)intent
                            withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSenders(forSearchForMessages:with:)){
    [SiriIntentHandler searchContactWithName:((INPerson *)intent.senders.firstObject).displayName completionBlock:^(INPerson *aPerson){
        if(aPerson)
            completion(@[[INPersonResolutionResult successWithResolvedPerson:aPerson]]);
        else
           completion(nil);
    }];
}

- (void)resolveSearchTermsForSearchForMessages:(INSearchForMessagesIntent *)intent
                                withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSearchTerms(forSearchForMessages:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.searchTerms enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
    }];
    completion(array);
}

- (void)resolveAttributesForSearchForMessages:(INSearchForMessagesIntent *)intent
                               withCompletion:(void (^)(INMessageAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveAttributes(forSearchForMessages:with:)){
        completion(nil);
}

- (void)resolveDateTimeRangeForSearchForMessages:(INSearchForMessagesIntent *)intent
                                  withCompletion:(void (^)(INDateComponentsRangeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDateTimeRange(forSearchForMessages:with:)){
        completion(nil);
}

- (void)resolveIdentifiersForSearchForMessages:(INSearchForMessagesIntent *)intent
                                withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveIdentifiers(forSearchForMessages:with:)){
    completion(nil);
}

- (void)resolveNotificationIdentifiersForSearchForMessages:(INSearchForMessagesIntent *)intent
                                            withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveNotificationIdentifiers(forSearchForMessages:with:)){
    completion(nil);
}

- (void)resolveGroupNamesForSearchForMessages:(INSearchForMessagesIntent *)intent
                               withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveGroupNames(forSearchForMessages:with:)){
    completion(nil);
}

- (void)confirmSearchForMessages:(INSearchForMessagesIntent *)intent completion:(void (^)(INSearchForMessagesIntentResponse * _Nonnull))completion{
        completion([[INSearchForMessagesIntentResponse alloc] initWithCode:INSearchForMessagesIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}
@end
