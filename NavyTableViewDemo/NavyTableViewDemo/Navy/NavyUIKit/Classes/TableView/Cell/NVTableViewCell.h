//
//  NVTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVDataModel.h"


/*!
 @class
 @abstract      继承UITableViewCell
 a) Cell需继承PATableViewCell
 b) DataModel需继承NVDataModel
 */
@interface NVTableViewCell : UITableViewCell

/*!
 @property
 @abstract      DataModel对象
 */
@property (nonatomic, strong) NVDataModel* item;

/*!
 @property
 @abstract      设置Cell的高度。通过object来动态设置Cell的高度。
 */
+ (CGFloat) tableView:(UITableView*)tableView rowHeightForObject:(id)object;

/*!
 @property
 @abstract      赋值object
 */
- (void) setObject:(id)object;

/*!
 @property
 @abstract      Cell的标识
 */
+ (NSString*) cellIdentifier;

/*!
 @property
 @abstract      Cell的高度
 */
+ (CGFloat) heightForCell;

@end



