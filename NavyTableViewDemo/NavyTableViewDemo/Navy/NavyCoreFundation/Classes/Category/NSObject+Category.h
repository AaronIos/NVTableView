//
//  NSObject+Category.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Category)

/*!
 @method
 @abstract      判断对象是否未nil或[NSNull null]对象
 @return        BOOL
 */
- (BOOL) isNilOrNull;

// 获取 当前控制器
- (UIViewController *)getCurrentVC;

@end
