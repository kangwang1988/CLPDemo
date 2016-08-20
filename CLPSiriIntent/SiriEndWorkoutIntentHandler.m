//
//  SiriEndWorkoutIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/3/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriEndWorkoutIntentHandler.h"

@implementation SiriEndWorkoutIntentHandler
- (void)handleEndWorkout:(INEndWorkoutIntent *)intent
              completion:(void (^)(INEndWorkoutIntentResponse *response))completion NS_SWIFT_NAME(handle(endWorkout:completion:)){
    completion([[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmEndWorkout:(INEndWorkoutIntent *)intent
               completion:(void (^)(INEndWorkoutIntentResponse *response))completion NS_SWIFT_NAME(confirm(endWorkout:completion:)){
        completion([[INEndWorkoutIntentResponse alloc] initWithCode:INEndWorkoutIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveWorkoutNameForEndWorkout:(INEndWorkoutIntent *)intent
                         withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutName(forEndWorkout:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.workoutName]);
}
@end
