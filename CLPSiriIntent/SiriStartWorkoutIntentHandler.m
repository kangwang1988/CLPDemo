//
//  SiriStartWorkoutIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/3/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriStartWorkoutIntentHandler.h"

@implementation SiriStartWorkoutIntentHandler
- (void)handleStartWorkout:(INStartWorkoutIntent *)intent
                completion:(void (^)(INStartWorkoutIntentResponse *response))completion NS_SWIFT_NAME(handle(startWorkout:completion:)){
    completion([[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)confirmStartWorkout:(INStartWorkoutIntent *)intent
                 completion:(void (^)(INStartWorkoutIntentResponse *response))completion NS_SWIFT_NAME(confirm(startWorkout:completion:)){
        completion([[INStartWorkoutIntentResponse alloc] initWithCode:INStartWorkoutIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]]);
}

- (void)resolveWorkoutNameForStartWorkout:(INStartWorkoutIntent *)intent
                           withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutName(forStartWorkout:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.workoutName]);
}

- (void)resolveGoalValueForStartWorkout:(INStartWorkoutIntent *)intent
                         withCompletion:(void (^)(INDoubleResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveGoalValue(forStartWorkout:with:)){
    completion([INDoubleResolutionResult successWithResolvedValue:intent.goalValue.doubleValue]);
}

- (void)resolveWorkoutGoalUnitTypeForStartWorkout:(INStartWorkoutIntent *)intent
                                   withCompletion:(void (^)(INWorkoutGoalUnitTypeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutGoalUnitType(forStartWorkout:with:)){
    completion([INWorkoutGoalUnitTypeResolutionResult successWithResolvedValue:intent.workoutGoalUnitType]);
}

- (void)resolveWorkoutLocationTypeForStartWorkout:(INStartWorkoutIntent *)intent
                                   withCompletion:(void (^)(INWorkoutLocationTypeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveWorkoutLocationType(forStartWorkout:with:)){
    completion([INWorkoutLocationTypeResolutionResult successWithResolvedValue:intent.workoutLocationType]);
}

- (void)resolveIsOpenEndedForStartWorkout:(INStartWorkoutIntent *)intent
                           withCompletion:(void (^)(INBooleanResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveIsOpenEnded(forStartWorkout:with:)){
    completion([INBooleanResolutionResult successWithResolvedValue:intent.isOpenEnded]);
}
@end
