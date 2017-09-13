//
//  NVTableViewAdaptor.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTableView.h"
#import "NVTableViewCell.h"
#import "NVIndexPathArray.h"
#import "NVTableViewCellItemProtocol.h"


@protocol NVTableViewAdaptorDelegate;

@interface NVTableViewAdaptor : NSObject
<NVTableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NVTableView* uiTableView;
@property (nonatomic, strong) NVIndexPathArray* items;
@property (nonatomic, assign) id<NVTableViewAdaptorDelegate> delegate;
@property (nonatomic, assign) BOOL canEdit;
@property (nonatomic, assign) BOOL canMove;


- (NVTableViewCell *) generateCellForObject:(id<NVTableViewCellItemProtocol>)object
                                  indexPath:(NSIndexPath *)indexPath
                                 identifier:(NSString *)identifier;

- (NSString*) tableViewClassName;

- (void)tableViewDidScroll:(UITableView *)tableView;
- (void)tableViewDidEndDragging:(UITableView *)tableView;
- (void)tableViewWillBeginDragging:(UITableView *)tableView;
@end


@protocol NVTableViewAdaptorDelegate <NSObject>

- (void) tableView:(UITableView *)tableView didSelectObject:(id<NVTableViewCellItemProtocol>)object rowAtIndexPath:(NSIndexPath *)indexPath;
@optional
- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section;
- (BOOL) tableView:(UITableView *)tableView canEditObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL) tableView:(UITableView *)tableView canMoveObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) tableView:(UITableView *)tableView commitDeletingObject:(id<NVTableViewCellItemProtocol>)object forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void) tableView:(UITableView *)tableView withObject:(id<NVTableViewCellItemProtocol>)object willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)tableViewDidScroll:(UITableView *)tableView;
- (void)tableViewWillBeginDragging:(UITableView *)tableView;
- (void)tableViewDidEndDragging:(UITableView *)tableView willDecelerate:(BOOL)decelerate;
- (void)tableViewDidEndDragging:(UITableView *)tableView;
- (void)tableViewwWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset;
- (void)tableViewWillBeginDecelerating:(UIScrollView *)scrollView;
- (void)tableViewDidEndDecelerating:(UIScrollView *)scrollView  ;
- (void)tableViewScrollBottom:(UITableView*)tableView;

- (CGFloat)tableView:(UITableView *)tableView nvHeightForHeaderInSection:(NSInteger)section;

- (UIView *)tableView:(UITableView *)tableView nvViewForHeaderInSection:(NSInteger)section;


@end



@interface NVTableViewAdaptor (Index)
@property (nonatomic, strong) NSArray* arrayKeys;
@property (nonatomic, copy) Class headerClass;
@end



@interface NVTableViewAdaptor (Footer)
@property (nonatomic, strong) NSArray* footerItems;
@end




@interface NVTableViewAdaptor (Footer)
@property (nonatomic, strong) NSArray* footerItems;
@end



