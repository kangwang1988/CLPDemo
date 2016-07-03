//
//  SiriResumeWorkoutIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/3/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriResumeWorkoutIntentHandler.h"

@implementation SiriResumeWorkoutIntentHandler
- (void)handleResumeWorkout:(INResumeWorkoutIntent *)intent
                 completion:(void (^)(INResumeWorkoutIntentResponse *response))completion NS_SWIFT_NAME(handle(resumeWorkout:completion:)){
    completion([[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmResumeWorkout:(INResumeWorkoutIntent *)intent
                  completion:(void (^)(INResumeWorkoutIntentResponse *response))completion NS_SWIFT_NAME(confirm(resumeWorkout:completion:)){
    completion([[INResumeWorkoutIntentResponse alloc] initWithCode:INResumeWorkoutIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveWorkoutNameForResumeWorkout:(INResumeWorkoutIntent *)intent
                            withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutName(forResumeWorkout:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.workoutName]);
}
@end
