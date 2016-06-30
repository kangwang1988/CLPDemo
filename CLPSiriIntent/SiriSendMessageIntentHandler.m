//
//  SiriSendMessageIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriSendMessageIntentHandler.h"
#import <Contacts/Contacts.h>
#import "SiriIntentHandler.h"

@implementation SiriSendMessageIntentHandler
#pragma mark - INSendMessageIntentHandling
- (void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)resolveRecipientsForSendMessage:(INSendMessageIntent *)intent withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveRecipients(forSendMessage:with:)){
    [SiriIntentHandler searchContactWithCategory:NKSiriIntentHandlerContactCategoryFullname value:((INPerson *)intent.recipients.firstObject).displayName completionBlock:^(INPerson *aPerson) {
        if(aPerson)
            completion(@[[INPersonResolutionResult successWithResolvedPerson:aPerson]]);
        else
            completion(nil);
    }];
}

- (void)resolveContentForSendMessage:(INSendMessageIntent *)intent withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveContent(forSendMessage:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.content]);
}

- (void)confirmSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeInProgress userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}
@end
