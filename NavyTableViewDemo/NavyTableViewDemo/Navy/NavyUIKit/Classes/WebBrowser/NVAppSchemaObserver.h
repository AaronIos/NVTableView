//
//  NVAppSchemaObserver.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVSingleton.h"
#import "NVAsObservedObject.h"
#import "NVAsPublicParamObject.h"


@interface NVAppSchemaObserver : NSObject
DEF_SINGLETON(NVAppSchemaObserver)

@property (nonatomic, strong, readonly) NSString* appSchema;

- (void) setAppSchema:(NSString*)appSchema;
- (BOOL) hasAppSchema:(NSString*)urlSchema;

- (void) addPublicParamName:(NSString*)paramName
                     invoke:(void(^)(NSString* paramName, NSString* paramValue, UIViewController* viewController, void(^callback)(BOOL completed)))block;

- (void) addObserverName:(NSString*)name
             serviceName:(NSString*)serviceName
                  invoke:(void(^)(NSString* name, NSDictionary* parameters, UIViewController* viewController))block;

//- (void) addObserverName:(NSString *)name
//                 webName:(NSString *)webName
//                  invoke:(void (^)(NSString* name, NSDictionary* parameters, UIViewController* viewController))block;

- (NVAsObservedObject*) observedObjectForServiceName:(NSString*)serviceName;
- (NVAsPublicParamObject*) publicParamObjectForParamName:(NSString*)paramName;
- (NSArray*) hasPublicParamExisted:(NSArray*)paramNames;


- (BOOL) handleOpenURL:(NSURL*)url;
- (void) openURL:(NSURL*)url;


- (NSURL*) generateAppUrlWithSchemaName:(NSString*)schemaName;

@end



