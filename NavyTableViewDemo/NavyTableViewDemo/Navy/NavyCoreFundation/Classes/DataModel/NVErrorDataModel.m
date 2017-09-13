//
//  NVErrorDataModel.m
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVErrorDataModel.h"


NSString* const kResponseErrorTypeNeedLogin     = @"ERROR.NEED.LOGIN";
NSString* const kResponseErrorTypeFail          = @"ERROR.FAIL";
NSString* const kResponseErrorTypeInvalid       = @"ERROR.INVALID";
NSString* const kResponseErrorTypeException     = @"ERROR.EXCEPTION";
NSString* const kResponseErrorTypeError         = @"ERROR.ERROR";


@implementation NVErrorDataModel

@end



@implementation NVExceptionDataModel

@end


@implementation NVSuccessDataModel

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        
        if ([dictionary isKindOfClass:[NSDictionary class]]) {
            self.result            = [[dictionary nvObjectForKey:@"result"] boolValue];
            self.message           = [dictionary nvObjectForKey:@"resMsg"];
            self.type              = [dictionary nvObjectForKey:@"type"];
        }
    }
    return self;
}

- (NSDictionary*) dictionaryValue {
    return @{@"result":  @(self.result)};
}

@end


