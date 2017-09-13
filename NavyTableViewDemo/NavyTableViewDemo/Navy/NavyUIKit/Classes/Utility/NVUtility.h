//
//  NVUtility.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define kURLSchemeIdnentifier                           @"cdl"


@interface NVUtility : NSObject

+ (NSString*) appUrlScheme;
+ (NSString*) appBundleId;
+ (NSString*) appVersion;
+ (NSString*) osVersion;
+ (NSString*) deviceInfo;
+ (NSString*) uuid;

@end
