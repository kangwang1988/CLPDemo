//
//  NKSectionedTableViewAdapter.m
//  CLPDemo
//
//  Created by KyleWong on 12/2/15.
//  Copyright © 2015 CLPDemo. All rights reserved.
//

#import "NKSectionedTableViewAdapter.h"

NSString * kKeySectionedAdapterDataSource = @"dataSource";
NSString * kKeySectionedAdapterSortedKeys = @"sortedKeys";

@implementation NKSectionedTableViewAdapter
- (void)setDataSource:(NSMutableDictionary *)aDataSource{
    NSArray *array = [aDataSource allKeys];
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *key1 = obj1;
        NSString *key2 = obj2;
        return [key1 compare:key2];
    }];
    [self willChangeValueForKey:kKeySectionedAdapterSortedKeys];
    _sortedKeys = [NSMutableArray arrayWithArray:array];
    [self didChangeValueForKey:kKeySectionedAdapterSortedKeys];
    
    [self willChangeValueForKey:kKeySectionedAdapterDataSource];
    _dataSource = [NSMutableDictionary dictionaryWithDictionary:aDataSource];
    [self didChangeValueForKey:kKeySectionedAdapterDataSource];
}

- (id)valueForUndefinedKey:(NSString *)key{
    return [self.dataSource objectForKey:key];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sortedKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = [self.sortedKeys objectAtIndex:section];
    NSArray *objects = [NKUtil reinterpretObject:[self.dataSource objectForKey:key] toClassOrNil:[NSArray class]];
    return objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if([self.delegate respondsToSelector:@selector(tableViewAdapter:didSelectRowAtIndexPath:)])
        [self.delegate tableViewAdapter:self didSelectRowAtIndexPath:indexPath];
}

- (id)dataAtIndexPath:(NSIndexPath *)aIndexPath{
    NSString *key = [self.sortedKeys objectAtIndex:aIndexPath.section];
    NSArray *objects = [NKUtil reinterpretObject:[self.dataSource objectForKey:key] toClassOrNil:[NSArray class]];
    if(aIndexPath.row>=objects.count)
        return nil;
    return [objects objectAtIndex:aIndexPath.row];
}

- (KDSectionedTableCellPos)posAtIndex:(NSIndexPath *)aIndexPath{
    NSString *key = [self.sortedKeys objectAtIndex:aIndexPath.section];
    NSArray *objects = [NKUtil reinterpretObject:[self.dataSource objectForKey:key] toClassOrNil:[NSArray class]];
    KDSectionedTableCellPos option = KDSectionedTableCellPosNone;
    if(aIndexPath.row == 0)
        option |= KDSectionedTableCellPosTop;
    if(aIndexPath.row == objects.count-1)
        option |= KDSectionedTableCellPosBottom;
    if(option==KDSectionedTableCellPosNone)
        option = KDSectionedTableCellPosMiddle;
    return option;
}

- (NSIndexPath *)indexPathOfData:(id)aData{
    for(NSInteger section = 0;section!=self.sortedKeys.count;section++){
        NSString *key = [self.sortedKeys objectAtIndex:section];
        NSArray *objects = [self.dataSource objectForKey:key];
        if([objects indexOfObject:aData]!=NSNotFound){
            return [NSIndexPath indexPathForRow:[objects indexOfObject:aData] inSection:section];
        }
    }
    return nil;
}

- (NSInteger)indexOfKey:(NSString *)aKey{
    return [self.sortedKeys indexOfObject:aKey];
}

- (NSString *)keyAtIndex:(NSInteger)aIndex{
    return self.sortedKeys.count>aIndex?[self.sortedKeys objectAtIndex:aIndex]:nil;
}

- (void)removeObjectsForKey:(NSString *)aKey{
    if([self.sortedKeys containsObject:aKey]){
        if([_dataSource objectForKey:aKey])
            [_dataSource removeObjectForKey:aKey];
        [self willChangeValueForKey:kKeySectionedAdapterSortedKeys];
        [_sortedKeys removeObject:aKey];
        [self didChangeValueForKey:kKeySectionedAdapterSortedKeys];
    }
}

- (void)removeObjectForKey:(NSString *)aKey atIndex:(NSInteger)aIndex{
    NSMutableArray *array = [self.dataSource objectForKey:aKey];
    if(aIndex>=array.count)
        return;
    [self willChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:aIndex] forKey:aKey];
    [array removeObjectAtIndex:aIndex];
    [self didChange:NSKeyValueChangeRemoval valuesAtIndexes:[NSIndexSet indexSetWithIndex:aIndex] forKey:aKey];
}

- (void)replaceObjectForKey:(NSString *)aKey atIndex:(NSInteger)aIndex withObject:(id)aObject{
    if(!aObject){
        [self removeObjectForKey:aKey atIndex:aIndex];
        return;
    }
    NSMutableArray *array = [self.dataSource objectForKey:aKey];
    if(aIndex>=array.count)
        return;
    [self willChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:aIndex] forKey:aKey];
    [array replaceObjectAtIndex:aIndex withObject:aObject];
    [self didChange:NSKeyValueChangeReplacement valuesAtIndexes:[NSIndexSet indexSetWithIndex:aIndex] forKey:aKey];
}
@end
