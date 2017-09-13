//
//  NVJavaScriptObserver.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVJavaScriptObserver.h"
#import "NVJsObservedObject.h"


@interface NVJavaScriptObserver ()
@property (nonatomic, strong) NSMutableDictionary* dictObserver;
@end


@implementation NVJavaScriptObserver

IMP_SINGLETON

- (instancetype) init {
    self = [super init];
    if (self) {
        
        self.dictObserver           = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void) addObserverName:(NSString *)name
                  jsName:(NSString *)jsName
                  invoke:(void (^)(NSString*, NSArray *, UIViewController *, NSString*))block {
    
    NVJsObservedObject* object  = [[NVJsObservedObject alloc] init];
    object.name                 = name;
    object.jsName               = jsName;
    object.invokeBlock          = block;
    
    [self.dictObserver setObject:object forKey:name];
}

- (NSDictionary*) observer {
    return self.dictObserver;
}

@end

