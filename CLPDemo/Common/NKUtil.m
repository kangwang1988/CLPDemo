//
//  NKUtil.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKUtil.h"

@implementation NKUtil
+ (id)reinterpretObject:(NSObject *)aObj toClassOrNil:(Class)aClass{
    if([aObj isKindOfClass:aClass]){
        return aObj;
    }
    else{
        return nil;
    }
}

+ (NKNavigationController *)rootNav{
    return (NKNavigationController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
}
@end
