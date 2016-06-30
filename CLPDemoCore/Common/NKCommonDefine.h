//
//  NKCommonDefine.h
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#ifndef NKCommonDefine_h
#define NKCommonDefine_h

#import <Foundation/Foundation.h>

#define kScreenScale    [[UIScreen mainScreen] scale]
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight    [[UIScreen mainScreen] bounds].size.height
#define FONT(x) [UIFont fontWithName:@"Helvetica" size:(x)]
#define kPixelFrom750(x) kScreenScale*kScreenWidth/750*(x)
FOUNDATION_EXPORT NSString *kFeatureSiri;
FOUNDATION_EXPORT NSString *kAuthorEmail;
FOUNDATION_EXPORT NSString *kBuddyEmail;
FOUNDATION_EXPORT NSString *kKeyActivityTypeAudioCall;
FOUNDATION_EXPORT NSString *kKeyActivityUserInfoContactIdentifier;
#endif /* NKCommonDefine_h */
