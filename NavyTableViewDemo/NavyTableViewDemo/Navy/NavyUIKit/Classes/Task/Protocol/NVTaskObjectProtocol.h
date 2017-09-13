//
//  NVTaskObjectProtocol.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol NVTaskObjectProtocol <NSObject>
- (void) doTaskWithUserInfo:(NSDictionary*)userInfo callback:(void(^)(BOOL completed))callback;
@end
