//
//  IntentViewController.m
//  CLPSiriIntentUI
//
//  Created by KyleWong on 6/26/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "IntentViewController.h"
#import "NKMessageUIController.h"
#import "UCChatViewController.h"
#import "INInteraction+UnicornCore.h"

// As an example, this extension's Info.plist has been configured to handle interactions for INStartWorkoutIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Start my workout using <myApp>"
#import <Intents/Intents.h>
#import "UCChatViewController.h"
#import "UCContact.h"

@interface IntentViewController ()
@end

@implementation IntentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        UCChatViewController * chatViewController = [UCChatViewController new];
        [chatViewController setMessageContent:@"内容"];
        UCContact *contact  = [UCContact new];
        contact.name = interaction.recipientName;
        chatViewController.recipient = contact;
        [chatViewController setSent:false];
        [self presentViewController:chatViewController animated:false completion:nil];
        size = [self desiredSize];
    }
    if (completion) {
        completion(size);
    }
}

- (CGSize)desiredSize {
    return self.extensionContext.hostedViewMaximumAllowedSize;
}
@end
