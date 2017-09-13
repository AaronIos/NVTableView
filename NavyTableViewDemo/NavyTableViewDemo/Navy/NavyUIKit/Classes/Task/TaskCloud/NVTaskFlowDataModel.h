//
//  NVTaskFlowDataModel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NavyUIKit.h"
#import "NVSerializedObjectProtocol.h"


@interface NVTaskFlowDataModel : NSObject
<NVFundationSerializedObjectProtocol,
NVFundationDeserializedObjectProtocol>
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* flowUrl;
@end


@interface NVTaskFlowListModel : NVListModel
<NVFundationSerializedObjectProtocol,
NVFundationDeserializedObjectProtocol>
@property (nonatomic, strong) NSString* version;
@property (nonatomic, strong) NSString* queryDateTime;
- (NVTaskFlowDataModel*) taskFlowByName:(NSString*)name;
@end