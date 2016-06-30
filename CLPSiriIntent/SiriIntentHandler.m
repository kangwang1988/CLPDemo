//
//  SiriIntentHandler.m
//  CLPSiriIntent
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "CLPDemoCore.h"
#import "SiriIntentHandler.h"
#import "SiriSendMessageIntentHandler.h"
#import "SiriSearchMessageIntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

@interface SiriIntentHandler () <INIntentHandlerProviding>
@end

@implementation SiriIntentHandler
- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    id handler = nil;
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INSendMessageIntent class]]) {
        handler = [SiriSendMessageIntentHandler new];
    }
    else if ([intent isKindOfClass:[INSearchForMessagesIntent class]]) {
        handler = [SiriSearchMessageIntentHandler new];
    }
    return handler;
}

+ (void)searchContactWithCategory:(NKSiriIntentHandlerContactCategory)aCategory value:(NSString *)aValue completionBlock:(SiriIntentHandlerBlock)aCompletionBlock{
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (!granted) {
            return;
        }
        NSError *fetchError;
        __block INPerson *matchedPerson = nil;
        CNContactFetchRequest *request = nil;
        switch (aCategory) {
            case NKSiriIntentHandlerContactCategoryFullname:
            {
                request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey,CNContactFamilyNameKey,CNContactGivenNameKey]];
                [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
                    NSString *fullName = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
                    if([fullName isEqualToString:aValue]){
                        matchedPerson = [[INPerson alloc] initWithHandle:@"" displayName:fullName contactIdentifier:contact.identifier];
                        *stop = YES;
                    }
                }];
                break;
            }
            case NKSiriIntentHandlerContactCategoryEmail:
            {
                request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey,CNContactFamilyNameKey,CNContactGivenNameKey,CNContactEmailAddressesKey]];
                [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
                    NSString *fullName = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
                    CNLabeledValue<NSString*> *emailValue = contact.emailAddresses.firstObject;
                    if([emailValue.value isEqualToString:aValue]){
                        matchedPerson = [[INPerson alloc] initWithHandle:@"" displayName:fullName contactIdentifier:contact.identifier];
                        *stop = YES;
                    }
                }];
                break;
            }
            default:
                break;
        }
        if(aCompletionBlock)
            aCompletionBlock(matchedPerson);
    }];
}
@end
