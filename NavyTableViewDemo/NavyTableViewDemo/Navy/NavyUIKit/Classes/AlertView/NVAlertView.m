//
//  NVAlertView.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVAlertView.h"
#import "NVBackgroundControl.h"
#import "NVButton.h"
#import "NavyUIKit.h"


@interface NVAlertAction ()
@property (nonatomic, copy) void(^handler)(NVAlertAction* action);
@end

@implementation NVAlertAction

+ (instancetype) actionWithTitle:(NSString *)title handler:(void(^)(NVAlertAction *))handler {
    NVAlertAction* action = [[NVAlertAction alloc] init];
    if (action) {
        action.title    = title;
        action.handler  = handler;
    }
    
    return action;
}


@end




@interface NVAlertView ()
<NVBackgroundControlDelegate>
@property (nonatomic, strong) NVLabel* uiTitle;
@property (nonatomic, strong) UIWebView* uiWebView;
@property (nonatomic, strong) UIView* uiActionView;
@property (nonatomic, strong) NSMutableArray* arrayActions;
- (void) updateActionsDisplay;
- (void) onClick:(id)sender;
@end



#define VIEW_WIDTH     (240.0f * displayScale)
#define VIEW_HEIGHT    (180.0f * displayScale)

@implementation NVAlertView
@synthesize actions = _actions;


- (instancetype) initWithTitle:(NSString *)title
                           url:(NSURL *)url {
    
    
    self = [super initWithFrame:CGRectMake((APPLICATIONWIDTH - VIEW_WIDTH)/2,
                                           (APPLICATIONHEIGHT - VIEW_HEIGHT)/2,
                                           VIEW_WIDTH,
                                           VIEW_HEIGHT)];
    if (self) {
        
        self.backgroundColor            = COLOR_HM_WHITE_GRAY;
        
        self.layer.cornerRadius         = 12.0f * displayScale;
        self.layer.borderColor          = COLOR_HM_GRAY.CGColor;
        self.layer.borderWidth          = 0.5f;
        self.clipsToBounds              = YES;
        
        
        self.uiTitle                    = [[NVLabel alloc] initWithFrame:CGRectMake(20.0f, 5.0f, VIEW_WIDTH - 40.0f, 20.0f)];
        [self addSubview:self.uiTitle];
        self.uiTitle.font               = nvNormalFontWithSize(16.0f + fontScale);
        self.uiTitle.textAlignment      = NSTextAlignmentCenter;
        self.uiTitle.textColor          = COLOR_HM_BLACK;
        self.uiTitle.text               = title;
        
        
        self.uiWebView                  = [[UIWebView alloc] initWithFrame:CGRectMake(10.0f,
                                                                                      30.0f,
                                                                                      VIEW_WIDTH - 20.0f,
                                                                                      VIEW_HEIGHT - 40.0f)];
        [self addSubview:self.uiWebView];
        self.uiWebView.backgroundColor  = COLOR_HM_WHITE_GRAY;

        if (url) {
            [self.uiWebView loadRequest:[NSURLRequest requestWithURL:url]];
        }
        
    }
    
    return self;
}

- (void) addAction:(NVAlertAction *)action {
    if (_arrayActions == nil) {
        _arrayActions = [[NSMutableArray alloc] init];
    }
    
    [self.arrayActions addObject:action];
}


- (void) show {
    
    [self updateActionsDisplay];
    
    UIWindow* window        = [UIApplication sharedApplication].delegate.window;
    
    CGRect bounds = window.bounds;
    NVBackgroundControl* bgControl  = [[NVBackgroundControl alloc] initWithFrame:CGRectMake(0.0f,
                                                                                            0.0f,
                                                                                            bounds.size.width,
                                                                                            bounds.size.height)];
    
    [window addSubview:bgControl];
    bgControl.delegate      = self;
    [bgControl addSubview:self];
    [bgControl show];
}

- (void) hide {
    NVBackgroundControl* bgControl = (NVBackgroundControl*)self.superview;
    if (bgControl) {
        [bgControl removeFromSuperview];
    }
}

- (void) onClick:(id)sender {
    NVButton* button    = (NVButton*)sender;
    NSInteger index     = button.tag;
    
    NVAlertAction* action   = [self.arrayActions objectAtIndex:index];
    if (action.handler) {
        action.handler(action);
    }
}


- (void) updateActionsDisplay {
    if ([self.arrayActions count] == 0) {
        return;
    }
    
    if (_uiActionView == nil) {
        _uiActionView       = [[UIView alloc] initWithFrame:CGRectMake(0.0f,
                                                                       VIEW_HEIGHT,
                                                                       VIEW_WIDTH,
                                                                       0.0f)];
        [self addSubview:_uiActionView];
    }
    
    for (id subview in _uiActionView.subviews) {
        if ([subview isKindOfClass:[UIView class]]) {
            [subview removeFromSuperview];
        } else if ([subview isKindOfClass:[CALayer class]]) {
            [subview removeFromSuperlayer];
        }
    }
    
    
    __block CGFloat x       = 0.0f;
    __block CGFloat y       = 0.0f;
    CGFloat const height    = 42.0f * displayScale;
    [self.arrayActions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NVAlertAction* action       = (NVAlertAction*)obj;
        
        
        CGFloat width       = VIEW_WIDTH;
        if ([self.arrayActions count] == 2) {
            width           = VIEW_WIDTH / 2;
        }
        
        NVButton* button            = [[NVButton alloc] initWithFrame:CGRectMake(x,
                                                                                 y,
                                                                                 width,
                                                                                 height)];
        [self.uiActionView addSubview:button];
        button.normalColor          = COLOR_HM_WHITE_GRAY;
        button.buttonStyle          = NVButtonStyleFilled;
        [button setTitle:action.title forState:UIControlStateNormal];
        [button setTitleColor:COLOR_HM_BLUE forState:UIControlStateNormal];
        button.titleLabel.font      = nvNormalFontWithSize(16.0f + fontScale);
        button.tag                  = idx;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CALayer* line               = [CALayer layer];
        [self.uiActionView.layer addSublayer:line];
        line.frame                  = CGRectMake(0.0f, y, VIEW_WIDTH, LINE_HEIGHT);
        line.backgroundColor        = COLOR_LINE.CGColor;
        
        
        if ([self.arrayActions count] == 2) {
            x += VIEW_WIDTH / 2;
            
            CALayer* line               = [CALayer layer];
            [self.uiActionView.layer addSublayer:line];
            line.frame                  = CGRectMake(VIEW_WIDTH/2, 0.0f, LINE_HEIGHT, VIEW_HEIGHT);
            line.backgroundColor        = COLOR_LINE.CGColor;
            
        } else {
            y += height;
            
        }
    }];
    
    
    CGRect frame                = self.uiActionView.frame;
    frame.size.height           = ([self.arrayActions count] == 2) ? height : y;
    self.uiActionView.frame     = frame;
}


- (void) layoutSubviews {
    [super layoutSubviews];

    CGRect frame                = self.frame;
    CGRect frameAction          = self.uiActionView.frame;
    frame.size.height           += frameAction.size.height;
    frame.origin.y              = (APPLICATIONHEIGHT - frame.size.height)/2;
    self.frame                  = frame;
}

#pragma mark - NVBackgroundControlDelegate
- (void) didTouchUpInsideOnBackgroundControl:(NVBackgroundControl *)control {
    
}

@end



