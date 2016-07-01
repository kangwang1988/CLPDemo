//
//  SiriIntentHandler.m
//  CLPSiriIntent
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "CLPDemoCore.h"
#import "SiriIntentHandler.h"
#import "SiriSendMessageIntentHandler.h"
#import "SiriSearchMessageIntentHandler.h"
#import "SiriStartAudioCallIntentHandler.h"
#import "SiriStartVideoCallIntentHandler.h"
#import "SiriSearchCallHistoryIntentHandler.h"
#import "SiriSearchPhotosIntentHandler.h"
#import "SiriStartPhotoPlaybackIntentHandler.h"
#import "SiriISendPaymentntentHandler.h"
#import "SiriIRequestPaymentntentHandler.h"
#import "SiriListRideOptionsIntentHandler.h"
#import "SiriRequestRideIntentHandler.h"
#import "SiriGetRideStatusIntentHandler.h"

// As an example, this class is set up to handle the Workout intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

@interface SiriIntentHandler () <INIntentHandlerProviding>
@end

@implementation SiriIntentHandler
- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    id handler = nil;
    // You can substitute other objects for self based on the specific intent.
    if ([intent isKindOfClass:[INSendMessageIntent class]]) {
        handler = [SiriSendMessageIntentHandler new];
    }
    else if ([intent isKindOfClass:[INSearchForMessagesIntent class]]) {
        handler = [SiriSearchMessageIntentHandler new];
    }
    else if ([intent isKindOfClass:[INStartAudioCallIntent class]]) {
        handler = [SiriStartAudioCallIntentHandler new];
    }
    else if ([intent isKindOfClass:[INStartVideoCallIntent class]]) {
        handler = [SiriStartVideoCallIntentHandler new];
    }
    else if ([intent isKindOfClass:[INSearchCallHistoryIntent class]]) {
        handler = [SiriSearchCallHistoryIntentHandler new];
    }
    else if ([intent isKindOfClass:[INSearchForPhotosIntent class]]) {
        handler = [SiriSearchPhotosIntentHandler new];
    }
    else if ([intent isKindOfClass:[INStartPhotoPlaybackIntent class]]) {
        handler = [SiriStartPhotoPlaybackIntentHandler new];
    }
    else if ([intent isKindOfClass:[INSendPaymentIntent class]]) {
        handler = [SiriISendPaymentntentHandler new];
    }
    else if ([intent isKindOfClass:[INRequestPaymentIntent class]]) {
        handler = [SiriIRequestPaymentntentHandler new];
    }
    else if ([intent isKindOfClass:[INListRideOptionsIntent class]]) {
        handler = [SiriListRideOptionsIntentHandler new];
    }
    else if ([intent isKindOfClass:[INRequestRideIntent class]]) {
        handler = [SiriRequestRideIntentHandler new];
    }
    else if ([intent isKindOfClass:[INGetRideStatusIntent class]]) {
        handler = [SiriGetRideStatusIntentHandler new];
    }
    return handler;
}
@end
