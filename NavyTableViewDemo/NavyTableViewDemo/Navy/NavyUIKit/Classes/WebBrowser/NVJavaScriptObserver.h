//
//  NVJavaScriptObserver.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVSingleton.h"
#import "NVJsObservedObject.h"



@interface NVJavaScriptObserver : NSObject

DEF_SINGLETON(NVJavaScriptObserver)

- (void) addObserverName:(NSString*)name
                  jsName:(NSString*)jsName
                  invoke:(void(^)(NSString* name, NSArray* args, UIViewController* viewController, NSString* webUrl))block;
- (NSDictionary*) observer;

@end
