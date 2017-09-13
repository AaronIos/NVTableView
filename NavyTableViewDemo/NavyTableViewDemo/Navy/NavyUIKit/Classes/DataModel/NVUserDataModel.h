//
//  NVUserDataModel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVDataModel.h"
#import "NVSerializedObjectProtocol.h"


typedef NS_ENUM(NSUInteger, NVUserStatus) {
    NVUserStatusNormal          = 01,
    NVUserStatusFreeze,
    NVUserStatusLogoff,
};

typedef NS_ENUM(NSUInteger, NVUserCustomerType) {
    NVUserCustomerTypeOnline        = 01,
    NVUserCustomerTypeOffline,
};


@interface NVUserDataModel : NVDataModel
<NVFundationSerializedObjectProtocol,
NVFundationDeserializedObjectProtocol>

@property (nonatomic, strong) NSString* bindCard;
@property (nonatomic, strong) NSString* passwordCash;






@end
