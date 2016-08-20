//
//  SiriIRequestPaymentntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriIRequestPaymentntentHandler.h"
#import "CLPDemoCore.h"

@implementation SiriIRequestPaymentntentHandler
- (void)handleRequestPayment:(INRequestPaymentIntent *)intent
                  completion:(void (^)(INRequestPaymentIntentResponse *response))completion NS_SWIFT_NAME(handle(requestPayment:completion:)){
    INRequestPaymentIntentResponse *resp = [[INRequestPaymentIntentResponse alloc] initWithCode:INRequestPaymentIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestPayment]];
    [NKUtil searchContactWithCategory:NKContactCategoryEmail value:kAuthorEmail completionBlock:^(CNContact *aContact) {
        [resp setPaymentRecord:[[INPaymentRecord alloc] initWithPayee:[[INPerson alloc] initWithHandle:@"" displayName:kAuthorEmail contactIdentifier:aContact.identifier] payer:intent.payer currencyAmount:intent.currencyAmount paymentMethod:nil note:intent.note status:INPaymentStatusCompleted]];
        completion(resp);
    }];
}

- (void)confirmRequestPayment:(INRequestPaymentIntent *)intent
                   completion:(void (^)(INRequestPaymentIntentResponse *response))completion NS_SWIFT_NAME(confirm(requestPayment:completion:)){
    INRequestPaymentIntentResponse *resp = [[INRequestPaymentIntentResponse alloc] initWithCode:INRequestPaymentIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeRequestPayment]];
    [NKUtil searchContactWithCategory:NKContactCategoryEmail value:kAuthorEmail completionBlock:^(CNContact *aContact) {
        [resp setPaymentRecord:[[INPaymentRecord alloc] initWithPayee:[[INPerson alloc] initWithHandle:@"" displayName:kAuthorEmail contactIdentifier:aContact.identifier] payer:intent.payer currencyAmount:intent.currencyAmount paymentMethod:nil note:intent.note status:INPaymentStatusCompleted]];
        completion(resp);
    }];
}

- (void)resolvePayerForRequestPayment:(INRequestPaymentIntent *)intent
                       withCompletion:(void (^)(INPersonResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePayer(forRequestPayment:with:)){
    completion([INPersonResolutionResult successWithResolvedPerson:intent.payer]);
}

- (void)resolveCurrencyAmountForRequestPayment:(INRequestPaymentIntent *)intent
                                withCompletion:(void (^)(INCurrencyAmountResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveCurrencyAmount(forRequestPayment:with:)){
    INCurrencyAmount *amount = [[INCurrencyAmount alloc] initWithAmount:intent.currencyAmount.amount currencyCode:@"CNY"];
    completion([INCurrencyAmountResolutionResult successWithResolvedCurrencyAmount:amount]);
}

- (void)resolveNoteForRequestPayment:(INRequestPaymentIntent *)intent
                      withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveNote(forRequestPayment:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.note.length?intent.note:@"收账"]);
}
@end
