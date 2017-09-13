//
//  NVSerializeProtocol.h
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>


/*!
 @protocol
 @abstract      序列化抽象类
 */
@protocol NVSerializeProtocol <NSObject>

/*!
 @function
 @abstract      序列化方法
 */
- (id) serialize:(id)object;
@end



/*!
 @protocol
 @abstract      反序列化抽象类
 */
@protocol NVDeserializeProtocol <NSObject>

/*!
 @function
 @abstract      反序列化方法
 */
- (id) deserialize:(id)object;
@end