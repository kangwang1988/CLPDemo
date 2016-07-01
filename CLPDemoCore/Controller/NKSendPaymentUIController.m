//
//  NKSendPaymentUIController.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSendPaymentUIController.h"
#import "NKSendPaymentUIView.h"

@interface NKSendPaymentUIController()
{
    NKSendPaymentUIView *_sendPaymentUIView;
}
@end

@implementation NKSendPaymentUIController
- (instancetype)initWithPayee:(NSString *)aPayee amount:(NSString *)aAmount note:(NSString *)aNote{
    if(self = [super init]){
        _sendPaymentUIView = [[NKSendPaymentUIView alloc] initWithPayee:aPayee amount:aAmount note:aNote];
    }
    return self;
}

- (void)loadView{
    [self setView:_sendPaymentUIView];
}
@end
