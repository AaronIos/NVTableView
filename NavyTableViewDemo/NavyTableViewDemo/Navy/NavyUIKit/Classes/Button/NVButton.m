//
//  NVButton.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+Category.h"
#import "NavyUIKit.h"


@interface NVButton ()

@end

@implementation NVButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //        [self setTitle:@"Button" forState:UIControlStateNormal];
        //        [self setTitleColor:COLOR_HM_LIGHT_BLACK forState:UIControlStateNormal];
        //        [self setTitleColor:COLOR_HM_GRAY forState:UIControlStateDisabled];
        //        [self setTitleColor:COLOR_HM_BLACK forState:UIControlStateHighlighted];
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 2.0f;
        self.enabled = YES;
        
        //        _layerBackground                = [CALayer layer];
        //        [self.layer insertSublayer:self.layerBackground atIndex:0];
        //        self.layerBackground.frame          = self.bounds;
        //        self.layerBackground.masksToBounds  = YES;
        //        self.layerBackground.cornerRadius   = 2.0f;
        
        self.disableColor                   = COLOR_HM_LIGHT_GRAY;
    }
    
    return self;
}


- (void) setButtonStyle:(NVButtonStyle)buttonStyle {
    _buttonStyle = buttonStyle;
    
    switch (_buttonStyle) {
        case NVButtonStyleFilled:
            //            [self.layerBackground setBackgroundColor:self.normalColor.CGColor];
            self.backgroundColor = self.normalColor;
            
            
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.layer.borderColor = [UIColor clearColor].CGColor;
            self.layer.borderWidth = 0.0f;
            break;
            
        case NVButtonStyleBorder:
            self.backgroundColor        = [UIColor colorWithWhite:1.0f alpha:0.2f];
            self.layer.borderColor            = self.normalColor.CGColor;
            self.layer.borderWidth            = 0.5f;
            self.layer.cornerRadius           = 2.0f;
            self.layer.masksToBounds          = YES;
            break;
            
        default:
            break;
    }
    
}


- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        
        if (self.buttonStyle == NVButtonStyleFilled) {
            UIColor* color = [UIColor colorRGBonvertToHSB:self.normalColor withBrighnessDelta:0.1f];
            [self setBackgroundColor:color];
            
        } else if (self.buttonStyle == NVButtonStyleBorder) {
            UIColor* color = [UIColor colorRGBonvertToHSB:[UIColor colorWithWhite:1.0f alpha:0.2f] withBrighnessDelta:-0.2f];
            [self setBackgroundColor:color];
            
        }
    } else {
        if (self.buttonStyle == NVButtonStyleFilled) {
            [self setBackgroundColor:self.normalColor];
            
        } else if (self.buttonStyle == NVButtonStyleBorder) {
            [self setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.2f]];
            
        }
    }
}

- (void) setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        self.buttonStyle = _buttonStyle;
        [self setBackgroundColor:self.normalColor];
        
    } else {
        if (self.buttonStyle == NVButtonStyleFilled) {
            [self setBackgroundColor:self.disableColor];
            
        } else {
            [self setBackgroundColor:[UIColor clearColor]];
            
        }
        
    }
    
}


@end
