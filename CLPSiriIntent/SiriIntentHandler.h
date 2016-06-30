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

@interface SiriIntentHandler : INExtension
+ (void)searchContactWithName:(NSString *)aName completionBlock:(SiriIntentHandlerBlock)aCompletionBlock;
+ (void)searchContactWithEmail:(NSString *)aEmail completionBlock:(SiriIntentHandlerBlock)aCompletionBlock;
@end
