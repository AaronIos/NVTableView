//
//  NVAsObservedObject.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AppSchemaInvoke) (NSString* name, NSDictionary* parameters, UIViewController* viewController);


@interface NVAsObservedObject : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* serviceName;
@property (nonatomic, copy) AppSchemaInvoke invokeBlock;
@end
