//
//  NKSearchMessageUIController.h
//  CLPDemo
//
//  Created by KyleWong on 6/29/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Intents/INMessage.h>

@interface NKSearchMessageUIController : UIViewController
- (instancetype)initWithCriterion:(NSString *)aCriterion msgs:(NSArray<INMessage *> *)aMsgs;
@end
