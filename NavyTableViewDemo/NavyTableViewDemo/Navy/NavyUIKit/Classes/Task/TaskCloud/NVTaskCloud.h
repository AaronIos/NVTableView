//
//  NVTaskCloud.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NVSingleton.h"
#import "NVTaskFlowDataModel.h"



@interface NVTaskCloud : NSObject
DEF_SINGLETON(NVTaskCloud)
@property (nonatomic, copy) void(^synchronizeBlock)(void(^callBack)(NVTaskFlowListModel* listModel));


- (void) initialize;
- (void) restoreFactoryMode;
- (void) synchronize;
- (NVTaskFlowDataModel*) flowUrlForName:(NSString*)flowName;

@end
