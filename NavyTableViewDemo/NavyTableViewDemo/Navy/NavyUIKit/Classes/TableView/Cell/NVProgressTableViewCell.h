//
//  NVProgressTableViewCell.h
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/8/2.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVTableViewNullCell.h"

@interface NVProgressDataModel : NVDataModel

@property (nonatomic, assign) CGFloat progressValue;
@property (nonatomic, strong) UIColor* progressTintColor;
@property (nonatomic, strong) UIColor* trackTintColor;
@property (nonatomic, strong) UIColor* backgroundColor;
@property (nonatomic, strong) NSString* progressIconName;
@property (nonatomic, strong) UIImage* progressImage;
@property (nonatomic, strong) UIImage* trackImage;

@end


@interface NVProgressTableViewCell : NVTableViewNullCell

@end
