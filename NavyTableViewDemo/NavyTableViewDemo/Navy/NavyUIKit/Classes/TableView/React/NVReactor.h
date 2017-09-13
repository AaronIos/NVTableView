//
//  NVReactor.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVDataModel.h"


@interface NVReactor : NSObject

- (void) registerObservedObject:(NVDataModel*)dataModel
                 objectIdentity:(NSString*)identity
                     forKeyPath:(NSString*)keyPath
                          block:(void (^)(NSObject *))eventBlock;

- (void) unregisterObservedObjectForIdentity:(NSString*)identity;

- (void) unregisterAllObservedObjects;

@end
