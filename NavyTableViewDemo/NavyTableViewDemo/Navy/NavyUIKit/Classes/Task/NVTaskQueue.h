//
//  NVTaskQueue.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NVTask.h"



@interface NVTaskQueue : NSObject
@property (nonatomic, assign, readonly) NSUInteger interator;
@property (nonatomic, copy) void(^taskQueueCallback)(NVTaskQueue* taskQueue, BOOL completed);

- (void) addTask:(NVTask*)task;
- (void) removeTask:(NVTask*)task;
- (void) cancelAllTasks;

- (void) start;
- (BOOL) next;

@end





