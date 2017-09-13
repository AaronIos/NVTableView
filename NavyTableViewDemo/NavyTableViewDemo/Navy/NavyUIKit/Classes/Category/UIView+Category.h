//
//  UIView+Category.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (MotionEffect)
- (void) addCenterMotionEffectsXYWithOffset:(CGFloat)offset;
@end


@interface UIView (Shake)
- (void) shakeAnimation;
@end


@interface UIView (Screenshot)
- (UIImage*) screenshot;
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;
- (UIImage*) screenshotInFrame:(CGRect)frame;
@end



@interface UIView (CompanynColor)

#pragma mark 改变label 的颜色 渐进色
-(void)addCompanynameColorWithView:(UIView *)view;

@end
