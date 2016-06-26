//
//  NKSectionedTableView.h
//  CLPDemo
//
//  Created by KyleWong on 12/20/15.
//  Copyright © 2015 CLPDemo. All rights reserved.
//
@class NKSectionedTableViewAdapter;

@interface NKSectionedTableView : UITableView
@property(nonatomic,strong) NKSectionedTableViewAdapter *tableViewAdapter;
@end
