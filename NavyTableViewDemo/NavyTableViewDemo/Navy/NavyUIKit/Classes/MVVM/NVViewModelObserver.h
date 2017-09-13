//
//  NVViewModelObserver.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVSingleton.h"


@interface NVViewModelObserver : NSObject
DEF_SINGLETON(NVViewModelObserver)

- (void) attachObservedObject:(NSObject *)object
                   forKeyPath:(NSString *)keyPath
                        event:(void(^)(NSObject* object))eventBlock;

- (void) detachObservedObject:(NSObject*)object
                   forKeyPath:(NSString*)keyPath;

@end
