//
//  NVBackgroundControl.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NVBackgroundControlDelegate;


@interface NVBackgroundControl : UIControl
@property (nonatomic, assign) id<NVBackgroundControlDelegate> delegate;
- (void) show;
- (void) hide;
@end


@protocol NVBackgroundControlDelegate <NSObject>
- (void) didTouchUpInsideOnBackgroundControl:(NVBackgroundControl*)control;
@end

