//
//  NVButtonTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"
#import "NVButton.h"
#import "NVDataModel.h"
#import "NVTableViewCell.h"



/*!
 PAButtonAlignment 按钮对齐方式。缺省为中间对齐。
 */
typedef NS_ENUM(NSInteger, NVButtonAlignment) {
    NVButtonAlignmentCenter,
    NVButtonAlignmentLeft,
    NVButtonAlignmentRight,
};

typedef NS_ENUM(NSInteger, NVButtonIconAlignment) {
    NVButtonIconAlignmentLeft,
    NVButtonIconAlignmentRight,
};


/*!
 @class
 @abstract      Button DataModel。继承NVDataModel
 */
@interface NVButtonDataModel : NVDataModel


@property (nonatomic, strong) UIColor* backgroundColor;
@property (nonatomic, strong) UIColor* disableColor;

/*!
 @property
 @abstract      Button 标题的颜色
 */
@property (nonatomic, strong) UIColor* titleColor;

/*!
 @property
 @abstract      Button 标题
 */
@property (nonatomic, strong) NSString* title;

@property (nonatomic, assign) CGFloat fontSize;

/*!
 @property
 @abstract      Button 对齐方式
 */
@property (nonatomic, assign) NVButtonAlignment alignment;
@property (nonatomic, strong) NSString* iconName;
@property (nonatomic, assign) NVButtonIconAlignment iconAlignment;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NVButtonStyle style;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) BOOL isIconButton;
@end




@protocol NVButtonTableViewCellDelegate;

/*!
 @class
 @abstract      Button TableViewCell   继承PATableViewCell
 */
@interface NVButtonTableViewCell : NVTableViewCell
@property (nonatomic, strong, readonly) NVButton* button;
@property (nonatomic, assign) id<NVButtonTableViewCellDelegate> delegate;
@end


@protocol NVButtonTableViewCellDelegate <NSObject>
- (void) didClickButtonTableViewCell:(NVButtonTableViewCell*)cell;
@end

