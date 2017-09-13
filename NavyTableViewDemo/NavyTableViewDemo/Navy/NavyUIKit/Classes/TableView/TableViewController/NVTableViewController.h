//
//  NVTableViewController.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

//#import <NavyUIKit/NavyUIKit.h>
#import "NVGlassMainViewController.h"
#import "NVTableViewAdaptor.h"
#import "NVTableView.h"


typedef NS_ENUM(NSUInteger, NVTableViewStyle) {
    NVTableViewStyleNormal,
    NVTableViewStyleGroup,
};

@interface NVTableViewController : NVGlassMainViewController
<UITableViewDataSource, UITableViewDelegate> {
    BOOL _isLoading;
}

@property (nonatomic, strong) NVTableView* uiTableView;
@property (nonatomic, strong) NVTableViewAdaptor* adaptor;
@property (nonatomic, assign) NVTableViewStyle tableViewStyle;
@property (nonatomic, strong) NSMutableArray *requestQueueArray; // add by GL 创建一个请求队列

@property (nonatomic, strong) UIView *navigationBackView;

@property (nonatomic, assign) BOOL showNavigationBackView;

@property (nonatomic, strong) UILabel *navigationTitleLable;

@property (nonatomic, assign) BOOL   isPushSelf; //判断是否可以通过类型自己push自己

- (void) createTableView;
- (void) constructData;
- (void) initialize;

@end

