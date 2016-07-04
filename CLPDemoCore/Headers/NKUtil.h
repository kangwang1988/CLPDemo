//
//  NKUtil.h
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <Intents/Intents.h>
#import <Contacts/Contacts.h>
@class NKNavigationController;

typedef NS_ENUM(NSInteger,NKContactCategory){
    NKContactCategoryFullname,
    NKContactCategoryEmail,
    NKContactCategoryIdentifier
};

typedef void (^NKUtilContactBlock)(CNContact *);

@interface NKUtil : NSObject
+ (id)reinterpretObject:(NSObject *)aObj toClassOrNil:(Class)aClass;
+ (void)searchContactWithCategory:(NKContactCategory)aCategory value:(NSString *)aValue completionBlock:(NKUtilContactBlock)aCompletionBlock;
@end
