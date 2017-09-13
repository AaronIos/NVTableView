//
//  NVViewModelProtocol.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVViewModelCommand.h"
#import "NVViewModelObserver.h"


@protocol NVViewModelProtocol <NSObject>
@property (nonatomic, strong) NVViewModelCommand* command;
@property (nonatomic, strong) NVViewModelObserver* observer;
@end
