//
//  NVLabel.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NVLabel : UILabel
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, assign, readonly) CGFloat width;
@end


/*!
 @class
 @abstract      画虚线的Label
 */
@interface NVDashLabel : NVLabel
@property (nonatomic, strong) UIColor* dashColor;

@end


@interface NVShadowLabel : NVLabel

@end

