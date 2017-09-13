//
//  NVIndexPathArray.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVIndexPathArray.h"


@implementation NVIndexPathArray



- (id) init {
    self = [super init];
    if (self) {
        _arrayIndexPath = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) setItem:(NSMutableArray *)item {
    _arrayIndexPath = [[NSMutableArray alloc] initWithObjects:item, nil];
}

- (void) addObject:(id)object {
    if (object == nil) {
        return;
    }
    
    if ([_arrayIndexPath count] == 0) {
        NSMutableArray* array = [[NSMutableArray alloc] init];
        [_arrayIndexPath addObject:array];
    }
    
    NSMutableArray* array = [_arrayIndexPath lastObject];
    [array addObject:object];
    self.arrayDataModels  = array;
}

- (void) addObjects:(NSArray *)array {
    if ([array isKindOfClass:[NSArray class]]) {
        
        if ([_arrayIndexPath count] > 0) {
            [self addObjects:array inSection:[_arrayIndexPath count] - 1];
        } else {
            [self addObjectsAtNewSection:array];
        }
    }
}

- (void) addObjectsAtNewSection:(NSArray *)array {
    if ([array isKindOfClass:[NSArray class]]) {
        NSMutableArray* newArray = [[NSMutableArray alloc] initWithArray:array];
        [_arrayIndexPath addObject:newArray];
    }
}

- (void) addObjects:(NSArray *)array inSection:(NSInteger)section {
    if ([array isKindOfClass:[NSArray class]]) {
        if (section >= 0 && section < [_arrayIndexPath count]) {
            NSMutableArray* updateArray = [[NSMutableArray alloc] initWithArray:[_arrayIndexPath objectAtIndex:section]];
            [updateArray addObjectsFromArray:array];
            [_arrayIndexPath replaceObjectAtIndex:section withObject:updateArray];
        }
    }
}

- (void) removeAllObjects {
    [_arrayIndexPath removeAllObjects];
}

- (NSUInteger) count {
    return [_arrayIndexPath count];
}

- (NSUInteger) countAtSection:(NSInteger)section {
    if (section >= 0 && section < [_arrayIndexPath count]) {
        NSArray* array = [_arrayIndexPath objectAtIndex:section];
        return [array count];
    }
    
    return 0;
}

- (id) objectAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section >= 0 && section < [_arrayIndexPath count]) {
        NSArray* array = [_arrayIndexPath objectAtIndex:section];
        if (row >= 0 && row < [array count]) {
            return [array objectAtIndex:row];
        }
    }
    
    return nil;
}

- (NSArray*) arrayInSection:(NSInteger)section {
    if (section >= 0 && section < [_arrayIndexPath count]) {
        return [_arrayIndexPath objectAtIndex:section];
    }
    
    return nil;
}

@end




