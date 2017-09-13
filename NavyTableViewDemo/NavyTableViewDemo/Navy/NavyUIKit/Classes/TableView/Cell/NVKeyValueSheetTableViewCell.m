//
//  NVKeyValueSheetTableViewCell.m
//  Haiyinhui
//
//  Created by Astraea尊 on 15/10/13.
//  Copyright © 2015年 Steven.Lin. All rights reserved.
//

#import "NVKeyValueSheetTableViewCell.h"
#import "NVSheetTableViewCell.h"

@interface NVKeyValueSheetTableViewCell ()

@property (nonatomic, strong) NVLabel* uiTitle;
@property (nonatomic, strong) NVLabel* uiContent;
@property (nonatomic, strong) CALayer* line;

@end


#define CELL_HEIGHT      BASE_CELL_HEIGHT


@implementation NVKeyValueSheetTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor    = COLOR_DEFAULT_WHITE;
        
        _uiTitle = [[NVLabel alloc] initWithFrame:CGRectMake(15.f,
                                                                     5.f,
                                                                     120 * displayScale,
                                                                     CELL_HEIGHT-10)];
        _uiTitle.text           = @"";
        _uiTitle.textAlignment  = NSTextAlignmentLeft;
        _uiTitle.textColor      = COLOR_HM_GRAY;
        _uiTitle.font           = nvNormalFontWithSize(16.f + fontScale);
        [self.contentView addSubview:_uiTitle];
        
        _uiContent = [[NVLabel alloc] initWithFrame:CGRectMake(APPLICATIONWIDTH / 2.f,
                                                               5.f,
                                                               APPLICATIONWIDTH / 2.f - 15.f,
                                                               CELL_HEIGHT-10)];
        _uiContent.text         = @"100.00元";
        _uiContent.textColor    = COLOR_HM_LIGHT_BLACK;
        _uiContent.font         = nvNormalFontWithSize(16.f + fontScale);
        _uiContent.textAlignment= NSTextAlignmentRight;
        [self.contentView addSubview:_uiContent];
        
        _line                    = [CALayer layer];
        [self.contentView.layer addSublayer:_line];
        
        _line.frame                          = CGRectMake(_uiTitle.frame.origin.x,
                                                          CELL_HEIGHT - LINE_HEIGHT,
                                                          APPLICATIONWIDTH - 50.f - 20.0f * displayScale,
                                                          LINE_HEIGHT);
        _line.backgroundColor                = COLOR_LINE.CGColor;
    }
    return self;
}


- (void)setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVSheetDataModel* dataModel = (NVSheetDataModel *)self.item;
    _uiTitle.text   = dataModel.title;
    _uiTitle.textColor = dataModel.titleColor;
    dataModel.cellInstance = self;
    
    if (dataModel.lineStyle == NVSheetTableViewCellLineStyleLeftRight) {
        
        self.line.frame = CGRectMake(_uiTitle.frame.origin.x, CELL_HEIGHT - LINE_HEIGHT, APPLICATIONWIDTH - _uiTitle.frame.origin.x * 2, LINE_HEIGHT);
        
    } else if (dataModel.lineStyle == NVSheetTableViewCellLineStyleLeft) {
        
        self.line.frame = CGRectMake(_uiTitle.frame.origin.x, CELL_HEIGHT - LINE_HEIGHT, APPLICATIONWIDTH - _uiTitle.frame.origin.x, LINE_HEIGHT);
        
    } else if (dataModel.lineStyle == NVSheetTableViewCellLineStyleNone) {
        
        self.line.hidden        = YES;
        
    } else {
        self.line.frame = CGRectMake(0.f, CELL_HEIGHT - LINE_HEIGHT, APPLICATIONWIDTH, LINE_HEIGHT);
    }
    
    if (dataModel.valueFont) {
        _uiTitle.font                   = dataModel.valueFont;
        self.uiContent.font               = dataModel.valueFont;
    }
    if ([dataModel.value isKindOfClass:[NSString class]]) {
        self.uiContent.textColor          = dataModel.valueColor;
        self.uiContent.text               = dataModel.value;
        
    } else if ([dataModel.value isKindOfClass:[NSAttributedString class]]) {
        self.uiContent.attributedText     = dataModel.value;
    }
}


+ (CGFloat)heightForCell {
    return CELL_HEIGHT;
}


@end
