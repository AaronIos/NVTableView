//
//  NVTableView+Category.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVTableView+Category.h"

@implementation NVTableView (Category)

@end



@implementation NVTableView (ReloadCell)

- (void) reloadCell:(NVTableViewCell *)cell {
    NSIndexPath* indexPath = [self indexPathForCell:cell];
    if (indexPath != nil) {
        [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}

@end
