//
//  NVTask.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTask.h"

@implementation NVTask

- (void) execute {
    if (self.object &&
        [self.object conformsToProtocol:@protocol(NVTaskObjectProtocol)]) {
        [self.object doTaskWithUserInfo:self.userInfo callback:^(BOOL completed) {
            if (self.callback) {
                self.callback(completed);
            }
        }];
    }
}

@end

