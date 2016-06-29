//
//  NKSectionedTableView.m
//  CLPDemo
//
//  Created by KyleWong on 12/20/15.
//  Copyright © 2015 CLPDemo. All rights reserved.
//

#import "NKSectionedTableView.h"
#import "NKSectionedTableViewAdapter.h"

const NSInteger kKVOTagSectionedDataSource = 0;
const NSInteger kKVOTagSectionedSortedKeys = 1;
const NSInteger kKVOTagSectionedArrayInDictionary = 2;

@interface NKSectionedTableView()
{
    NKSectionedTableViewAdapter *_adapter;
    NSMutableSet *_kvoSortedKeys;
}
@end

@implementation NKSectionedTableView
- (instancetype)init{
    if(self = [super init]){
        _kvoSortedKeys = [NSMutableSet set];
    }
    return self;
}

- (void)setTableViewAdapter:(NKSectionedTableViewAdapter *)tableViewAdapter{
    if(_adapter)
        [self unRegisterKVO];
    _adapter = tableViewAdapter;
    self.dataSource = tableViewAdapter;
    self.delegate = tableViewAdapter;
    [self registerKVO];
}

- (void)dealloc{
    [self unRegisterKVO];
}

- (void)registerKVO
{
    [_adapter addObserver:self forKeyPath:kKeySectionedAdapterDataSource options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:(void *)kKVOTagSectionedDataSource];
    [_adapter addObserver:self forKeyPath:kKeySectionedAdapterSortedKeys options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:(void *)kKVOTagSectionedSortedKeys];
}

- (void)unRegisterKVO
{
    [_adapter removeObserver:self forKeyPath:kKeySectionedAdapterSortedKeys];
    for(NSString *keyPath in _kvoSortedKeys)
        [_adapter removeObserver:self forKeyPath:keyPath];
    [_adapter removeObserver:self forKeyPath:kKeySectionedAdapterDataSource];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSInteger contextNumber = (NSInteger)context;
    if(contextNumber == kKVOTagSectionedDataSource&& [keyPath isEqualToString:kKeySectionedAdapterDataSource]){
        NSIndexSet *set = change[NSKeyValueChangeIndexesKey];
        NSKeyValueChange    valueChange = [change[NSKeyValueChangeKindKey] unsignedIntegerValue];
        switch (valueChange) {
            case NSKeyValueChangeInsertion:
            {
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
                }];
                [self insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeRemoval:
            {
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
                }];
                [self deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeReplacement:
            {
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
                }];
                [self reloadRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeSetting:
            {
                [self reloadData];
            }
                break;
            default:
                break;
        }
    }
    else if(contextNumber == kKVOTagSectionedSortedKeys && [keyPath isEqualToString:kKeySectionedAdapterSortedKeys]){
        NSKeyValueChange valueChange = [change[NSKeyValueChangeKindKey] unsignedIntegerValue];
        NSMutableIndexSet *set=change[NSKeyValueChangeIndexesKey];
        switch (valueChange) {
            case NSKeyValueChangeInsertion:
            {
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    NSString *keyPath = [_adapter keyAtIndex:idx];
                    [_kvoSortedKeys addObject:keyPath];
                    [_adapter addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:(void *)kKVOTagSectionedArrayInDictionary];
                }];
                [self insertSections:set withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeRemoval:
            {
                for(NSString *keyPath in [change valueForKey:NSKeyValueChangeOldKey]){
                    [_adapter removeObserver:self forKeyPath:keyPath];
                    [_kvoSortedKeys removeObject:keyPath];
                }
                [self deleteSections:set withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeReplacement:{
            }
                break;
            case NSKeyValueChangeSetting:{
                NSArray *newValue=[change valueForKey:NSKeyValueChangeNewKey];
                NSSet *set = [NSSet setWithSet:_kvoSortedKeys];
                for(NSString *key in set){
                    [_adapter removeObserver:self forKeyPath:key];
                    [_kvoSortedKeys removeObject:key];
                }
                for(NSString *key in newValue){
                    [_adapter addObserver:self forKeyPath:key options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:(void*)kKVOTagSectionedArrayInDictionary];
                    [_kvoSortedKeys addObject:key];
                }
                [self reloadData];
            }
                break;
            default:
                break;
        }
    }
    else if(contextNumber == kKVOTagSectionedArrayInDictionary){
        if([_adapter indexOfKey:keyPath]==NSNotFound)
            return;
        NSKeyValueChange valueChange = [change[NSKeyValueChangeKindKey] unsignedIntegerValue];
        switch (valueChange) {
            case NSKeyValueChangeInsertion:
            {
                NSMutableIndexSet *set=change[NSKeyValueChangeIndexesKey];
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    NSUInteger section=[_adapter indexOfKey:keyPath];
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:section]];
                }];
                [self insertRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeRemoval:
            {
                NSMutableIndexSet *set=change[NSKeyValueChangeIndexesKey];
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:[_adapter indexOfKey:keyPath]]];
                }];
                [self deleteRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeReplacement:
            {
                NSMutableIndexSet *set=change[NSKeyValueChangeIndexesKey];
                NSMutableArray *indexes = [NSMutableArray array];
                [set enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
                    [indexes addObject:[NSIndexPath indexPathForRow:idx inSection:[_adapter indexOfKey:keyPath]]];
                }];
                [self reloadRowsAtIndexPaths:indexes withRowAnimation:UITableViewRowAnimationNone];
            }
                break;
            case NSKeyValueChangeSetting:
            {
            }
                break;
            default:
                break;
        }
    }
}
@end
