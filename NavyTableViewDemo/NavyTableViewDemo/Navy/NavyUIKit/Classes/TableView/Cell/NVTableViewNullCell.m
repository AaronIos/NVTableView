//
//  NVTableViewNullCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewNullCell.h"

@implementation NVTableViewNullCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setBackGroundColor:(UIColor *)backGroundColor {
    _backGroundColor = backGroundColor;
    [self setBackGroundColor:_backGroundColor];
}

@end
