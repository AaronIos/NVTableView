//
//  NVBorderLabel.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVBorderLabel.h"
#import "UIColor+Category.h"
#import "NavyUIKit.h"


@implementation NVBorderLabel


- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.masksToBounds    = YES;
        self.layer.borderWidth      = 0.5f;
        
        self.font                   = nvNormalFontWithSize(14.0f + fontScale);
        self.textAlignment          = NSTextAlignmentCenter;
    }
    
    return self;
}

- (void) setBorderColor:(UIColor *)borderColor {
    self.textColor                  = borderColor;
    self.layer.borderColor          = borderColor.CGColor;
    self.backgroundColor            = [UIColor clearColor];//[UIColor colorRGBonvertToHSB:borderColor withBrighnessDelta:0.2f];
}

- (void) sizeToFit {
    [super sizeToFit];
    
    CGRect bound        = self.bounds;
    bound.size.width    += 4.0f * displayScale;
    bound.size.height   += 2.0f * displayScale;
    self.bounds         = bound;
}

@end
