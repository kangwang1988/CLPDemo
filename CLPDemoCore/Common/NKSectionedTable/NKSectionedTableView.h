//
//  NKSectionedTableView.h
//  CLPDemo
//
//  Created by KyleWong on 12/20/15.
//  Copyright © 2015 CLPDemo. All rights reserved.
//
#import <UIKit/UIKit.h>
@class NKSectionedTableViewAdapter;

@interface NKSectionedTableView : UITableView
@property(nonatomic,strong) NKSectionedTableViewAdapter *tableViewAdapter;
@end
