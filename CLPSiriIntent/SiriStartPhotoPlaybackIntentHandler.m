//
//  SiriStartPhotoPlaybackIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriStartPhotoPlaybackIntentHandler.h"

@implementation SiriStartPhotoPlaybackIntentHandler
- (void)handleStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                      completion:(void (^)(INStartPhotoPlaybackIntentResponse *response))completion NS_SWIFT_NAME(handle(startPhotoPlayback:completion:)){
    INStartPhotoPlaybackIntentResponse *response = [[INStartPhotoPlaybackIntentResponse alloc] initWithCode:INStartPhotoPlaybackIntentResponseCodeReady userActivity:[[NSUserActivity alloc] initWithActivityType:@""]];
    [response setSearchResultsCount:@(1)];
    completion(response);
}

- (void)confirmStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                       completion:(void (^)(INStartPhotoPlaybackIntentResponse *response))completion NS_SWIFT_NAME(confirm(startPhotoPlayback:completion:)){
    INStartPhotoPlaybackIntentResponse *response = [[INStartPhotoPlaybackIntentResponse alloc] initWithCode:INStartPhotoPlaybackIntentResponseCodeContinueInApp userActivity:[[NSUserActivity alloc] initWithActivityType:@""]];
    [response setSearchResultsCount:@(1)];
    completion(response);
}

- (void)resolveDateCreatedForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                 withCompletion:(void (^)(INDateComponentsRangeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDateCreated(forStartPhotoPlayback:with:)){
    completion([INDateComponentsRangeResolutionResult successWithResolvedDateComponentsRange:intent.dateCreated]);
}

- (void)resolveLocationCreatedForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                     withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveLocationCreated(forStartPhotoPlayback:with:)){
    completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.locationCreated]);
}

- (void)resolveAlbumNameForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                               withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveAlbumName(forStartPhotoPlayback:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.albumName]);
}

- (void)resolveSearchTermsForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                 withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSearchTerms(forStartPhotoPlayback:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.searchTerms enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
    }];
    completion(array);
}

- (void)resolveIncludedAttributesForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                        withCompletion:(void (^)(INPhotoAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveIncludedAttributes(forStartPhotoPlayback:with:)){
    completion([INPhotoAttributeOptionsResolutionResult successWithResolvedValue:intent.includedAttributes]);
}

- (void)resolveExcludedAttributesForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                        withCompletion:(void (^)(INPhotoAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveExcludedAttributes(forStartPhotoPlayback:with:)){
    completion([INPhotoAttributeOptionsResolutionResult successWithResolvedValue:intent.excludedAttributes]);
}

- (void)resolvePeopleInPhotoForStartPhotoPlayback:(INStartPhotoPlaybackIntent *)intent
                                   withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolvePeopleInPhoto(forStartPhotoPlayback:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.peopleInPhoto enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
    }];
    completion(array);
}
@end
