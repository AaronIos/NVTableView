//
//  NVJavaScriptDataModel.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVJavaScriptDataModel.h"
#import <objc/runtime.h>


@implementation NVJavaScriptDataModel

- (id) initWithArgs:(NSArray *)array {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSArray*) argsValue {
    return @[];
}

- (BOOL) available:(NSArray*)argsValue {
    unsigned int count;
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    
    return (count == [argsValue count] + 2);
}

@end
