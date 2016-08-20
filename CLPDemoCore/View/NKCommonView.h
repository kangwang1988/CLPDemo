//
//  NKCommonView.h
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLPDemoCore.h"

@interface NKCommonView : UIView
- (void)commonInit;
- (void)makeConstraints;
- (void)initUIComponents;
- (void)updateUIComponents;
- (CGFloat)estimatedWidthWithConstraintHeight:(CGFloat)aConstraintHeight;
- (CGFloat)estimatedHeightWithConstraintWidth:(CGFloat)aConstraintWidth;
@end
