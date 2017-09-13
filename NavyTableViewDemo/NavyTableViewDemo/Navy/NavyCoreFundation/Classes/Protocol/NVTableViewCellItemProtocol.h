//
//  NVTableViewCellItemProtocol.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NVTableViewCellItemProtocol <NSObject>
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, strong) NSString* cellType;
@property (nonatomic, strong) NSNumber* cellHeight;
@property (nonatomic, strong) Class actionClass;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) id cellInstance;
@end
