//
//  NVTableView.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <UIKit/UIKit.h>

/*!
 @property
 @abstract      继承UITableViewDataSource.
 设置某个section是否分组
 */
@protocol NVTableViewDataSource <NSObject, UITableViewDataSource>
@optional
- (BOOL) tableView:(UITableView *)tableView enableGroupModeAtSection:(NSInteger)section;
@end



@interface NVTableView : UITableView
@property (nonatomic, assign) id<NVTableViewDataSource> dataSource;
@end

