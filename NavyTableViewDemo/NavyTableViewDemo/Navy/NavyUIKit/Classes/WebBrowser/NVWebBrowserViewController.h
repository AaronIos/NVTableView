//
//  HYWebBrowserViewController.h
//  Haiyinhui
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"
#import "NVJavaScriptObserver.h"
#import "NVAppSchemaObserver.h"
#import "NVWebView.h"


@class NVWebBrowserViewController;

@protocol NVWebBrowserViewControllerDelegate <NSObject>

- (void)respondUrlSchemeWithWebBrowserViewController:(NVWebBrowserViewController *)webBroserViewController;
- (void)didClickBackButtonActionWithNVWebBrowserViewController:(NVWebBrowserViewController *)webBrowserViewController;

@end

@interface NVWebBrowserViewController : NVGlassMainViewController
@property (nonatomic, strong) NVWebView* uiWebView;
@property (nonatomic, strong) NSString* urlPath;
@property (nonatomic, strong) NSString* loadHTMLString;
@property (nonatomic, strong) NVJavaScriptObserver* javaScriptObserver;
@property (nonatomic, strong) NVAppSchemaObserver* appSchemaObserver;
@property (nonatomic, assign) id<NVWebBrowserViewControllerDelegate> delegate;


@property (nonatomic, strong) NSString* isRiskEvaluation;
@property (nonatomic, strong) NSString* webType;

- (void) loginReload;
- (void) reload;
- (void) reloadUrl:(NSString*)url;
@end
