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
    NSString *_displayName;
    id _content;
}
@end
@implementation NKMessageUIController
- (instancetype)initWithDisplayName:(NSString *)aDisplayName content:(id)aContent{
    if(self = [super init]){
        _displayName = aDisplayName;
        _content = aContent;
    }
    return self;
}

- (void)loadView{
    _messageUIView = [NKMessageUIView new];
    [self setView:_messageUIView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_messageUIView updateWithName:_displayName content:_content];
}
@end
