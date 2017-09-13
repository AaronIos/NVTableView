//
//  NVDataModel.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVTableViewCellItemProtocol.h"
#import "NSDictionary+Category.h"


@interface NVDataModel : NSObject
<NVTableViewCellItemProtocol>

@end



@interface NVListModel : NVDataModel
@property (nonatomic, strong) NSMutableArray* items;
@property (nonatomic, assign) NSInteger total;

@end

