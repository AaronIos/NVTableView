//
//  NVCheckboxTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVCheckboxTableViewCell.h"
#import "NavyUIKit.h"


@implementation NVCheckboxDataModel



@end

@interface NVCheckboxTableViewCell ()
@property (nonatomic, strong) UIControl* controlBg;
@property (nonatomic, strong) UIImageView* uiImageView;
@property (nonatomic, strong) NVLabel* uiTitle;
- (void) onCheck:(id)sender;
@end


#define CELL_HEIGHT     (42.0f * displayScale)

@implementation NVCheckboxTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor    = COLOR_DEFAULT_WHITE;
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
        
        _uiImageView        = [[UIImageView alloc] initWithFrame:CGRectMake(30.0f, (CELL_HEIGHT - 19.0f)/2, 19.0f, 19.0f)];
        [self.contentView addSubview:_uiImageView];
        [_uiImageView setImage:[UIImage imageNamed:@"icon_checkbox_normal.png"]];
        
        
        _uiTitle            = [[NVLabel alloc] initWithFrame:CGRectMake(50.0f, (CELL_HEIGHT - 20.0f)/2, APPLICATIONWIDTH, 20.0f)];
        [self.contentView addSubview:_uiTitle];
        [_uiTitle setTextColor:COLOR_HM_DARK_GRAY];
        [_uiTitle setFont:nvNormalFontWithSize(14.0f)];
        [_uiTitle setText:@"使用账户余额进行支付:"];
        
        _controlBg          = [[UIControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, APPLICATIONWIDTH, CELL_HEIGHT)];
        [self.contentView addSubview:_controlBg];
        [_controlBg addTarget:self action:@selector(onCheck:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVCheckboxDataModel* dataModel = (NVCheckboxDataModel*)self.item;
    
    [_uiTitle setText:dataModel.title];
    
    if (!dataModel.selected && dataModel.imageNormal) {
        [_uiImageView setImage:dataModel.imageNormal];
    } else if (dataModel.selected && dataModel.imageSelected) {
        [_uiImageView setImage:dataModel.imageSelected];
    }
    
    self.delegate = dataModel.delegate;
}

- (void) onCheck:(id)sender {
    NVCheckboxDataModel* dataModel = (NVCheckboxDataModel*)self.item;
    dataModel.selected = !dataModel.selected;
    
    if (!dataModel.selected && dataModel.imageNormal) {
        [_uiImageView setImage:dataModel.imageNormal];
    } else if (dataModel.selected && dataModel.imageSelected) {
        [_uiImageView setImage:dataModel.imageSelected];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(checkboxTableViewCell:didChangeCheckboxState:)]) {
        [self.delegate checkboxTableViewCell:self didChangeCheckboxState:dataModel.selected];
    }
}

+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

@end



#define CELL_HEIGHT2     (30.0f * displayScale)

@implementation NVCheckboxTableViewCell2

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor    = [UIColor clearColor];
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
        
        [self.lineLower removeFromSuperlayer];
        [self.lineUpper removeFromSuperlayer];
        
        self.uiImageView.frame  = CGRectMake(20.0f, (CELL_HEIGHT2 - 19.0f)/2, 19.0f, 19.0f);
        self.uiTitle.frame      = CGRectMake(40.0f, (CELL_HEIGHT2 - 20.0f)/2, APPLICATIONWIDTH, 20.0f);
        self.controlBg.frame    = CGRectMake(0.0f, 0.0f, APPLICATIONWIDTH/2, CELL_HEIGHT2);
    }
    
    return self;
}

+ (CGFloat) heightForCell {
    return CELL_HEIGHT2;
}

@end


@implementation NVHyperlinkCheckboxDataModel

@end



@interface NVHyperlinkCheckboxTableViewCell ()
<NVHyperlinkLabelDelegate>
@property (nonatomic, strong) NVHyperlinkLabel* uiHyperlink;
@end

@implementation NVHyperlinkCheckboxTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.controlBg.frame    = CGRectMake(30.0f, (CELL_HEIGHT2 - 20.0f)/2, 20.0f, 20.0f);
        
        self.uiHyperlink = [[NVHyperlinkLabel alloc] initWithFrame:CGRectMake(55.0f, 0.0f, APPLICATIONWIDTH - 45.0f, CELL_HEIGHT2)];
        [self.contentView addSubview:self.uiHyperlink];
        self.uiHyperlink.delegate = self;
        
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

- (void) setObject:(id)object {
    [super setObject:object];
    
    NVHyperlinkCheckboxDataModel* dataModel = (NVHyperlinkCheckboxDataModel*)self.item;
    
    [_uiHyperlink clear];
    [dataModel.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NVHyperlinkItemDataModel* itemHyperlink = (NVHyperlinkItemDataModel*)obj;
        if ([itemHyperlink.urlPath length] == 0) {
            [_uiHyperlink addPlainText:itemHyperlink.text withTextColor:itemHyperlink.textColor];
            
        } else {
            [_uiHyperlink addHyperlink:itemHyperlink.text withUrl:itemHyperlink.urlPath withColor:itemHyperlink.textColor];
        }
    }];
    if (dataModel.font) {
        _uiHyperlink.font   = dataModel.font;
    }
}

#pragma mark - NVHyperlinkLabelDelegate
- (void) hyperlinkLabel:(NVHyperlinkLabel *)label touchUrl:(NSString *)urlPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(hyperlinkCheckboxTableViewCell:touchUrl:)]) {
        [self.delegate hyperlinkCheckboxTableViewCell:self
                                             touchUrl:urlPath];
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT2;
}

@end

