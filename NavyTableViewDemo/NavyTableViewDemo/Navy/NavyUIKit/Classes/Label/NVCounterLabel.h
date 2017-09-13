//
//  NVCounterLabel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NVCounterLabel : UILabel
@property (nonatomic, assign) double fontSize;
- (void) countNumberWithDuration:(CGFloat)duration
                      fromNumber:(double)startNumber
                        toNumber:(double)endNumber;
@end
