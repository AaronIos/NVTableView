//
//  NVErrorDataModel.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVDataModel.h"
#import <UIKit/UIKit.h>
#import "NVSerializedObjectProtocol.h"

UIKIT_EXTERN NSString* const kResponseErrorTypeNeedLogin;
UIKIT_EXTERN NSString* const kResponseErrorTypeFail;
UIKIT_EXTERN NSString* const kResponseErrorTypeInvalid;
UIKIT_EXTERN NSString* const kResponseErrorTypeException;
UIKIT_EXTERN NSString* const kResponseErrorTypeError;


@interface NVErrorDataModel : NVDataModel
@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString* error;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, strong) NSString* errorType;
@property (nonatomic, strong) NSString* level;
@property (nonatomic, strong) NSString* content;
@end


@interface NVExceptionDataModel : NVDataModel

@end






@interface NVSuccessDataModel : NVDataModel
<NVFundationSerializedObjectProtocol,
NVFundationDeserializedObjectProtocol>

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, assign) BOOL result;
@property (nonatomic, strong) NSString* type;

@end


