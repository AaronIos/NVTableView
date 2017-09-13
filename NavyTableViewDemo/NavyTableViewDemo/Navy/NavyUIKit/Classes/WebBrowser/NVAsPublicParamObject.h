//
//  NVAsPublicParamObject.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NVTaskObjectProtocol.h"

typedef void(^PublicParamInvoke) (NSString* name, NSString* value, UIViewController* viewController, void(^callback)(BOOL completed));


@interface NVAsPublicParamObject : NSObject
<NVTaskObjectProtocol>
@property (nonatomic, strong) NSString* name;
@property (nonatomic, copy) PublicParamInvoke invokeBlock;
@end





