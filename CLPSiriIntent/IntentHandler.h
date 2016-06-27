//
//  IntentHandler.h
//  CLPSiriIntent
//
//  Created by KyleWong on 6/26/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <Intents/Intents.h>

typedef void (^IntentHandlerBlock)(NSArray<INPerson *> *);

@interface IntentHandler : INExtension

@end
