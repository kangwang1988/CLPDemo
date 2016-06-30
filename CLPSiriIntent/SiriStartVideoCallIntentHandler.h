//
//  SiriStartVideoCallIntentHandler.h
//  CLPDemo
//
//  Created by KyleWong on 6/30/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import <Intents/Intents.h>
//似乎进不了自定义的Intent，会默认调起系统Facetime.
@interface SiriStartVideoCallIntentHandler : INExtension<INStartVideoCallIntentHandling>

@end
