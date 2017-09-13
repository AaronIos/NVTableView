//
//  NVWebView.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVWebView.h"
#import <WebKit/WebKit.h>


@interface NVWebView ()
<UIWebViewDelegate>
@end


@implementation NVWebView


- (id) initWithFrame:(CGRect)frame {
    Class wkWebViewClass = NSClassFromString(@"WKWebView");
//    if (wkWebViewClass) {
//        WKWebViewConfiguration* config = [[WKWebViewConfiguration alloc] init];
//        // ...
//        self = [[wkWebViewClass alloc] initWithFrame:frame
//                                                  configuration:config];
//
//    } else {
        self = [[UIWebView alloc] initWithFrame:frame];
        ((UIWebView*)self).scalesPageToFit = NO;
//    }
    
    return self;
}

- (void) loadRequest:(NSURLRequest *)request {
    [self loadRequest:request];
    
}

- (void) loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL {
    [self loadHTMLString:string baseURL:baseURL];
}


- (BOOL) canGoBack {
    return [self canGoBack];
}

- (BOOL) canGoForward {
    return [self canGoForward];
}

- (void) goBack {
    [self goBack];
}

- (void) goForward {
    [self goForward];
}

@end


