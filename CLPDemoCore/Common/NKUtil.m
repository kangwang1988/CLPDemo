//
//  NKUtil.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKUtil.h"

@implementation NKUtil
+ (id)reinterpretObject:(NSObject *)aObj toClassOrNil:(Class)aClass{
    if([aObj isKindOfClass:aClass]){
        return aObj;
    }
    else{
        return nil;
    }
}

+ (void)searchContactWithCategory:(NKContactCategory)aCategory value:(NSString *)aValue completionBlock:(NKUtilContactBlock)aCompletionBlock{
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (!granted) {
            return;
        }
        NSError *fetchError;
        __block CNContact *matchedContact = nil;
        CNContactFetchRequest *request = nil;
        switch (aCategory) {
            case NKContactCategoryFullname:
            {
                request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey,CNContactFamilyNameKey,CNContactGivenNameKey,CNContactPhoneNumbersKey]];
                [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
                    NSString *fullName = [NSString stringWithFormat:@"%@%@",contact.familyName,contact.givenName];
                    if([fullName isEqualToString:aValue]){
                        matchedContact = contact;
                        *stop = YES;
                    }
                }];
                break;
            }
            case NKContactCategoryEmail:
            {
                request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey,CNContactFamilyNameKey,CNContactGivenNameKey,CNContactEmailAddressesKey,CNContactPhoneNumbersKey]];
                [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
                    CNLabeledValue<NSString*> *emailValue = contact.emailAddresses.firstObject;
                    if([emailValue.value isEqualToString:aValue]){
                        matchedContact = contact;
                        *stop = YES;
                    }
                }];
                break;
            }
            case NKContactCategoryIdentifier:{
                request = [[CNContactFetchRequest alloc] initWithKeysToFetch:@[CNContactIdentifierKey,CNContactFamilyNameKey,CNContactGivenNameKey,CNContactEmailAddressesKey,CNContactPhoneNumbersKey]];
                [store enumerateContactsWithFetchRequest:request error:&fetchError usingBlock:^(CNContact *contact, BOOL *stop) {
                    if([contact.identifier isEqualToString:aValue]){
                        matchedContact = contact;
                        *stop = YES;
                    }
                }];
                break;
            }
            default:
                break;
        }
        if(aCompletionBlock)
            aCompletionBlock(matchedContact);
    }];
}
@end
