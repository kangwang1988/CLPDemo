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
    INSearchForMessagesIntentResponse *response = [[INSearchForMessagesIntentResponse alloc] initWithCode:INSearchForMessagesIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]];
    [response setMessages:@[[[INMessage alloc] initWithIdentifier:@"Identifier" content:[NSString stringWithFormat:@"检索到一条包含:%@的信息，内容如下:测试用例。",intent.searchTerms.firstObject] dateSent:[NSDate date] sender:intent.senders.firstObject recipients:intent.recipients]]];
    completion(response);
}

//Uncomment  codes below when you know how to trigger INSearchForMessagesIntent.

//- (void)resolveRecipientsForSearchForMessages:(INSearchForMessagesIntent *)intent
//                               withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveRecipients(forSearchForMessages:with:)){
//    
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.recipients enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
//    }];
//    completion(array);
//}
//
//- (void)resolveSendersForSearchForMessages:(INSearchForMessagesIntent *)intent
//                            withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSenders(forSearchForMessages:with:)){
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.senders enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
//    }];
//    completion(array);
//}
//
//- (void)resolveSearchTermsForSearchForMessages:(INSearchForMessagesIntent *)intent
//                                withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSearchTerms(forSearchForMessages:with:)){
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.searchTerms enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
//    }];
//    completion(array);
//}
//
//- (void)resolveAttributesForSearchForMessages:(INSearchForMessagesIntent *)intent
//                               withCompletion:(void (^)(INMessageAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveAttributes(forSearchForMessages:with:)){
//    completion([INMessageAttributeOptionsResolutionResult successWithResolvedValue:intent.attributes]);
//}
//
//- (void)resolveDateTimeRangeForSearchForMessages:(INSearchForMessagesIntent *)intent
//                                  withCompletion:(void (^)(INDateComponentsRangeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDateTimeRange(forSearchForMessages:with:)){
//        completion([INDateComponentsRangeResolutionResult successWithResolvedDateComponentsRange:intent.dateTimeRange]);
//}
//
//- (void)resolveIdentifiersForSearchForMessages:(INSearchForMessagesIntent *)intent
//                                withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveIdentifiers(forSearchForMessages:with:)){
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.identifiers enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
//    }];
//    completion(array);
//}
//
//- (void)resolveNotificationIdentifiersForSearchForMessages:(INSearchForMessagesIntent *)intent
//                                            withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveNotificationIdentifiers(forSearchForMessages:with:)){
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.notificationIdentifiers enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
//    }];
//    completion(array);
//}
//
//- (void)resolveGroupNamesForSearchForMessages:(INSearchForMessagesIntent *)intent
//                               withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveGroupNames(forSearchForMessages:with:)){
//    NSMutableArray *array = [NSMutableArray array];
//    [intent.groupNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
//    }];
//    completion(array);
//}
//
//- (void)confirmSearchForMessages:(INSearchForMessagesIntent *)intent completion:(void (^)(INSearchForMessagesIntentResponse * _Nonnull))completion{
//    INSearchForMessagesIntentResponse *response = [[INSearchForMessagesIntentResponse alloc] initWithCode:INSearchForMessagesIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]];
//    __block INPerson *authorContact = nil, *buddyContact = nil;
//    [SiriIntentHandler searchContactWithCategory:NKSiriIntentHandlerContactCategoryEmail value:kAuthorEmail completionBlock:^(INPerson * aPerson) {
//        authorContact = aPerson;
//        [SiriIntentHandler searchContactWithCategory:NKSiriIntentHandlerContactCategoryEmail value:kBuddyEmail completionBlock:^(INPerson *aPerson) {
//            buddyContact = aPerson;
//            [response setMessages:@[[[INMessage alloc] initWithIdentifier:@"Identifier" content:@"测试内容1" dateSent:[NSDate dateWithTimeIntervalSinceNow:-86400] sender:buddyContact recipients:@[authorContact]]]];
//            completion(response);
//        }];
//    }];
//}
@end
