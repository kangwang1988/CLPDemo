//
//  NKSearchMessageUIController.m
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSearchMessageUIController.h"
#import "NKSearchMessageUIView.h"
#import <Intents/INMessage.h>

@interface NKSearchMessageUIController()
{
    NKSearchMessageUIView *_searchMsgUIView;
    NSString *_criterion;
    NSArray<INMessage *> *_msgs;
}
@end

@implementation NKSearchMessageUIController
- (instancetype)initWithCriterion:(NSString *)aCriterion msgs:(NSArray *)aMsgs{
    if(self = [super init]){
        _criterion = [aCriterion copy];
        _msgs = [aMsgs copy];
    }
    return self;
}

- (void)loadView{
    _searchMsgUIView = [NKSearchMessageUIView new];
    [self setView:_searchMsgUIView];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_searchMsgUIView updateWithCriterion:_criterion msgs:_msgs];
}
@end
