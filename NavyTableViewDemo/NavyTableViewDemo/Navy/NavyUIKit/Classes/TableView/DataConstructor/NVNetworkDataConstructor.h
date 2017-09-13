//
//  NVNetworkDataConstructor.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewDataConstructor.h"


@protocol NVNetworkDataConstructorDelegate;


@interface NVNetworkDataConstructor : NVTableViewDataConstructor
@property (nonatomic, weak) id<NVNetworkDataConstructorDelegate> delegate;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) BOOL hasNext;
@property (nonatomic, strong) NSMutableArray *requestQueueArray; // add by GL 创建一个请求队列
@property (nonatomic, assign) BOOL weathRequestSucess;

- (void) loadData;
- (void) loadMore;
- (BOOL) isDelegateValid;
@end


@protocol NVNetworkDataConstructorDelegate <NSObject>
- (void) networkDataContructorStartLoading:(NVNetworkDataConstructor*)dataConstructor;
- (void) networkDataContructor:(NVNetworkDataConstructor*)dataConstructor didFinishWithData:(id)data;
- (void) networkDataContructor:(NVNetworkDataConstructor*)dataConstructor didErrorWithData:(id)data;
@end




