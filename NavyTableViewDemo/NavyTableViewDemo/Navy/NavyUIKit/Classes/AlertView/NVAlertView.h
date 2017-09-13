//
//  NVAlertView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface NVAlertAction : NSObject
@property (nonatomic, strong) NSString* title;
+ (instancetype) actionWithTitle:(NSString *)title handler:(void (^)(NVAlertAction *action))handler;

@end



@interface NVAlertView : UIView
@property (nonatomic, readonly) NSArray<NVAlertAction *> *actions;

- (instancetype) initWithTitle:(NSString *)title
                       content:(NSString *)content;
- (instancetype) initWithTitle:(NSString *)title
                       url:(NSURL *)url;

- (void) addAction:(NVAlertAction*) action;

- (void) show;
- (void) hide;
@end




