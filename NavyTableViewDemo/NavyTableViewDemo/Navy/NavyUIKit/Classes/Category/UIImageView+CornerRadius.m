//
//  UIImageView+CornerRadius.m
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/9/12.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "UIImageView+CornerRadius.h"

#import <objc/runtime.h>

const char kProcessedImage;

@interface UIImageView ()

@property (assign, nonatomic) CGFloat nvRadius;
@property (assign, nonatomic) UIRectCorner roundingCorners;
@property (assign, nonatomic) CGFloat nvBorderWidth;
@property (strong, nonatomic) UIColor *nvBorderColor;
@property (assign, nonatomic) BOOL nvHadAddObserver;
@property (assign, nonatomic) BOOL nvIsRounding;

@end





@implementation UIImageView (CornerRadius)
/**
 * @brief init the Rounding UIImageView, no off-screen-rendered
 */
- (instancetype)initWithRoundingRectImageView {
    self = [super init];
    if (self) {
        [self nvCornerRadiusRoundingRect];
    }
    return self;
}

/**
 * @brief init the UIImageView with cornerRadius, no off-screen-rendered
 */
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self = [super init];
    if (self) {
        [self nvCornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    }
    return self;
}

/**
 * @brief attach border for UIImageView with width & color
 */
- (void)nvAttachBorderWidth:(CGFloat)width color:(UIColor *)color {
    self.nvBorderWidth = width;
    self.nvBorderColor = color;
}

#pragma mark - Kernel
/**
 * @brief clip the cornerRadius with image, UIImageView must be setFrame before, no off-screen-rendered
 */
- (void)nvCornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief clip the cornerRadius with image, draw the backgroundColor you want, UIImageView must be setFrame before, no off-screen-rendered, no Color Blended layers
 */
- (void)nvCornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType backgroundColor:(UIColor *)backgroundColor {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundColor setFill];
    [backgroundRect fill];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief set cornerRadius for UIImageView, no off-screen-rendered
 */
- (void)nvCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self.nvRadius = cornerRadius;
    self.roundingCorners = rectCornerType;
    self.nvIsRounding = NO;
    if (!self.nvHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.nvHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

/**
 * @brief become Rounding UIImageView, no off-screen-rendered
 */
- (void)nvCornerRadiusRoundingRect {
    self.nvIsRounding = YES;
    if (!self.nvHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.nvHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

#pragma mark - Private
- (void)drawBorder:(UIBezierPath *)path {
    if (0 != self.nvBorderWidth && nil != self.nvBorderColor) {
        [path setLineWidth:2 * self.nvBorderWidth];
        [self.nvBorderColor setStroke];
        [path stroke];
    }
}

- (void)nvDealloc {
    if (self.nvHadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
    [self nvDealloc];
}

- (void)validateFrame {
    if (self.frame.size.width == 0) {
        [self.class swizzleLayoutSubviews];
    }
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}

+ (void)swizzleDealloc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(nvDealloc)];
    });
}

+ (void)swizzleLayoutSubviews {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(nvLayoutSubviews)];
    });
}

- (void)nvLayoutSubviews {
    [self nvLayoutSubviews];
    if (self.nvIsRounding) {
        [self nvCornerRadiusWithImage:self.image cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
    } else if (0 != self.nvRadius && 0 != self.roundingCorners && nil != self.image) {
        [self nvCornerRadiusWithImage:self.image cornerRadius:self.nvRadius rectCornerType:self.roundingCorners];
    }
}

#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, &kProcessedImage) intValue] == 1) {
            return;
        }
        [self validateFrame];
        if (self.nvIsRounding) {
            [self nvCornerRadiusWithImage:newImage cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
        } else if (0 != self.nvRadius && 0 != self.roundingCorners && nil != self.image) {
            [self nvCornerRadiusWithImage:newImage cornerRadius:self.nvRadius rectCornerType:self.roundingCorners];
        }
    }
}

#pragma mark property
- (CGFloat)nvBorderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setNvBorderWidth:(CGFloat)nvBorderWidth {
    objc_setAssociatedObject(self, @selector(nvBorderWidth), @(nvBorderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)nvBorderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setNvBorderColor:(UIColor *)nvBorderColor {
    objc_setAssociatedObject(self, @selector(nvBorderColor), nvBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nvHadAddObserver {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setNvHadAddObserver:(BOOL)nvHadAddObserver {
    objc_setAssociatedObject(self, @selector(nvHadAddObserver), @(nvHadAddObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)nvIsRounding {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setNvIsRounding:(BOOL)nvIsRounding {
    objc_setAssociatedObject(self, @selector(nvIsRounding), @(nvIsRounding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)roundingCorners {
    return [objc_getAssociatedObject(self, _cmd) unsignedLongValue];
}

- (void)setRoundingCorners:(UIRectCorner)roundingCorners {
    objc_setAssociatedObject(self, @selector(roundingCorners), @(roundingCorners), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)nvRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setNvRadius:(CGFloat)nvRadius {
    objc_setAssociatedObject(self, @selector(nvRadius), @(nvRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
