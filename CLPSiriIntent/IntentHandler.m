//
//  IntentHandler.m
//  CLPSiriIntent
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "IntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.


@interface IntentHandler () <INSendMessageIntentHandling>

@end

@implementation IntentHandler
- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    id handler = nil;
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INSendMessageIntent class]]) {
        handler = self;
    }
    return handler;
}

#pragma mark - INSendMessageIntentHandling
- (void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"KyleWong" forKey:@"abbr"];
        [defaults synchronize];
    }] resume];
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)confirmSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeInProgress userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)resolveRecipientsForSendMessage:(INSendMessageIntent *)intent
                         withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveRecipients(forSendMessage:with:)){
    completion(@[[INPersonResolutionResult successWithResolvedPerson:[[INPerson alloc] initWithHandle:@"小伙伴" displayName:@"小新" contactIdentifier:nil]]]);
}

- (void)resolveContentForSendMessage:(INSendMessageIntent *)intent
                      withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveContent(forSendMessage:with:)){
    completion([INStringResolutionResult successWithResolvedString:@"小新，我在利用Siri开发一些代码，收到请忽略。"]);
}
@end
