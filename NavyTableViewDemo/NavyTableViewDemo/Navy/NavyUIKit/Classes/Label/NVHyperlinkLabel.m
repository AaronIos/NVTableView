//
//  NVHyperlinkLabel.m
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVHyperlinkLabel.h"
#import "NSMutableAttributedString+Category.h"
#import "NSDictionary+Category.h"
#import "NavyUIKit.h"


@implementation NVHyperlinkLabel


- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (NSMutableArray*) array {
    if (_array == nil) {
        _array = [[NSMutableArray alloc] init];
    }
    return _array;
}

- (void) clear {
    [self.array removeAllObjects];
    self.attributedText = nil;
}

- (void) addPlainText:(NSString *)plainText withTextColor:(UIColor *)color {
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attributeString appendString:plainText withAttributes:ATTR_DICTIONARY(color, 12.0f)];
    self.attributedText = attributeString;
}

- (void) addHyperlink:(NSString *)hyperlink withUrl:(NSString*)urlPath withColor:(UIColor *)color{
    NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    
    CGSize size = [attributeString boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH, 100000.0f)
                                                options:NSStringDrawingUsesFontLeading
                                                context:nil].size;
    
    NSRange range;
    range.location = size.width;
    
    [attributeString appendString:hyperlink withAttributes:ATTR_DICTIONARY(color, 12.0f)];
    self.attributedText = attributeString;
    
    size = [attributeString boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH, 100000.0f)
                                         options:NSStringDrawingUsesFontLeading
                                         context:nil].size;
    range.length = size.width - range.location;
    
    NSDictionary* dictionary = @{@"url": urlPath,
                                 @"range": [NSValue valueWithRange:range]};
    [self.array addObject:dictionary];
    

}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(hyperlinkLabel:touchUrl:)]) {
        CGPoint point = [[touches anyObject] locationInView:self];
        
        CGSize size = [self.attributedText  boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH, 100000.0f)
                                                         options:NSStringDrawingUsesFontLeading
                                                         context:nil].size;
        CGFloat delta = 0.0f;
        if (self.textAlignment == NSTextAlignmentRight) {
            delta = self.bounds.size.width - size.width;
        }
        
        [self.array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSDictionary* dictionary = (NSDictionary*)obj;
            NSRange range = [[dictionary nvObjectForKey:@"range"] rangeValue];
            
            if (point.x >= range.location + delta
                && point.x <= range.length + range.location + delta) {
                [self.delegate hyperlinkLabel:self touchUrl:[dictionary nvObjectForKey:@"url"]];
            }
        }];
    }
    
}


@end
