//
//  NVTask.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NVTaskObjectProtocol.h"

@interface NVTask : NSObject
@property (nonatomic, strong) id<NVTaskObjectProtocol> object;
@property (nonatomic, strong) NSDictionary* userInfo;
@property (nonatomic, copy) void(^callback)(BOOL completed);
- (void) execute;
@end
