//
//  NVBankcardNumberTextField.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVBankcardNumberTextField.h"
#import "NavyUIKit.h"



@implementation NVBankcardNumberTextField


- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.keyboardType           = UIKeyboardTypeNumberPad;
        self.defaultTextAttributes  = ATTR_DICTIONARY(COLOR_HM_ORANGE, 24.0f + fontScale);
    }
    
    return self;
}


- (NSDictionary*) attributedOfText {
    if (_attributedOfText == nil) {
        _attributedOfText    = ATTR_DICTIONARY(COLOR_HM_BLACK, 18.0f + fontScale);
    }
    
    return _attributedOfText;
}

- (NSDictionary*) attributedOfPlaceholder {
    if (_attributedOfPlaceholder == nil) {
        _attributedOfPlaceholder     = ATTR_DICTIONARY(COLOR_HM_GRAY, 14.0f + fontScale);
    }
    
    return _attributedOfPlaceholder;
}


- (void) setPlaceholder:(NSString *)placeholder {
    
    self.attributedPlaceholder      = [[NSAttributedString alloc] initWithString:placeholder
                                                                      attributes:self.attributedOfPlaceholder];
    
    
}

- (void) setText:(NSString *)text {
    
    self.attributedText             = [[NSAttributedString alloc] initWithString:text
                                                                      attributes:self.attributedOfText];
}

- (BOOL) canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(copy:) ||
        action == @selector(paste:) ||
        action == @selector(select:) ||
        action == @selector(selectAll:)) {
        return NO;
    }
    
    return [super canPerformAction:action withSender:sender];
}


@end


