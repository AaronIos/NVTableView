//
//  PAPlistStorage.h
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVStorageProtocol.h"



/*!
 @class
 @abstract      Plist存储类
 */
@interface NVPlistStorage : NSObject <NVFundationStorageProtocol>
@property (nonatomic, copy, readonly) NSString* fileName;
- (id) initWithFileName:(NSString*)fileName;
- (void) save;
@end



@interface PACoreDataStorage : NSObject <NVFundationStorageProtocol>

@end




@interface PADiskStorage : NSObject <NVFundationStorageProtocol>

@end


