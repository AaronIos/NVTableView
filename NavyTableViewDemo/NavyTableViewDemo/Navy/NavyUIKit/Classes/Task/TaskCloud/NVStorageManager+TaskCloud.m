//
//  NVStorageManager+TaskCloud.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVStorageManager+TaskCloud.h"


NSString* const kStoragePlistTaskCloud       = @"storage.plist.task.cloud";


@implementation NVStorageManager (TaskCloud)

- (void) saveTaskFlowList:(NVTaskFlowListModel *)listTaskFlow completed:(void (^)(BOOL))completed {
    NVStorageWriteOperation* operation = [[NVStorageWriteOperation alloc] init];
    operation.policy = NVStorageOperationPolicyPList;
    operation.keyName = kStoragePlistTaskCloud;
    operation.object = [listTaskFlow dictionaryValue];
    operation.writeBlock = ^{
        if (completed) {
            completed(YES);
        }
    };
    
    [self.operationQueue addOperation:operation];
}

- (void) getTaskFlowList:(void (^)(NVTaskFlowListModel *))block {
    NVStorageReadOperation* operation   = [[NVStorageReadOperation alloc] init];
    operation.policy                    = NVStorageOperationPolicyPList;
    operation.keyName                   = kStoragePlistTaskCloud;
    operation.readBlock                 = ^(id object) {
        if (block) {
            if ([object isKindOfClass:[NSDictionary class]]) {
                NVTaskFlowListModel* listMode   = [[NVTaskFlowListModel alloc] initWithDictionary:object];
                block(listMode);
            } else {
                block(nil);
            }
        }
        
    };
    
    [self.operationQueue addOperation:operation];
}

- (void) clearTaskFlowList:(void (^)(BOOL))completed {
    NVStorageWriteOperation* operation = [[NVStorageWriteOperation alloc] init];
    operation.policy = NVStorageOperationPolicyPList;
    operation.keyName = kStoragePlistTaskCloud;
    operation.object = @"";
    operation.writeBlock = ^{
        if (completed) {
            completed(YES);
        }
    };
    
    [self.operationQueue addOperation:operation];
}

@end
