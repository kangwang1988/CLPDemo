//
//  NKContactService.m
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKContactService.h"

@implementation NKContactService
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
        [self requestContactPermission];
    }
    return self;
}

- (void)commonInit{
}

- (void)requestContactPermission{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"This app previously was refused permissions to contacts; Please go to settings and grant permission to this app so it can use contacts" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [[[UIApplication sharedApplication].delegate window].rootViewController presentViewController:alert animated:TRUE completion:nil];
        return;
    }
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
    }];
}
@end
