//
//  NVStorageManager+TaskCloud.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVStorageManager.h"
#import "NVTaskFlowDataModel.h"


UIKIT_EXTERN NSString* const kStoragePlistTaskCloud;

@interface NVStorageManager (TaskCloud)

- (void) getTaskFlowList:(void(^)(NVTaskFlowListModel* dataModel))block;
- (void) saveTaskFlowList:(NVTaskFlowListModel*)listTaskFlow completed:(void(^)(BOOL finish))completed;
- (void) clearTaskFlowList:(void(^)(BOOL completed))completed;

@end
