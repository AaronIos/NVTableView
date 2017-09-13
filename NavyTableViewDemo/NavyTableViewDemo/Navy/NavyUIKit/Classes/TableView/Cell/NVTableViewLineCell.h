//
//  NVTableViewLineCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVTableViewCell.h"


/*!
 @class
 @abstract      画顶部和底部线的TableViewCell。继承PATableViewCell
 */
@interface NVTableViewLineCell : NVTableViewCell
@property (nonatomic, strong) CALayer* lineUpper;
@property (nonatomic, strong) CALayer* lineLower;
@end



#define CLS_TABLE_VIEW_INDENT_LINE_CELL         @"PATableViewIndentLineCell"

/*!
 @class
 @abstract      画顶部和底部缩进线的TableViewCell。继承PATableViewCell
 */
@interface NVTableViewIndentLineCell : NVTableViewLineCell

@end


