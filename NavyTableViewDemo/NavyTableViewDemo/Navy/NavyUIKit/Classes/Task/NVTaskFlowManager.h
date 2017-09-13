//
//  NVTaskFlowManager.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NVSingleton.h"
#import "NVTaskFlowParametersObjectProtocol.h"



@interface NVTaskFlowManager : NSObject
DEF_SINGLETON(NVTaskFlowManager)

- (void) setLocalAppSchema:(NSString*)appSchema;

- (void) registerLocalTaskFlowWithSchemaName:(NSString*)schemaName
                                 serviceName:(NSString*)serviceName
                               parametersPath:(NSString*)parametersPath;

- (NSURL*) generateLocalTaskFlowWithSchemaName:(NSString*)schemaName
                              parametersObject:(id<NVTaskFlowParametersObjectProtocol>)parametersObject;

@end
