//
//  NVFundationSerialization.h
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.


#import <Foundation/Foundation.h>
#import "NVSerializeProtocol.h"
#import "NVDataModel.h"



@interface NVFundationSerialization : NSObject <NVSerializeProtocol>

+ (NVDataModel*) serializeDictionary:(NSDictionary*)dictionary;
+ (NVListModel*) serializeArray:(NSArray*)array;

+ (NVDataModel*) serializeDictionary:(NSDictionary *)dictionary withClass:(Class)classInstance;
+ (NVListModel*) serializeArray:(NSArray *)array withClass:(Class)classInstance;

@end



@interface NVFundationDeserialization : NSObject <NVDeserializeProtocol>

@end



