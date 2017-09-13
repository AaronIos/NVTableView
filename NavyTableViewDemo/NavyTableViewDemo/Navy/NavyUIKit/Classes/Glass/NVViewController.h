//
//  NVViewController.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NVViewController : UIViewController
- (void) decorateRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                     duration:(NSTimeInterval)duration
                             withRotationRect:(CGRect)rect;
@end
