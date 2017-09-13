//
//  HYWebBrowserViewController.m
//  Haiyinhui
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVWebBrowserViewController.h"
#import "NVUrlHelper.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "UIImage+Category.h"



#define COLOR_HYH_RED                       [UIColor colorWithRed:227.0f/255.0f green:100.0f/255.0f blue:102.0f/255.0f alpha:1.0f]
#define COLOR_HYH_BLUE                      [UIColor colorWithRed:65.0f/255.0f green:155.0f/255.0f blue:240.0f/255.0f alpha:1.0f]


@interface NVWebBrowserViewController ()
<UIWebViewDelegate>

- (void) onClose:(id)sender;
@end



@implementation NVWebBrowserViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self decorateNavigationBar:self.tabBarController.navigationController.navigationBar];
    if (self.navigationController) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (void) viewDidLoad {
    [super viewDidLoad];
   
    CGRect frame = APPLICATIONFRAME;
    
    self.uiWebView      = [[NVWebView alloc] initWithFrame:CGRectMake(0.0f,
                                                                      0.0f,
                                                                      frame.size.width,
                                                                      frame.size.height + 20.0f)];
    [self.view addSubview:self.uiWebView];
    self.uiWebView.delegate = self;
    self.uiWebView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    self.javaScriptObserver = [NVJavaScriptObserver sharedInstance];
    self.appSchemaObserver  = [NVAppSchemaObserver sharedInstance];
    
    if (self.urlPath != nil ) {
        self.urlPath = [self.urlPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSURL *url = [NSURL URLWithString:self.urlPath];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [self.uiWebView loadRequest:request];
    } else if (self.loadHTMLString != nil) {
        [self.uiWebView loadHTMLString:self.loadHTMLString baseURL:nil];
    }
}

- (void) decorateRightButtonNavigationBar:(UINavigationBar *)navigationBar {
    UIButton *rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame=CGRectMake(0, 0,  30, 30);
    //[rightBtn setImage:[UIImage imageNamed:@"iconBtnRefresh"] forState:UIControlStateNormal];
    [rightBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [rightBtn addTarget:self action:@selector(refreshWebView) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem= rightBtnItem;
    
    if ([[[UIDevice currentDevice]systemVersion]floatValue]>=7.0) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }

}

- (void)loginReload {
    
    self.urlPath = [self.urlPath stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSURL *url = [NSURL URLWithString:self.urlPath];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [self.uiWebView loadRequest:request];
}

-(void)refreshWebView {
    UIWebView *webView = (UIWebView *)self.uiWebView;
    [webView reload];
}


- (void) decorateBackButtonNavigationBar:(UINavigationBar *)navigationBar {
    
    if ([self.navigationController.viewControllers count] > 1) {
        
        if (![self.uiWebView canGoBack]) {
            UIImage *btnImage = [UIImage imageNamed:@"top_left"];
            
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0.0f, 0.0f, 60.0f, 40.0f);
            
            [btn.titleLabel setFont:nvNormalFontWithSize(18.0f)];
            [btn setTitle:@"    " forState:UIControlStateNormal];
            [btn setTitleColor:COLOR_HYH_RED forState:UIControlStateNormal];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
            
            [btn setImage:btnImage forState:UIControlStateNormal];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0f, -30.0f, 0.0f, 0.0f)];
            
            [btn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem* backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
            self.navigationItem.leftBarButtonItem = backItem;
            
        } else {
            
            UIImage *btnImage = [UIImage imageNamed:@"top_left"];
            
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
            
            [btn setImage:btnImage forState:UIControlStateNormal];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0f, -30.0f, 0.0f, 0.0f)];
            
            [btn addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem* backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

            
            btnImage = [UIImage imageNamed:@"icon_close.png"];
            
            UIButton* btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
            btnClose.frame = CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
            
            
            [btnClose setImage:btnImage forState:UIControlStateNormal];
            [btnClose setImageEdgeInsets:UIEdgeInsetsMake(0.0f, -30.0f, 0.0f, 0.0f)];
            
            [btnClose addTarget:self action:@selector(onClose:) forControlEvents:UIControlEventTouchUpInside];
            
            UIBarButtonItem* closeItem = [[UIBarButtonItem alloc]initWithCustomView:btnClose];
            
            self.navigationItem.leftBarButtonItems = @[backItem, closeItem];
        }
        
    }
}


- (void) reloadUrl:(NSString*)url {
    if (url != nil) {
        [self.uiWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    }
}

- (NSString*) getNavigationTitle {
    return self.title;
}

- (void) backButtonAction:(id)sender {
    BOOL canGoBack = [self.uiWebView canGoBack];
    if (canGoBack) {
        [self.uiWebView goBack];
        [self decorateBackButtonNavigationBar:self.navigationController.navigationBar];
        return;
    }
    
    [super backButtonAction:sender];
    if ([self.webType isEqualToString:@"广告"]) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didClickBackButtonActionWithNVWebBrowserViewController:)]) {
            [self.delegate didClickBackButtonActionWithNVWebBrowserViewController:self];
        }
    }
    
}

- (void) onClose:(id)sender {
    [super backButtonAction:nil];
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
//    self.title = @"加载中...";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    JSContext* context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    if (self.javaScriptObserver != nil
        && [self.javaScriptObserver.observer count] > 0) {

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0L), ^{
            [self.javaScriptObserver.observer enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                NSString* name              = (NSString*)key;
                NVJsObservedObject* object  = (NVJsObservedObject*)obj;
                
                context[object.jsName] = ^() {
                    NSArray* args = [JSContext currentArguments];
                    if (object.invokeBlock) {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            object.invokeBlock(name, args, self, self.urlPath);
                        });
                    }
                };
            }];
        });
        
    }
}



- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked
        || navigationType == UIWebViewNavigationTypeOther) {
        NSURL* url = request.URL;
        
        NSString* scheme        = url.scheme;
        NSString* host          = url.host;
        NSString* service       = url.path;
        NSString* paramStr      = url.query;
        
        

        if ([self.appSchemaObserver hasAppSchema:scheme]) {
            [[NVAppSchemaObserver sharedInstance] openURL:url];
        
            return NO;
        }

        
    }
    
    return YES;
}



@end



