//
//  NKServiceManager.m
//  CLPDemo
//
//  Created by KyleWong on 6/24/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKServiceManager.h"

static NKServiceManager *sServiceManager  = nil;

@implementation NKServiceManager
+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sServiceManager = [NKServiceManager new];
    });
    return sServiceManager;
}

- (instancetype)init{
    if(self = [super init]){
        _siriService = [NKSiriService new];
        _locationService = [NKLocationService new];
    }
    return self;
}
@end
