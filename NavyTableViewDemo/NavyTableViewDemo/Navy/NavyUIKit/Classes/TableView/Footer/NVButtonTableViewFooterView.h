//
//  NVButtonFooterView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"
#import "NVTableViewFooterView.h"
#import "NVButton.h"


@protocol NVButtonTableViewFooterViewDelegate;


@interface NVButtonTableViewFooterView : NVTableViewFooterView
@property (nonatomic, strong, readonly) NVButton* button;
@property (nonatomic, assign) id<NVButtonTableViewFooterViewDelegate> delegate;
@end


@protocol NVButtonTableViewFooterViewDelegate <NSObject>
- (void) didClickButtonTableViewFooterView:(NVButtonTableViewFooterView*)cell;
@end


