//
//  NKHomeTableViewAdapter.m
//  CLPDemo
//
//  Created by KyleWong on 6/23/16.
//  Copyright © 2016 KyleWong. All rights reserved.
//

#import "NKHomeTableViewAdapter.h"

@implementation NKHomeTableViewAdapter
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    [cell.textLabel setText:[[self.dataSource objectForKey:[self.sortedKeys objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row]];
    return cell;
}
@end
