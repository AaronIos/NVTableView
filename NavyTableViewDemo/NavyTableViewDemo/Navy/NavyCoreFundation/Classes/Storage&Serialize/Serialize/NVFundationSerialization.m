//
//  NVFundationSerialization.m
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.


#import "NVFundationSerialization.h"
#import "NVSerializedObjectProtocol.h"


@implementation NVFundationSerialization

- (id) serialize:(id)object {
    return nil;
}

+ (NVDataModel*) serializeDictionary:(NSDictionary *)dictionary {
    return nil;
}

+ (NVListModel *) serializeArray:(NSArray *)array
{
    return nil;
}

+ (NVListModel *) serializeArray:(NSArray *)array withClass:(Class)classInstance
{
    return nil;
}

+ (NVDataModel*) serializeDictionary:(NSDictionary *)dictionary withClass:(Class)classInstance {
    
//    NSString* className = NSStringFromClass(classInstance);
    
    NVDataModel* dataModel = [[classInstance alloc] init];
    [dataModel conformsToProtocol:@protocol(NVFundationSerializedObjectProtocol)];
    
    dataModel = [[classInstance alloc] initWithDictionary:dictionary];
    return dataModel;
}

@end


@implementation NVFundationDeserialization

- (id) deserialize:(id)object {
    return nil;
}

@end



