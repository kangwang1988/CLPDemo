//
//  NKSendMessageUIController.m
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSendMessageUIController.h"
#import "NKSendMessageUIView.h"

@interface NKSendMessageUIController ()
{
    NKSendMessageUIView *_messageUIView;
    NSString *_recipientName;
    id _content;
}
@end
@implementation NKSendMessageUIController
- (instancetype)initWithRecipientName:(NSString *)aRecipientName content:(id)aContent{
    if(self = [super init]){
        _recipientName = aRecipientName;
        _content = aContent;
    }
    return self;
}

- (void)loadView{
    _messageUIView = [NKSendMessageUIView new];
    [self setView:_messageUIView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_messageUIView updateWithName:_recipientName content:_content];
}
@end
