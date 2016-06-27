//
//  NKMessageUIView.m
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKMessageUIView.h"

@implementation NKMessageUIView
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    [self setBackgroundColor:[UIColor blueColor]];
}
@end
