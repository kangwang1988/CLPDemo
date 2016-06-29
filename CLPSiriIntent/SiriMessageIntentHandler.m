//
//  SiriMessageIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriMessageIntentHandler.h"
#import <Contacts/Contacts.h>

typedef void (^SiriIntentHandlerBlock)(NSArray<INPerson *> *);

@implementation SiriMessageIntentHandler
#pragma mark - INSendMessageIntentHandling
- (void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion{
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://api.heweather.com/x3/weather?cityid=CN101210101&key=fa61e51709b440eb8f342408b073a958"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
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
    [self searchContactWithName:((INPerson *)intent.recipients.firstObject).displayName completionBlock:^(NSArray<INPerson *> *aPersons){
        if(aPersons.count)
            completion(@[[INPersonResolutionResult successWithResolvedPerson:aPersons.firstObject]]);
        else
            completion(nil);
    }];
    
}

- (void)resolveContentForSendMessage:(INSendMessageIntent *)intent
                      withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveContent(forSendMessage:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.content]);
}

- (void)searchContactWithName:(NSString *)aName completionBlock:(SiriIntentHandlerBlock)aCompletionBlock{
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
        }
        if(aCompletionBlock)
            aCompletionBlock(array);
    }];
}
@end
