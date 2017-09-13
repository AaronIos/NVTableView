//
//  UIViewController+Exception.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "UIViewController+Exception.h"
#import "NVLabel.h"
#import "NVButton.h"
#import "NavyUIKit.h"
#import "NSMutableAttributedString+Category.h"


@interface UIViewController (Exception)
- (void) onTryAgain:(id)sender;
@end


#define TAG_OF_EXCEPTION_VIEW           999001

@implementation UIViewController (Exception)


- (void) showExceptionView {
    [self showExceptionViewInView:self.view];
}


- (void) showExceptionViewInView:(UIView*)view {
    
    UIView* exceptionView = [self exceptionViewInView:view];
    
    exceptionView.backgroundColor = COLOR_HM_WHITE_GRAY;
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((APPLICATIONWIDTH - 107.0f)/2,
                                                                           (APPLICATIONHEIGHT - 107.0f)/2 - 80.0f,
                                                                           107.0f,
                                                                           107.0f)];
    [exceptionView addSubview:imageView];
    imageView.image     = [UIImage imageNamed:@"no_transaction_record"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    NVLabel* label          = [[NVLabel alloc] initWithFrame:CGRectMake(0.0f,
                                                                        APPLICATIONHEIGHT/2,
                                                                        APPLICATIONWIDTH,
                                                                        60.0f)];
    [exceptionView addSubview:label];
    label.font              = nvNormalFontWithSize(16.0f + fontScale);
    label.textColor         = COLOR_HM_GRAY;
    label.textAlignment     = NSTextAlignmentCenter;
    label.numberOfLines     = 0;
    label.adjustsFontSizeToFitWidth = YES;
    label.backgroundColor   = [UIColor clearColor];
    
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    [attributedString appendString:@"抱歉, 系统繁忙" withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 18.0f + fontScale)];
    [attributedString addLine:2];
    [attributedString appendString:@"请稍后再试" withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f + fontScale)];
    label.attributedText    = attributedString;
    
    
    NVButton* button        = [[NVButton alloc] initWithFrame:CGRectMake((APPLICATIONWIDTH - 100.0f)/2,
                                                                         APPLICATIONHEIGHT/2 + 80.0f,
                                                                         100.0f,
                                                                         30.0f)];
    [exceptionView addSubview:button];
    [button setTitle:@"再试一次" forState:UIControlStateNormal];
    [button setTitleColor:COLOR_HM_BLACK forState:UIControlStateNormal];
    button.titleLabel.font  = nvNormalFontWithSize(14.0f + fontScale);
    button.normalColor      = COLOR_HM_BLACK;
    button.buttonStyle      = NVButtonStyleBorder;
    [button addTarget:self action:@selector(onTryAgain:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:exceptionView];
    
}



- (void) showErrorView {
    
}


- (void) showOffNetworkView {
    [self showOffNetworkViewInView:self.view];
}

- (void) showOffNetworkViewInView:(UIView *)view {
    
    UIView* exceptionView = [self exceptionViewInView:view];
    
    exceptionView.backgroundColor = COLOR_HM_WHITE_GRAY;
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((APPLICATIONWIDTH - 107.0f)/2,
                                                                           (APPLICATIONHEIGHT - 107.0f)/2 - 80.0f,
                                                                           107.0f,
                                                                           107.0f)];
    [exceptionView addSubview:imageView];
    imageView.image     = [UIImage imageNamed:@"no_network_status"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    NVLabel* label          = [[NVLabel alloc] initWithFrame:CGRectMake(0.0f,
                                                                        APPLICATIONHEIGHT/2,
                                                                        APPLICATIONWIDTH,
                                                                        60.0f)];
    [exceptionView addSubview:label];
    label.font              = nvNormalFontWithSize(16.0f + fontScale);
    label.textColor         = COLOR_HM_GRAY;
    label.textAlignment     = NSTextAlignmentCenter;
    label.numberOfLines     = 0;
    label.adjustsFontSizeToFitWidth = YES;
    label.backgroundColor   = [UIColor clearColor];
    
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    [attributedString appendString:@"加载失败" withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 18.0f + fontScale)];
    [attributedString addLine:2];
    [attributedString appendString:@"请再次刷新或检测网络" withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f + fontScale)];
    label.attributedText    = attributedString;
    
    
    UIButton* button        = [[UIButton alloc] initWithFrame:CGRectMake((APPLICATIONWIDTH - 150.0f)/2,
                                                                         APPLICATIONHEIGHT/2 + 80.0f,
                                                                         150.0f,
                                                                         40.0f)];
    [exceptionView addSubview:button];
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHex:(0xffffff)] forState:UIControlStateNormal];
    button.titleLabel.font  = nvNormalFontWithSize(14.0f + fontScale);
    [button setBackgroundColor:COLOR_HM_BLUE];
    [button addTarget:self action:@selector(onTryAgain:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:exceptionView];
}


- (void) showNullDataView {
    [self showNullDataViewInView:self.view attributedString:[self titleOfNullDataView]];
}

- (void) showNullWithText:(NSString *) text view:(UIView *)view {
    
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    
    [attributedString appendString:[NSString stringWithFormat:@"暂无%@",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 17.0f)];
    [attributedString addLine:2];
    [attributedString appendString:[NSString stringWithFormat:@"如果有%@，您将在这里看到",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f)];
    
    [self showNullDataViewInView:view attributedString:attributedString imageName:nil rectFrame:CGRectZero];
}

- (void) showNullWithText:(NSString *) text view:(UIView *)view imageName:(NSString *)imageName {
    
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    
    [attributedString appendString:[NSString stringWithFormat:@"暂无%@",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 17.0f)];
    [attributedString addLine:2];
    [attributedString appendString:[NSString stringWithFormat:@"如果有%@，您将在这里看到",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f)];
    
    [self showNullDataViewInView:view attributedString:attributedString imageName:imageName rectFrame:CGRectZero];
}

- (void) showNullWithText:(NSString *) text view:(UIView *)view imageName:(NSString *)imageName frame:(CGRect)frame {
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    
    [attributedString appendString:[NSString stringWithFormat:@"暂无%@",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 17.0f)];
    [attributedString addLine:2];
    [attributedString appendString:[NSString stringWithFormat:@"如果有%@，您将在这里看到",text] withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f)];
    
    [self showNullDataViewInView:view attributedString:attributedString imageName:imageName rectFrame:frame];
}



- (void) showNullDataViewInView:(UIView*)view attributedString:(NSAttributedString *)attributedString imageName:(NSString *) imageName  rectFrame:(CGRect)rectFrame{
    UIView* exceptionView = [self exceptionViewInView:view];
    CGRect frame          = CGRectZero;
    
    exceptionView.backgroundColor = [UIColor clearColor];
    UIImageView* imageView = [[UIImageView alloc] init];
    if (rectFrame.size.height == 0) {
        frame             = view.frame;
        imageView.frame   = CGRectMake((frame.size.width - 100.0f * displayScale)/2,
                                       (frame.size.height - 100 * displayScale) / 2 - NAVIGATIONBARHEIGHT,
                                       100.0f * displayScale,
                                       100.0f * displayScale);
    } else {
        frame             = rectFrame;
        imageView.frame   = CGRectMake((frame.size.width - 100.0f * displayScale)/2,
                                       rectFrame.origin.y + (frame.size.height - 100 * displayScale) / 2 - NAVIGATIONBARHEIGHT,
                                       100.0f * displayScale,
                                       100.0f * displayScale);
    }
    
    
    [exceptionView addSubview:imageView];
    imageView.image     = [self imageOfNullDataView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    
    NVLabel* label      = [[NVLabel alloc] initWithFrame:CGRectMake(30.0f,
                                                                    CGRectGetMaxY(imageView.frame) +5.0f,
                                                                    frame.size.width - 60.0f,
                                                                    50.0f)];
    [exceptionView addSubview:label];
    label.adjustsFontSizeToFitWidth     = YES;
    label.font          = nvNormalFontWithSize(16.0f + fontScale);
    label.textColor     = COLOR_HM_GRAY;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    //    label.text          = [self titleOfNullDataView];
    
    if (attributedString) {
        label.attributedText = attributedString;
    }else{
        label.attributedText= [self titleOfNullDataView];
    }
    [view addSubview:exceptionView];
}

- (void) showNullWithButtonText:(NSString *)text contentText:(NSString *)contentText imageName:(NSString *)imageName view:(UIView *)view {
    
    UIView* exceptionView = [self exceptionViewInView:view];
    
    CGRect frame = view.frame;
    exceptionView.backgroundColor = [UIColor clearColor];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 100.0f * displayScale)/2,
                                                                           (frame.size.height - 100 * displayScale) / 2 - NAVIGATIONBARHEIGHT,
                                                                           100.0f * displayScale,
                                                                           100.0f * displayScale)];
    [exceptionView addSubview:imageView];
    imageView.image         = [UIImage imageNamed:imageName];
    imageView.contentMode   = UIViewContentModeScaleAspectFit;
    
    NSMutableAttributedString* attributedString     = [[NSMutableAttributedString alloc] init];
    
    [attributedString appendString:[NSString stringWithFormat:@"暂无%@",contentText] withAttributes:ATTR_DICTIONARY(COLOR_HM_BLACK, 17.0f)];
    [attributedString addLine:2];
    [attributedString appendString:[NSString stringWithFormat:@"如果有%@，您将在这里看到",contentText] withAttributes:ATTR_DICTIONARY(COLOR_HM_DARK_GRAY, 14.0f)];
    
    NVLabel* label      = [[NVLabel alloc] initWithFrame:CGRectMake(30.0f,
                                                                    CGRectGetMaxY(imageView.frame) +5.0f,
                                                                    frame.size.width - 60.0f,
                                                                    50.0f)];
    [exceptionView addSubview:label];
    label.adjustsFontSizeToFitWidth     = YES;
    label.font          = nvNormalFontWithSize(16.0f + fontScale);
    label.textColor     = COLOR_HM_GRAY;
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.attributedText = attributedString;
    
    UIButton* btn           = [[UIButton alloc] initWithFrame:CGRectMake(30.0f,
                                                                         CGRectGetMaxY(label.frame) + 10,
                                                                         frame.size.width - 60.0f,
                                                                         30.0f)];
    
    [exceptionView addSubview:btn];
    btn.titleLabel.font     = nvNormalFontWithSize(14.f);
    [btn setTitleColor:COLOR_HM_DARK_GRAY forState:UIControlStateNormal];
    [btn setTitle:text forState:UIControlStateNormal];
    [view addSubview:exceptionView];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exceptionOnClick)];
    [btn addGestureRecognizer:tap];
    
}

- (void)exceptionOnClick {
    
}


- (void) tryAgainAtExceptionView {
    
}



- (void) hideExceptionView {
    UIView* exceptionView = [self.view viewWithTag:TAG_OF_EXCEPTION_VIEW];
    if (exceptionView != nil) {
        [exceptionView removeFromSuperview];
    }
}

- (UIImage*) imageOfNullDataView {
    return [UIImage imageNamed:@"no_transaction_record"];
}


- (NSAttributedString*) titleOfNullDataView {
    NSAttributedString* attributedString    = [[NSAttributedString alloc] initWithString:@"暂无数据"
                                                                              attributes:ATTR_DICTIONARY(COLOR_HM_GRAY, 16.0f + fontScale)];
    
    return attributedString;
}


#pragma mark - private
- (UIView*) exceptionViewInView:(UIView*)view {
    UIView* exceptionView = [view viewWithTag:TAG_OF_EXCEPTION_VIEW];
    if (exceptionView == nil) {
        
        exceptionView       = [[UIView alloc] initWithFrame:view.bounds];
        exceptionView.tag   = TAG_OF_EXCEPTION_VIEW;
        
    }
    
    [exceptionView removeFromSuperview];
    
    NSArray* subViews = exceptionView.subviews;
    for (UIView* view in subViews) {
        [view removeFromSuperview];
    }
    
    return exceptionView;
}

- (void) onTryAgain:(id)sender {
    [self tryAgainAtExceptionView];
}

@end
