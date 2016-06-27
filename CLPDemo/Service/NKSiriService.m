//
//  NKSiriService.m
//  CLPDemo
//
//  Created by KyleWong on 6/24/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSiriService.h"
#import<Intents/Intents.h>

@interface NKSiriService()
{
    MSWeakTimer *_timer;
}
@end

@implementation NKSiriService
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    _timer = [MSWeakTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimerExpired:) userInfo:nil repeats:YES dispatchQueue:dispatch_get_global_queue(0, 0)];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(defaultsChanged:)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    [self requestSiriPermission];
    [self requestContactPermission];
    [self registerVocabularies];
}

- (void)defaultsChanged:(NSNotification *)notification {
    // Get the user defaults
    NSUserDefaults *defaults = (NSUserDefaults *)[notification object];
    NSLog(@"[KWLM]:%@", [defaults objectForKey:@"abbr"]);
}


- (void)onTimerExpired:(MSWeakTimer *)aTimer{
    NSLog(@"onTimerExpired");
}

- (void)requestSiriPermission{
    [INPreferences requestSiriAuthorization:^(INSiriAuthorizationStatus status) {
        if(status != INSiriAuthorizationStatusAuthorized){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"权限被禁止" message:@"请打开Siri权限以便为您更好提供服务" preferredStyle:UIAlertControllerStyleAlert];
            [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:YES completion:^{
                
            }];
        }
    }];
}

- (void)requestContactPermission{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"This app previously was refused permissions to contacts; Please go to settings and grant permission to this app so it can use contacts" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [[[[[UIApplication sharedApplication] delegate] window] rootViewController] presentViewController:alert animated:YES completion:^{
            
        }];
        return;
    }
}

- (void)registerVocabularies{
    NSOrderedSet *contactNames = [[NSOrderedSet alloc] initWithObjects:@"",nil];
    INVocabulary* vocabulary = [INVocabulary sharedVocabulary];
    [vocabulary setVocabularyStrings:contactNames
                              ofType:INVocabularyStringTypeContactName];
}
@end
