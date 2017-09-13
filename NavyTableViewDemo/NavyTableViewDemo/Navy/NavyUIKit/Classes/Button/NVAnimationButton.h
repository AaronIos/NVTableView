//
//  NVAnimationButton.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVButton.h"




@interface NVAnimationElement : NSObject
@property (nonatomic, strong) NSString* buttonTitle;
@property (nonatomic, strong) UIColor* buttonColor;
@property (nonatomic, assign) CGFloat delay;
@end



typedef NS_ENUM(NSUInteger, NVAnimationType) {
    NVAnimationTypeFromButtom,
    NVAnimationTypeFromRight,
};


@interface NVAnimationButton : NVButton
@property (nonatomic, assign) NVAnimationType animationType;
- (void) setNormal:(NVAnimationElement* (^)())normalElement
           loading:(NVAnimationElement* (^)())loadingElement
          complete:(NVAnimationElement* (^)())completeElement
           failure:(NVAnimationElement* (^)())failureElement;
- (void) startLoadingAnimation;
- (void) startCompleteAnimation;
- (void) startFailureAnimation;
- (void) restore;
@end
