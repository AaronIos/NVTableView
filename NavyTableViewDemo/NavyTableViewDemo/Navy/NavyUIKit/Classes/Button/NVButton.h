//
//  NVButton.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NVButtonStyle) {
    NVButtonStyleFilled,
    NVButtonStyleBorder,
    NVButtonStyleDash,
};


@interface NVButton : UIButton
@property (nonatomic, strong, readonly) CALayer* layerBackground;
@property (nonatomic, assign) NVButtonStyle buttonStyle;

@property (nonatomic, assign) CGFloat dashWidth;
@property (nonatomic, strong) UIColor* dashColor;

@property (nonatomic, strong) UIColor* normalColor;
@property (nonatomic, strong) UIColor* selectedColor;
@property (nonatomic, strong) UIColor* disableColor;
@end
