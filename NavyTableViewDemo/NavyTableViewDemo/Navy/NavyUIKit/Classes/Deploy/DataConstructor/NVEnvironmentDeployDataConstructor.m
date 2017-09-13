
//  NVEnvironmentDeployDataConstructor.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVEnvironmentDeployDataConstructor.h"
#import "NVTagTableViewCell.h"
#import "NVTitleTableViewCell.h"
#import "NVButtonTableViewCell.h"
#import "NVTableViewNullCell.h"


@implementation NVEnvironmentDeployDataConstructor


- (void) constructData {
    
    
    NVTitleDataModel* itemTitle = [[NVTitleDataModel alloc] init];
    itemTitle.cellClass         = [NVTitleTableViewCell class];
    itemTitle.cellType          = @"cell.type.title";
    itemTitle.cellHeight        = [NSNumber numberWithFloat:[NVTitleTableViewCell heightForCell]];
    
    itemTitle.title             = @"请选择配置环境并确定";
    [self.items addObject:itemTitle];
    
    
    
    NSString* arrayCellTitles[4] = {
        @"开发环境",
        @"测试环境",
        @"准生产环境",
        @"生产环境",
    };
    
    NSString* arrayCellTypes[4] = {
        @"cell.type.env.dev",
        @"cell.type.env.test",
        @"cell.type.env.predis",
        @"cell.type.env.dis",
    };
    

    
    for (NSInteger i = 0; i < 4; i++) {
        NVTagDataModel* item        = [[NVTagDataModel alloc] init];
        item.cellClass              = [NVTagTableViewCell class];
        item.cellType               = arrayCellTypes[i];
        item.cellHeight             = [NSNumber numberWithFloat:[NVTagTableViewCell heightForCell]];
        
        item.title                  = arrayCellTitles[i];
        item.titleColor             = COLOR_HM_LIGHT_BLACK;
        item.selectionColor         = COLOR_HM_BLUE;
        item.selected               = [self.typeOfSelection isEqualToString:item.cellType];
        
        [self.items addObject:item];
    }
    
    
    NVDataModel* itemNull           = [[NVDataModel alloc] init];
    itemNull.cellClass              = [NVTableViewNullCell class];
    itemNull.cellType               = @"cell.type.null";
    itemNull.cellHeight             = [NSNumber numberWithFloat:20.0f];
    
    [self.items addObject:itemNull];
    
    
    
    NVButtonDataModel* itemBtn      = [[NVButtonDataModel alloc] init];
    itemBtn.cellClass               = [NVButtonTableViewCell class];
    itemBtn.cellType                = @"cell.type.button";
    itemBtn.cellHeight              = [NSNumber numberWithFloat:[NVButtonTableViewCell heightForCell]];
    
    itemBtn.title                   = @"确定";
    itemBtn.titleColor              = COLOR_DEFAULT_WHITE;
    itemBtn.backgroundColor         = COLOR_HM_BLUE;
    itemBtn.delegate                = self.viewControllerDelegate;
    
    [self.items addObject:itemBtn];
}


@end
