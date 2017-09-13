//
//  NVGlassMainViewController.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVViewController.h"


/*!
 @class
 @abstract      定义iOS7风格的ViewController
 */
@interface NVGlassMainViewController : NVViewController

/*!
 @function
 @abstract      设置NavigationBar标题
 */
- (NSString*) getNavigationTitle;

/*!
 @function
 @abstract      设置NavigationBar标题颜色
 */
- (UIColor*) getNavigationTitleColor;

- (UIColor*) getNavigationBarBackgroundColor;

/*!
 @function
 @abstract      设置NavigationBar标题字体属性
 */
- (NSDictionary*) getNavigationTitleTextAttributes;

/*!
 @function
 @abstract      重构NavigationBar。
 1. 装饰NavigationBar Title
 2. 装饰NavigationBar 返回按钮
 3. 装饰NavigationBar 右侧按钮
 */
- (void) decorateNavigationBar:(UINavigationBar*)navigationBar;

/*!
 @function
 @abstract      装饰NavigationBar 返回按钮
 */
- (void) decorateBackButtonNavigationBar:(UINavigationBar*)navigationBar;

/*!
 @function
 @abstract      装饰NavigationBar 右侧按钮
 */
- (void) decorateRightButtonNavigationBar:(UINavigationBar*)navigationBar;

- (void) customedNavigationBar:(UINavigationBar *)navigationBar;

/*!
 @function
 @abstract      返回按钮事件
 */
- (void) backButtonAction:(id)sender;
@end



