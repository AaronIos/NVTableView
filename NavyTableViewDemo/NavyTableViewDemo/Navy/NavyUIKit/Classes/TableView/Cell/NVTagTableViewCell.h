//
//  NVTagTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"


@interface NVTagDataModel : NVDataModel
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* selectionColor;
@property (nonatomic, assign) BOOL selected;
@end


@interface NVTagTableViewCell : NVTableViewLineCell
- (void) updateDisplay;
@end


