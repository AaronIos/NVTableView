//
//  NVStorageProtocol.h
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 @protocol
 @abstract      存储抽象类。
                定义最抽象的存储函数
 */
@protocol NVStorageProtocol <NSObject>

@optional
/*!
 @function
 @abstract      读数据
 */
- (void) read;

/*!
 @function
 @abstract      写数据
 */
- (void) write;

@end


/*!
 @protocol
 @abstract      存储抽象类。
                定义最基本的存储函数
 */
@protocol NVFundationStorageProtocol <NVStorageProtocol>

- (id) readObjectForKey:(NSString*)key;
- (void) writeObject:(id)object forKey:(NSString*)key;

- (void) deleteObject:(id)object forKey:(NSString*)key;

@optional
- (id) readObject;
- (void) writeObject:(id)object;

@end