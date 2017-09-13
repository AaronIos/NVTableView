//
//  NVNotifyObservedObject.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^NotifyInvoke) (NSString* name, NSDictionary* parameters);


@interface NVNotifyObservedObject : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* notifyName;
@property (nonatomic, copy) NotifyInvoke invokeBlock;
@end

