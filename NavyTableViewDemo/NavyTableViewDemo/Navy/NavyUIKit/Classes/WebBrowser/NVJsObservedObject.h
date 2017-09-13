//
//  NVJsObserverObject.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^invoke) (NSString* name, NSArray* args, UIViewController* viewController, NSString* webUrl);

@interface NVJsObservedObject : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* jsName;
@property (nonatomic, copy) invoke invokeBlock;

@end
