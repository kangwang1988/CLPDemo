//
//  NKSendMessageUIView.h
//  CLPDemo
//
//  Created by KyleWong on 6/27/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NKCommonView.h"

@interface NKSendMessageUIView : NKCommonView
- (void)updateWithName:(NSString *)aName content:(NSString *)aContent;
@end
