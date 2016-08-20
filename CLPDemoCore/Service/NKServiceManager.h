//
//  NKServiceManager.h
//  CLPDemo
//
//  Created by KyleWong on 6/24/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKSiriService.h"
#import "NKLocationService.h"
#import "NKContactService.h"

@interface NKServiceManager : NSObject
@property (nonatomic,strong) NKSiriService *siriService;
@property (nonatomic,strong) NKLocationService *locationService;
@property (nonatomic,strong) NKContactService *contactService;
+ (instancetype)sharedManager;
@end
