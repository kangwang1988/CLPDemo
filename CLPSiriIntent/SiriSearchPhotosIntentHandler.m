//
//  SiriSearchPhotosIntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriSearchPhotosIntentHandler.h"

@implementation SiriSearchPhotosIntentHandler
- (void)handleSearchForPhotos:(INSearchForPhotosIntent *)intent
                   completion:(void (^)(INSearchForPhotosIntentResponse *response))completion NS_SWIFT_NAME(handle(searchForPhotos:completion:)){
    INSearchForPhotosIntentResponse *response = [[INSearchForPhotosIntentResponse alloc] initWithCode:INSearchForPhotosIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@""]];
    [response setSearchResultsCount:@(1)];
    completion(response);
}

- (void)confirmSearchForPhotos:(INSearchForPhotosIntent *)intent
                    completion:(void (^)(INSearchForPhotosIntentResponse *response))completion NS_SWIFT_NAME(confirm(searchForPhotos:completion:)){
    INSearchForPhotosIntentResponse *response = [[INSearchForPhotosIntentResponse alloc] initWithCode:INSearchForPhotosIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:@""]];
    [response setSearchResultsCount:@(1)];
    completion(response);
}

- (void)resolveDateCreatedForSearchForPhotos:(INSearchForPhotosIntent *)intent
                              withCompletion:(void (^)(INDateComponentsRangeResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveDateCreated(forSearchForPhotos:with:)){
    completion([INDateComponentsRangeResolutionResult successWithResolvedDateComponentsRange:intent.dateCreated]);
}

- (void)resolveLocationCreatedForSearchForPhotos:(INSearchForPhotosIntent *)intent
                                  withCompletion:(void (^)(INPlacemarkResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveLocationCreated(forSearchForPhotos:with:)){
    completion([INPlacemarkResolutionResult successWithResolvedPlacemark:intent.locationCreated]);
}

- (void)resolveAlbumNameForSearchForPhotos:(INSearchForPhotosIntent *)intent
                            withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveAlbumName(forSearchForPhotos:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.albumName]);
}

- (void)resolveSearchTermsForSearchForPhotos:(INSearchForPhotosIntent *)intent
                              withCompletion:(void (^)(NSArray<INStringResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolveSearchTerms(forSearchForPhotos:with:)){
    NSMutableArray *array = [NSMutableArray array];
    [intent.searchTerms enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INStringResolutionResult successWithResolvedString:obj]];
    }];
    completion(array);
}

- (void)resolveIncludedAttributesForSearchForPhotos:(INSearchForPhotosIntent *)intent
                                     withCompletion:(void (^)(INPhotoAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveIncludedAttributes(forSearchForPhotos:with:)){
    completion([INPhotoAttributeOptionsResolutionResult successWithResolvedValue:intent.includedAttributes]);
}

- (void)resolveExcludedAttributesForSearchForPhotos:(INSearchForPhotosIntent *)intent
                                     withCompletion:(void (^)(INPhotoAttributeOptionsResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveExcludedAttributes(forSearchForPhotos:with:)){
    completion([INPhotoAttributeOptionsResolutionResult successWithResolvedValue:intent.excludedAttributes]);
}

- (void)resolvePeopleInPhotoForSearchForPhotos:(INSearchForPhotosIntent *)intent
                                withCompletion:(void (^)(NSArray<INPersonResolutionResult *> *resolutionResults))completion NS_SWIFT_NAME(resolvePeopleInPhoto(forSearchForPhotos:with:)){
    NSMutableArray *array  = [NSMutableArray array];
    [intent.peopleInPhoto enumerateObjectsUsingBlock:^(INPerson * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:[INPersonResolutionResult successWithResolvedPerson:obj]];
    }];
    completion(array);
}
@end
