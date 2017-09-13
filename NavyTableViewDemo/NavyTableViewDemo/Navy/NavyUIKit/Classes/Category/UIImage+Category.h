//
//  UIImage+Category.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CarmenLaunchImageView)

+(NSString *)carmen_getLuchImageName;

+(UIImage *)carmen_getLunchImage;
@end

@interface UIImage (Category)
+ (UIImage*) imageWithColor:(UIColor*)color;
+ (UIImage*) grayscaleImage:(UIImage*)image;
- (UIImage*) imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage*) resizableImage:(UIEdgeInsets)insets;
- (UIImage*) imageWithColor:(UIColor *)color;
- (UIImage *)tintedImageWithColor:(UIColor*)color;
+ (UIImage *)saveOriginImage:(UIImage *)image scaleToSize:(CGSize)size;
@end


@interface UIImage (Blur)
- (UIImage *) boxblurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;
@end


@interface UIImage (ResizableImage)
- (UIImage*) resizableImage:(UIEdgeInsets)insets;
@end


@interface UIImage (ImageEffects)
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyBlurEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;
@end


@interface UIImage (Compressed)
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
@end