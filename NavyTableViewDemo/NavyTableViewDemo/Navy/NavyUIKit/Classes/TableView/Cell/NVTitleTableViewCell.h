//
//  NVTitleTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"


@interface NVTitleDataModel : NVDataModel
@property (nonatomic, strong) id title;
@property (nonatomic, strong) UIColor* titleColor;
@property (nonatomic, strong) UIColor* backgroundColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, assign) CGFloat fontSize;
@end


@interface NVTitleTableViewCell : NVTableViewNullCell

@property (nonatomic, strong) NVLabel* uiTitle;

- (void) updateDisplay;

@end


