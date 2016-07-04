//
//  NKSendPaymentUIView.h
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKCommonView.h"

@interface NKSendPaymentUIView : NKCommonView
- (instancetype)initWithPayee:(NSString *)aPayee amount:(NSString *)aAmount note:(NSString *)aNote;
@end
