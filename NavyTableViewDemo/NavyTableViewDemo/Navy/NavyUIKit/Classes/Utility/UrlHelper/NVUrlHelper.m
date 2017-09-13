//
//  NVUrlHelper.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVUrlHelper.h"



@implementation NVUrlHelper
IMP_SINGLETON


- (BOOL) hasAppUrlSchema:(NSString*)urlSchema {
    urlSchema   = [urlSchema lowercaseString];
    if ([urlSchema isEqualToString:@"hyhapp"]) {
        return YES;
    }
    
    return NO;
}

@end
