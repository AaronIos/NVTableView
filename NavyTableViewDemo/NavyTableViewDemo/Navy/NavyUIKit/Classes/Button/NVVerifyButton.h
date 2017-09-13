//
//  NVVerifyButton.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"
#import "NVButton.h"


typedef NS_ENUM(NSInteger, NVVerifyButtonState) {
    NVVerifyButtonStateStartCountDown,
    NVVerifyButtonStateStopCountDown,
};


@protocol NVVerifyButtonDelegate;

@interface NVVerifyButton : NVButton
@property (nonatomic, assign) CGFloat countDown;
@property (nonatomic, assign) id<NVVerifyButtonDelegate> delegate;
- (void) startCountDown;
- (void) stopCountDown;
@end


@protocol NVVerifyButtonDelegate <NSObject>
- (void) verifyButton:(NVVerifyButton*)button didChangeState:(NVVerifyButtonState)state;
@end



