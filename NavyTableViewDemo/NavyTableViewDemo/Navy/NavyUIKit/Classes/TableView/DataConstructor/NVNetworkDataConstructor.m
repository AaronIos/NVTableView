//
//  NVNetworkDataConstructor.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVNetworkDataConstructor.h"

@interface NVNetworkDataConstructor ()
@property (nonatomic, strong) Class delegateClass;
@end

Class object_getClass(id object);

@implementation NVNetworkDataConstructor

- (void) dealloc {
    _delegate = nil;
    self.delegateClass = nil;
    
    [self.requestQueueArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj cancel];
    }];
    self.requestQueueArray = nil;
}

- (void) setDelegate:(id<NVNetworkDataConstructorDelegate>)delegate {
    _delegate = delegate;
    if (_delegate) {
        self.delegateClass = object_getClass(_delegate);
    } else {
        self.delegateClass = nil;
    }
}

- (BOOL) isDelegateValid {
    return (_delegate && object_getClass(_delegate) == _delegateClass);
}


- (void) loadData {
    
}

- (void) loadMore {
    
}

@end

