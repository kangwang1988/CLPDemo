//
//  NKMessageUIController.m
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKMessageUIController.h"
#import "NKMessageUIView.h"

@interface NKMessageUIController ()
{
    NKMessageUIView *_messageUIView;
}
@end
@implementation NKMessageUIController
- (void)loadView{
    _messageUIView = [NKMessageUIView new];
    [self setView:_messageUIView];
}
@end
