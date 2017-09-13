//
//  NVMenuView.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVMenuView.h"


@interface NVMenuView ()
@property (nonatomic, strong) NSMutableArray* arrayButtonItems;
- (void) buttonAction:(id)sender;
@end


@implementation NVMenuView


- (NSMutableArray*) arrayButtonItems {
    if (_arrayButtonItems == nil) {
        _arrayButtonItems = [[NSMutableArray alloc] init];
    }
    
    return _arrayButtonItems;
}


- (void) reloadData {
    [self.arrayButtonItems removeAllObjects];
    
    NSUInteger row = 0;
    if (self.dataSource
        && [self.dataSource respondsToSelector:@selector(numberOfItemsAtRow:inMenuView:)]) {
        
        NSUInteger count = [self.dataSource numberOfItemsAtRow:row inMenuView:self];
        if (count == 0) {
            return;
        }
        
        if (self.dataSource
            && [self.dataSource respondsToSelector:@selector(itemAtIndexPath:inMenuView:)]) {
            
            CGSize size = self.bounds.size;
            CGFloat x = 0.0f;
            CGFloat y = 0.0f;
            CGFloat width = size.width / count;
            CGFloat height = size.height;
            for (NSUInteger i = 0; i < count; i++) {
                NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:row];
                
                NVMenuItemView* itemView = [self.dataSource itemAtIndexPath:indexPath inMenuView:self];
                [self addSubview:itemView];
                [self.arrayButtonItems addObject:itemView];
                itemView.exclusiveTouch = YES;
                
                if ([self.dataSource respondsToSelector:@selector(heightOfItemAtIndexPath:inMenuView:)]) {
                    height  = [self.dataSource heightOfItemAtIndexPath:indexPath inMenuView:self];
                    y       = (size.height - height) / 2;
                }
                itemView.frame = CGRectMake(x, y, width, height);
                x += width;
                
            }
        }
        
    }
}


- (void) reloadDataWithTitles:(NSArray *(^)(void))titleOfItems {
    
    [self reloadDataWithTitles:titleOfItems
              itemViewInstance:^NVMenuItemView *(NSUInteger index) {
                  return [[NVMenuItemView alloc] init];
              }];
    
}

- (void) reloadDataWithTitles:(NSArray *(^)(void))titleOfItems itemViewInstance:(NVMenuItemView *(^)(NSUInteger))viewOfItem {
    
    if (titleOfItems == nil) {
        return;
    }
    
    [self.arrayButtonItems removeAllObjects];
    
    NSArray* arrayTitles = titleOfItems();
    if ([arrayTitles isKindOfClass:[NSArray class]]) {
        
        CGFloat width = self.frame.size.width / [arrayTitles count];
        CGFloat height = self.frame.size.height;
        [arrayTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSString* title = (NSString*)obj;
            
            NVMenuItemView* itemView = nil;
            if (viewOfItem) {
                itemView = viewOfItem(idx);
            } else {
                itemView = [[NVMenuItemView alloc] init];
            }
            [self addSubview:itemView];
            [self.arrayButtonItems addObject:itemView];
            
            [itemView setFrame:CGRectMake(width * idx, 0.0f, width, height)];
            [itemView setTitle:title forState:UIControlStateNormal];
            [itemView addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            itemView.tag = idx;
            
            itemView.exclusiveTouch = YES;
            
        }];
        
        [self setNeedsLayout];
    }
    
}

- (void) setIndexOfSelection:(NSUInteger)indexOfSelection {
    _indexOfSelection = indexOfSelection;
    
    [self.arrayButtonItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NVMenuItemView* view = (NVMenuItemView*)obj;
        view.selected = _indexOfSelection == idx;
    }];
}

- (NSUInteger) count {
    return [self.arrayButtonItems count];
}

- (void) buttonAction:(id)sender {
    
    NVMenuItemView* view = (NVMenuItemView*)sender;
    self.indexOfSelection = view.tag;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuView:didSelectionIndex:)]) {
        [self.delegate menuView:self didSelectionIndex:self.indexOfSelection];
    }
}


@end
