//
//  NVReactController.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVReactor.h"
#import "NVTableViewDataConstructor.h"


@interface NVReactController : NSObject
@property (nonatomic, strong) NVReactor* reactor;
@property (nonatomic, weak) NVTableViewDataConstructor* dataConstructor;

- (void) reactType:(NSString*)type dataModel:(NVDataModel*)dataModel;
- (void) clear;

@end
