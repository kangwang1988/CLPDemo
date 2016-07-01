//
//  SiriISendPaymentntentHandler.m
//  CLPDemo
//
//  Created by KyleWong on 7/1/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "SiriISendPaymentntentHandler.h"
#import "CLPDemoCore.h"

@implementation SiriISendPaymentntentHandler
- (void)handleSendPayment:(INSendPaymentIntent *)intent
               completion:(void (^)(INSendPaymentIntentResponse *response))completion NS_SWIFT_NAME(handle(sendPayment:completion:)){
    INSendPaymentIntentResponse *resp = [[INSendPaymentIntentResponse alloc] initWithCode:INSendPaymentIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeSendPayment]];
    [NKUtil searchContactWithCategory:NKContactCategoryEmail value:kAuthorEmail completionBlock:^(CNContact *aContact) {
        [resp setPaymentRecord:[[INPaymentRecord alloc] initWithPayee:intent.payee payer:[[INPerson alloc] initWithHandle:@"" displayName:kAuthorEmail contactIdentifier:aContact.identifier] currencyAmount:intent.currencyAmount paymentMethod:intent.paymentMethod note:intent.note status:INPaymentStatusCompleted]];
        completion(resp);
    }];
}

- (void)confirmSendPayment:(INSendPaymentIntent *)intent
                completion:(void (^)(INSendPaymentIntentResponse *response))completion NS_SWIFT_NAME(confirm(sendPayment:completion:)){
    INSendPaymentIntentResponse *resp = [[INSendPaymentIntentResponse alloc] initWithCode:INSendPaymentIntentResponseCodeSuccess userActivity:[[NSUserActivity alloc] initWithActivityType:kActivityTypeSendPayment]];
    [NKUtil searchContactWithCategory:NKContactCategoryEmail value:kAuthorEmail completionBlock:^(CNContact *aContact) {
        [resp setPaymentRecord:[[INPaymentRecord alloc] initWithPayee:intent.payee payer:[[INPerson alloc] initWithHandle:@"" displayName:kAuthorEmail contactIdentifier:aContact.identifier] currencyAmount:intent.currencyAmount paymentMethod:intent.paymentMethod note:intent.note status:INPaymentStatusCompleted]];
        completion(resp);
    }];
}

- (void)resolvePayeeForSendPayment:(INSendPaymentIntent *)intent
                    withCompletion:(void (^)(INPersonResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePayee(forSendPayment:with:)){
    completion([INPersonResolutionResult successWithResolvedPerson:intent.payee]);
}

- (void)resolveCurrencyAmountForSendPayment:(INSendPaymentIntent *)intent
                             withCompletion:(void (^)(INCurrencyAmountResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveCurrencyAmount(forSendPayment:with:)){
    INCurrencyAmount *amount = [[INCurrencyAmount alloc] initWithAmount:intent.currencyAmount.amount currencyCode:@"CNY"];
    completion([INCurrencyAmountResolutionResult successWithResolvedCurrencyAmount:amount]);
}

- (void)resolveNoteForSendPayment:(INSendPaymentIntent *)intent
                   withCompletion:(void (^)(INStringResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolveNote(forSendPayment:with:)){
    completion([INStringResolutionResult successWithResolvedString:intent.note.length?intent.note:@"转账"]);
}

- (void)resolvePaymentMethodForSendPayment:(INSendPaymentIntent *)intent
                            withCompletion:(void (^)(INPaymentMethodResolutionResult *resolutionResult))completion NS_SWIFT_NAME(resolvePaymentMethod(forSendPayment:with:)){
    INPaymentMethod *method = [[INPaymentMethod alloc] initWithType:INPaymentMethodTypePrepaid name:kAuthorEmail icon:[INImage imageWithURL:[NSURL URLWithString:kURLSampleSmallPng]]];
    completion([INPaymentMethodResolutionResult successWithResolvedPaymentMethod:method]);
}
@end
