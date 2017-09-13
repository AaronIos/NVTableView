//
//  NVTableViewHeaderView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavyUIKit.h"


@interface NVTableViewHeaderView : UIView
@property (nonatomic, strong) NVLabel* uiTitle;

+ (CGFloat) heightForView;

@end
