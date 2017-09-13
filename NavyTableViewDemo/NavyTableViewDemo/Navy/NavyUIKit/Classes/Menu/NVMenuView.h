//
//  NVMenuView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVMenuItemView.h"


@protocol NVMenuViewDataSource;
@protocol NVMenuViewDelegate;


@interface NVMenuView : UIView
@property (nonatomic, assign) id<NVMenuViewDelegate> delegate;
@property (nonatomic, assign) id<NVMenuViewDataSource> dataSource;
@property (nonatomic, assign) NSUInteger indexOfSelection;
@property (nonatomic, assign) NSUInteger count;

- (void) reloadData;

- (void) reloadData:(NSUInteger(^)(void))numberOfItems
             height:(CGFloat(^)(NSIndexPath* indexPath))heightOfItem
               item:(NVMenuItemView*(^)(NSIndexPath* indexPath))item;

- (void) reloadDataWithTitles:(NSArray *(^)(void))titleOfItems;
- (void) reloadDataWithTitles:(NSArray *(^)(void))titleOfItems itemViewInstance:(NVMenuItemView*(^)(NSUInteger index))viewOfItem;

@end



@protocol NVMenuViewDataSource <NSObject>
- (NSUInteger) numberOfItemsAtRow:(NSUInteger)row inMenuView:(NVMenuView*)menuView;
- (NVMenuItemView*) itemAtIndexPath:(NSIndexPath*)indexPath inMenuView:(NVMenuView*)menuView;
- (CGFloat) heightOfItemAtIndexPath:(NSIndexPath*)indexPath inMenuView:(NVMenuView*)menuView;
@end


@protocol NVMenuViewDelegate <NSObject>
- (void) menuView:(NVMenuItemView*)view didSelectionIndex:(NSUInteger)index;
@end

