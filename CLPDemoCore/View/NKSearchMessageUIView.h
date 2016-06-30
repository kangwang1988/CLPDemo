//
//  NKSearchMessageUIView.h
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKCommonView.h"
#import <Intents/INMessage.h>

@interface NKSearchMessageUIView : NKCommonView
- (void)updateWithCriterion:(NSString *)aCriterion msgs:(NSArray<INMessage *> *)aMsgs;
@end
