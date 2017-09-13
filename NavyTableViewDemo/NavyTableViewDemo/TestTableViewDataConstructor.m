//
//  TestTableViewDataConstructor.m
//  NavyTableViewDemo
//
//  Created by Astraea尊 on 2017/9/13.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "TestTableViewDataConstructor.h"
#import "NVTableViewNullCell.h"
#import "NVAnimationButtonTableViewCell.h"

@implementation TestTableViewDataConstructor

- (void)constructData {
    
    [self.items removeAllObjects];
    
    NVDataModel* itemNull                   = [[NVDataModel alloc] init];
    itemNull.cellClass                      = [NVTableViewNullCell class];
    itemNull.cellType                       = @"cell.type.null";
    itemNull.cellHeight                     = [NSNumber numberWithFloat:100.0f];
    
    [self.items addObject:itemNull];
    
    NVAnimationButtonDataModel* itemButton  = [[NVAnimationButtonDataModel alloc] init];
    itemButton.cellClass                    = [NVAnimationButtonTableViewCell class];
    itemButton.cellType                     = @"cell.type.button";
    itemButton.cellHeight                   = [NSNumber numberWithFloat:[NVButtonTableViewCell heightForCell]];
    
    itemButton.enable                       = YES;
    itemButton.backgroundColor              = COLOR_HM_BLUE;
    itemButton.disableColor                 = COLOR_HM_LIGHT_GRAY;
    itemButton.normalTitle                  = @"确定";
    itemButton.loadingTitle                 = @"正在加载...";
    itemButton.completeTitle                = @"完成";
    itemButton.failureTitle                 = @"出现异常, 请重试";
    itemButton.delegate                     = self.viewControllerDelegate;
    
    [self.items addObject:itemButton];
}


@end
