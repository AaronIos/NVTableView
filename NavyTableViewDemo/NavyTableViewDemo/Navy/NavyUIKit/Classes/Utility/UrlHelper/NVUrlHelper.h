//
//  NVUrlHelper.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVSingleton.h"


@interface NVUrlHelper : NSObject
DEF_SINGLETON(NVUrlHelper)

- (BOOL) hasAppUrlSchema:(NSString*)urlSchema;

@end
