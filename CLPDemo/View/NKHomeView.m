//
//  NKHomeView.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKHomeView.h"

@implementation NKHomeView
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
        [self makeConstraints];
    }
    return self;
}

- (void)commonInit{
    self.tableView = [NKSectionedTableView new];
    [self.tableView setTableFooterView:nil];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self addSubview:self.tableView];
}

- (void)makeConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
@end
