//
//  NVStorageManager+Category.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVStorageManager.h"
#import "NVUserDataModel.h"


UIKIT_EXTERN NSString* const kStorageKeyChainUserInfo;
UIKIT_EXTERN NSString* const kStorageKeyChainAccountInfo;
//UIKIT_EXTERN NSString* const kStorageKeyChainBankCardList;
//UIKIT_EXTERN NSString* const kStoragePlistProductTDList;


@interface NVStorageManager (User)
- (void) saveUserInfo:(NVUserDataModel*)userDataModel completed:(void(^)(BOOL finish))completed;
- (void) getUserInfo:(void(^)(NVUserDataModel* dataModel))block;
- (void) clearUserInfo:(void(^)(BOOL completed))completed;
@end

