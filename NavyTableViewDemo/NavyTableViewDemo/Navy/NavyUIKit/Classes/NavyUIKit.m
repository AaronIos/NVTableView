//
//  NavyUIKit.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NavyUIKit.h"


UIFont* navigationTitleFont() {
    return navigationTitleFontWithSize(17.0f);
}

UIFont* navigationTitleFontWithSize(CGFloat size) {
    UIFont* font = FONT_HELVETICA_NEUE_LIGHT_SIZE(size);
    if (font == nil) {
        font = FONT_HELVETICA_NEUE_ULTRA_LIGHT_SIZE(size);
    }
    
    return font;
}

CGFloat nativeScale(void) {
    static CGFloat scale = 0.0f;
    if (scale == 0.0f) {
        CGFloat width = APPLICATIONWIDTH;
        scale = width / 320.0f;
    }
    return scale * 2;
}


