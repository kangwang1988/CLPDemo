//
//  SiriPauseWorkoutIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/3/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriPauseWorkoutIntentHandler.h"

@implementation SiriPauseWorkoutIntentHandler
- (void)handlePauseWorkout:(INPauseWorkoutIntent *)intent
                completion:(void (^)(INPauseWorkoutIntentResponse *response))completion NS_SWIFT_NAME(handle(pauseWorkout:completion:)){
    completion([[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmPauseWorkout:(INPauseWorkoutIntent *)intent
                 completion:(void (^)(INPauseWorkoutIntentResponse *response))completion NS_SWIFT_NAME(confirm(pauseWorkout:completion:)){
        completion([[INPauseWorkoutIntentResponse alloc] initWithCode:INPauseWorkoutIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveWorkoutNameForPauseWorkout:(INPauseWorkoutIntent *)intent
                           withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutName(forPauseWorkout:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.workoutName]);
}
@end
