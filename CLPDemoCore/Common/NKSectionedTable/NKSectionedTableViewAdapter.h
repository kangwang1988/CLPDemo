//
//  NKSectionedTableViewAdapter.h
//  CLPDemo
//
//  Created by KyleWong on 12/2/15.
//  Copyright © 2015 CLPDemo. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *kKeySectionedAdapterDataSource;
FOUNDATION_EXPORT NSString *kKeySectionedAdapterSortedKeys;

typedef NS_OPTIONS(NSInteger,KDSectionedTableCellPos){
    KDSectionedTableCellPosNone = 0,
    KDSectionedTableCellPosTop=1,
    KDSectionedTableCellPosMiddle=1<<1,
    KDSectionedTableCellPosBottom=1<<2
};

@class NKSectionedTableViewAdapter;

@protocol NKSectionedTableViewAdapterDelegate <NSObject>
- (void)tableViewAdapter:(NKSectionedTableViewAdapter *)aAdapter didSelectRowAtIndexPath:(NSIndexPath *)aIndexPath;
@end

@interface NKSectionedTableViewAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableDictionary *dataSource;
@property (nonatomic,strong) NSMutableArray *sortedKeys;
@property (nonatomic,weak) id<NKSectionedTableViewAdapterDelegate> delegate;
- (id)dataAtIndexPath:(NSIndexPath *)aIndexPath;
- (KDSectionedTableCellPos)posAtIndex:(NSIndexPath *)aIndexPath;
- (NSIndexPath *)indexPathOfData:(id)aData;
- (NSInteger)indexOfKey:(NSString *)aKey;
- (NSString *)keyAtIndex:(NSInteger)aIndex;
- (void)removeObjectsForKey:(NSString *)aKey;
- (void)removeObjectForKey:(NSString *)aKey atIndex:(NSInteger)aIndex;
- (void)replaceObjectForKey:(NSString *)aKey atIndex:(NSInteger)aIndex withObject:(id)aObject;
@end
