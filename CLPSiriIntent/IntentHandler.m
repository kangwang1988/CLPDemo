//
//  IntentHandler.m
//  CLPSiriIntent
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "IntentHandler.h"
#import <Contacts/Contacts.h>

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
//    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        [defaults setObject:@"KyleWong" forKey:@"abbr"];
//        [defaults synchronize];
//    }] resume];
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)confirmSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    completion([[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeInProgress userActivity:[[NSUserActivity alloc] initWithActivityType:@"activityType"]]);
}

- (void)resolveRecipientsForSendMessage:(INSendMessageIntent *)intent
                         withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveRecipients(forSendMessage:with:)){
    [self searchContactWithName:((INPerson *)intent.recipients.firstObject).displayName completionBlock:^(NSArray<INPerson *> *aPersons){
            completion(@[[INPersonResolutionResult successWithResolvedPerson:aPersons.firstObject]]);
    }];

}

- (void)resolveContentForSendMessage:(INSendMessageIntent *)intent
                      withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveContent(forSendMessage:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.content]);
}

- (void)searchContactWithName:(NSString *)aName completionBlock:(IntentHandlerBlock)aCompletionBlock{
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSMutableArray *array = [NSMutableArray array];
        // make sure the user granted us access
        if (!granted) {
            return;
        }
        // build array of contacts
        NSMutableArray *contacts = [NSMutableArray array];
        NSError *fetchError;
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey, [CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName]]];
         [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
            [contacts addObject:contact];
        }];
        // you can now do something with the list of contacts, for example, to show the names
        CNContactFormatter *formatter = [[CNContactFormatter alloc] init];
        for (CNContact *contact in contacts) {
            NSString *string = [formatter stringFromContact:contact];
            NSLog(@"contact = %@", string);
            if([string isEqualToString:aName]){
                [array addObject:[[INPerson alloc] initWithHandle:@"" displayName:string contactIdentifier:contact.identifier]];
            }
            if(aCompletionBlock)
                aCompletionBlock(array);
        }
    }];
}
@end
