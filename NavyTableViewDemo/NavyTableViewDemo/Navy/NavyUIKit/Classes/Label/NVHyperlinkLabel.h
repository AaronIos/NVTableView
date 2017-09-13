//
//  NVHyperlinkLabel.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVLabel.h"


@protocol NVHyperlinkLabelDelegate;


@interface NVHyperlinkLabel : NVLabel
@property (nonatomic, strong) NSMutableArray* array;
@property (nonatomic, assign) id<NVHyperlinkLabelDelegate> delegate;
- (void) clear;
- (void) addPlainText:(NSString *)plainText withTextColor:(UIColor *)color;
- (void) addHyperlink:(NSString *)hyperlink withUrl:(NSString*)urlPath withColor:(UIColor *)color;
@end


@protocol NVHyperlinkLabelDelegate <NSObject>
- (void) hyperlinkLabel:(NVHyperlinkLabel*)label touchUrl:(NSString*)urlPath;
@end



