//
//  PAStorageOperationQueue.h
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVStorageOperation.h"
#import <UIKit/UIKit.h>


UIKIT_EXTERN NSString* const kStorageQueueMemory;
UIKIT_EXTERN NSString* const kStorageQueuePList;
UIKIT_EXTERN NSString* const kStorageQueueDisk;
UIKIT_EXTERN NSString* const kStorageQueueCoreData;
UIKIT_EXTERN NSString* const kStorageQueueKeyChain;



/*!
 @class
 @abstract      存储操作队列
 */
@interface NVStorageOperationQueue : NSObject

- (void)addOperation:(NVStorageOperation *)op;
- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait;
- (void)addOperationWithBlock:(void (^)(void))block;
- (void)cancelAllOperations;
@end
