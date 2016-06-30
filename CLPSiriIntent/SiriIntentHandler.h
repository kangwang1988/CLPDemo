//
//  SiriIntentHandler.h
//  CLPSiriIntent
//
//  Created by KyleWong on 6/26/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <Intents/Intents.h>
#import "CLPDemoCore.h"

typedef void (^SiriIntentHandlerBlock)(INPerson *);

typedef NS_ENUM(NSInteger,NKSiriIntentHandlerContactCategory){
    NKSiriIntentHandlerContactCategoryFullname,
    NKSiriIntentHandlerContactCategoryEmail
};

@interface SiriIntentHandler : INExtension
+ (void)searchContactWithCategory:(NKSiriIntentHandlerContactCategory)aCategory value:(NSString *)aValue completionBlock:(SiriIntentHandlerBlock)aCompletionBlock;
@end
