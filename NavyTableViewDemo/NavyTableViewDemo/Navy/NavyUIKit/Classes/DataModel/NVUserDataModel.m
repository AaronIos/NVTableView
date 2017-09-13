//
//  NVUserDataModel.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVUserDataModel.h"

@implementation NVUserDataModel

- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        
        if ([dictionary isKindOfClass:[NSDictionary class]]) {
            self.passwordCash           = [dictionary nvObjectForKey:@"passwordCash"];
            self.bindCard               = [dictionary nvObjectForKey:@"bindCard"];
        }
    }
    
    return self;
}



@end
