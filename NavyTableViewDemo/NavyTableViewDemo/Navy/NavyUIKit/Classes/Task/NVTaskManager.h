//
//  NVTaskManager.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVSingleton.h"
#import "NVTask.h"


@interface NVTaskManager : NSObject
DEF_SINGLETON(NVTaskManager)

- (void) addTask:(NVTask*)task name:(NSString*)name;
- (void) removeTask:(NVTask*)task name:(NSString*)name;
- (void) removeAllTaskWithName:(NSString*)name;

- (void) start:(NSString*)name finish:(void(^)(BOOL completed))block;

@end

