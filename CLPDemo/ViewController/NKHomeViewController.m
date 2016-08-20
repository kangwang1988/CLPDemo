//
//  NKHomeViewController.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKHomeViewController.h"
#import "NKHomeView.h"
#import "NKHomeTableViewAdapter.h"
#import "NKSiriViewController.h"
#import "CLPDemoCore.h"
#import "NKAutohomeController.h"

@interface NKHomeViewController ()<NKSectionedTableViewAdapterDelegate>
@property (nonatomic,strong) NKHomeView *homeView;
@property (nonatomic,strong) NKHomeTableViewAdapter *adapter;
@end

@implementation NKHomeViewController
- (void)loadView{
    [super loadView];
    self.homeView = [NKHomeView new];
    [self setView:self.homeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Features"];
    self.adapter = [[NKHomeTableViewAdapter alloc] init];
    [self.adapter setDataSource:[@{@"0":@[kFeatureSiri,kFeatureAutohome]} mutableCopy]];
    [self.homeView.tableView setTableViewAdapter:self.adapter];
    [self.adapter setDelegate:self];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NKSectionedTableViewAdapterDelegate
- (void)tableViewAdapter:(NKSectionedTableViewAdapter *)aAdapter didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath{
    NKBaseViewController *vc = nil;
    NSString *featureName = [self.adapter dataAtIndexPath:aIndexPath];
    if([featureName isEqualToString:kFeatureSiri]){
        vc = [NKSiriViewController new];
    }
    else if([featureName isEqualToString:kFeatureAutohome]){
        vc = [NKAutohomeController new];
    }
    [self.navigationController pushViewController:vc animated:YES];
}
@end
