//
//  SiriIntentViewController.m
//  CLPSiriIntentUI
//
//  Created by KyleWong on 6/26/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//
#import <Intents/Intents.h>
#import "CLPDemoCore.h"
#import "SiriIntentViewController.h"
#import "NKMessageUIController.h"
// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"

@interface SiriIntentViewController ()<INUIHostedViewSiriProviding>
@end

@implementation SiriIntentViewController
- (void)loadView{
    UIView *view = [UIView new];
    [view setBackgroundColor:[UIColor whiteColor]];
    [self setView:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    extensionContentVC = self;
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - INUIHostedViewControlling

// Prepare your view controller for the interaction to handle.
- (void)configureWithInteraction:(INInteraction *)interaction context:(INUIHostedViewContext)context completion:(void (^)(CGSize))completion {
    // Do configuration here, including preparing views and calculating a desired size for presentation.
    CGSize size = CGSizeZero;
    if([interaction.intent isKindOfClass:[INSendMessageIntent class]]){
        INSendMessageIntent *intent = (INSendMessageIntent *) interaction.intent;
        NKMessageUIController *msgUIController = [[NKMessageUIController alloc] initWithDisplayName:((INPerson *)intent.recipients.firstObject).displayName content:intent.content];
        [self presentViewController:msgUIController animated:NO completion:nil];
        size = [self desiredSize];
        NKCommonView *commonView = [NKUtil reinterpretObject:msgUIController.view toClassOrNil:[NKCommonView class]];
        if(commonView)
            size.height = MIN(size.height,[commonView estimatedHeightWithConstraintWidth:size.width]);
    }
    if (completion) {
        completion(size);
    }
}

- (CGSize)desiredSize {
    return self.extensionContext.hostedViewMaximumAllowedSize;
}

- (BOOL)displaysMessage{
    return TRUE;
}
@end
