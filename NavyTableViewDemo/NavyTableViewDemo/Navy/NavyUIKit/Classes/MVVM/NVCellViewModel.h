//
//  NVCellViewModel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVViewModelProtocol.h"
#import "NVTableViewCellItemProtocol.h"


@interface NVCellViewModel : NSObject
<NVViewModelProtocol,
NVTableViewCellItemProtocol>


@end
