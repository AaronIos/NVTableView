//
//  NVBackgroundControl.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVBackgroundControl.h"


@interface NVBackgroundControl ()
@property (nonatomic, strong) CALayer* layerBg;
- (void) onTouch:(id)sender;
@end


@implementation NVBackgroundControl

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layerBg                    = [CALayer layer];
        [self.layer addSublayer:self.layerBg];
        self.layerBg.frame              = CGRectMake(0.0f, 0.0f, frame.size.width, frame.size.height);
        self.layerBg.backgroundColor    = [UIColor colorWithWhite:0.3f alpha:0.6f].CGColor;
        self.layerBg.opacity            = 0.0f;
        
        [self addTarget:self action:@selector(onTouch:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void) onTouch:(id)sender {
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(didTouchUpInsideOnBackgroundControl:)]) {
        [self.delegate didTouchUpInsideOnBackgroundControl:self];
    }
}

- (void) show {
    
    self.layerBg.opacity = 0.0f;
    
    CABasicAnimation* animation     = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration              = 0.3f;
    animation.fromValue             = @(0.0f);
    animation.toValue               = @(1.0f);
    [self.layerBg addAnimation:animation forKey:@"animation.opacity"];
    
    self.layerBg.opacity = 1.0f;
}

- (void) hide {
    
}


@end


