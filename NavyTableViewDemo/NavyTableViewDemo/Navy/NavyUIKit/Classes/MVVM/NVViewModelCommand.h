//
//  NVViewModelCommand.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^NVViewModelCommandCompleteBlock) (id error, id content);
typedef void(^NVViewModelCommandConsumeBlock) (id value, NVViewModelCommandCompleteBlock completeHandler);
typedef void(^NVViewModelCommandCancelBlock) (void);


@interface NVViewModelCommand : NSObject
- (instancetype) initWithConsumeHandler:(NVViewModelCommandConsumeBlock)consumeHandler;
- (instancetype) initWithConsumeHandler:(NVViewModelCommandConsumeBlock)consumeHandler cancelHandler:(NVViewModelCommandCancelBlock)cancelHandler;
- (void) execute:(id)value;
- (void) cancel;
@end
