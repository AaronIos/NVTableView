//
//  NVSerializedObjectProtocol.h
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.



#import <Foundation/Foundation.h>


/*!
 @protocol
 @abstract      序列化对象抽象类
 */
@protocol NVSerializedObjectProtocol <NSObject>

@end


/*!
 @protocol
 @abstract      反序列化对象抽象类
 */
@protocol NVDeserializedObjectProtocol <NSObject>

@end


/*!
 @protocol
 @abstract      序列化Fundation对象抽象类
 */
@protocol NVFundationSerializedObjectProtocol <NVSerializedObjectProtocol>
- (id) initWithDictionary:(NSDictionary*)dictionary;
- (id) initWithArray:(NSArray*)array;

+ (id) serializeWithDictionary:(NSDictionary*)dictionary;
+ (id) serializeWithArray:(NSArray*)array;
@end


/*!
 @protocol
 @abstract      反序列化Fundation对象抽象类
 */
@protocol NVFundationDeserializedObjectProtocol <NVDeserializedObjectProtocol>
- (NSDictionary*) dictionaryValue;
- (NSArray*) arrayValue;
@end




