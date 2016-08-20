//
//  SiriCancelWorkoutIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/3/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriCancelWorkoutIntentHandler.h"

@implementation SiriCancelWorkoutIntentHandler
- (void)handleCancelWorkout:(INCancelWorkoutIntent *)intent
                 completion:(void (^)(INCancelWorkoutIntentResponse *response))completion NS_SWIFT_NAME(handle(cancelWorkout:completion:)){
    completion([[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmCancelWorkout:(INCancelWorkoutIntent *)intent
                  completion:(void (^)(INCancelWorkoutIntentResponse *response))completion NS_SWIFT_NAME(confirm(cancelWorkout:completion:)){
        completion([[INCancelWorkoutIntentResponse alloc] initWithCode:INCancelWorkoutIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveWorkoutNameForCancelWorkout:(INCancelWorkoutIntent *)intent
                            withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutName(forCancelWorkout:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.workoutName]);
}
@end
