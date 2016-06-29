//
//  NKSiriService.m
//  CLPDemo
//
//  Created by KyleWong on 6/24/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSiriService.h"
#import "CLPDemoCore.h"
#import<Intents/Intents.h>

@interface NKSiriService()
@end

@implementation NKSiriService
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    [self requestSiriPermission];
    [self requestContactPermission];
    [self registerVocabularies];
}

- (void)requestSiriPermission{
    [INPreferences requestSiriAuthorization:^(INSiriAuthorizationStatus status) {
        if(status != INSiriAuthorizationStatusAuthorized){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"权限被禁止" message:@"请打开Siri权限以便为您更好提供服务" preferredStyle:UIAlertControllerStyleAlert];
            [extensionContentVC presentViewController:alert animated:YES completion:^{
                
            }];
        }
    }];
}

- (void)requestContactPermission{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"This app previously was refused permissions to contacts; Please go to settings and grant permission to this app so it can use contacts" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [extensionContentVC presentViewController:alert animated:YES completion:^{
        }];
        return;
    }
}

- (void)registerVocabularies{
//    NSOrderedSet *contactNames = [[NSOrderedSet alloc] initWithObjects:@"",nil];
//    INVocabulary* vocabulary = [INVocabulary sharedVocabulary];
//    [vocabulary setVocabularyStrings:contactNames
//                              ofType:INVocabularyStringTypeContactName];
}
@end
