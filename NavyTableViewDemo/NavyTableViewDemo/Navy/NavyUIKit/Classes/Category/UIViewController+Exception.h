//
//  UIViewController+Exception.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIViewController (Exception)

/*
 function
 brief       显示异常页面
 return     <#return#>
 */
- (void) showExceptionView;
- (void) showExceptionViewInView:(UIView*)view;

/*
 function
 brief       显示错误页面
 return     <#return#>
 */
- (void) showErrorView;

/*
 function
 brief       显示断网异常页面
 return     <#return#>
 */
- (void) showOffNetworkView;
- (void) showOffNetworkViewInView:(UIView*)view;


- (void) showNullDataView;
- (void) showNullDataViewInView:(UIView*)view attributedString:(NSAttributedString *)attributedString;

- (void) showNullWithText:(NSString *) text view:(UIView *)view;

- (void) showNullWithText:(NSString *) text view:(UIView *)view imageName:(NSString *)imageName;

- (void) showNullWithText:(NSString *) text view:(UIView *)view imageName:(NSString *)imageName frame:(CGRect)frame;

- (void) showNullWithButtonText:(NSString *)text contentText:(NSString *)contentText imageName:(NSString *)imageName view:(UIView *)view;

- (void) hideExceptionView;


- (void) tryAgainAtExceptionView;


- (UIImage*) imageOfExceptionView;
- (UIImage*) imageOfErrorView;
- (UIImage*) imageOffNetworkView;
- (UIImage*) imageOfNullDataView;

//- (NSString*) titleOfNullDataView;
- (NSAttributedString*) titleOfNullDataView;

@end
