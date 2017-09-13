//
//  NVTitleTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTitleTableViewCell.h"
#import "NVLabel.h"


@implementation NVTitleDataModel

- (id) init {
    self = [super init];
    if (self) {
        self.fontSize       = 14.0f;
        self.textAlignment  = NSTextAlignmentCenter;
    }
    
    return self;
}

@end


@interface NVTitleTableViewCell ()

@end


#define CELL_HEIGHT         40.0f


@implementation NVTitleTableViewCell


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor            = [UIColor clearColor];
        self.selectionStyle             = UITableViewCellSelectionStyleNone;
        

        self.uiTitle                    = [[NVLabel alloc] initWithFrame:CGRectMake(15.0f,
                                                                                    10.0f,
                                                                                    APPLICATIONWIDTH - 30.0f,
                                                                                    CELL_HEIGHT - 20.0f)];
        [self.contentView addSubview:self.uiTitle];
        self.uiTitle.font               = nvNormalFontWithSize(14.0f);
        self.uiTitle.textAlignment      = NSTextAlignmentCenter;
        self.uiTitle.textColor          = COLOR_HM_LIGHT_BLACK;
        
        

        
    }
    
    return self;
}


- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVTitleDataModel* dataModel     = (NVTitleDataModel*)self.item;
    
    self.contentView.backgroundColor = dataModel.backgroundColor;
    
    self.uiTitle.textAlignment      = dataModel.textAlignment;
    if ([dataModel.title isKindOfClass:[NSString class]]) {
        self.uiTitle.text               = dataModel.title;
        if (dataModel.titleColor) {
            self.uiTitle.textColor      = dataModel.titleColor;
        }
        self.uiTitle.font               = nvNormalFontWithSize(dataModel.fontSize);
        self.uiTitle.numberOfLines      = 0;
        
        
        CGSize size = [self.uiTitle.text boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 30.0f, 1000000.0f)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:ATTR_DICTIONARY3(COLOR_HM_LIGHT_BLACK, self.uiTitle.font)
                                                      context:nil].size;
        
        CGRect frame            = self.uiTitle.frame;
        frame.size.height       = size.height;
        self.uiTitle.frame      = frame;
        
        NSMutableAttributedString * attributedString1   = [[NSMutableAttributedString alloc] initWithString:dataModel.title];
        NSMutableParagraphStyle * paragraphStyle1       = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        paragraphStyle1.alignment                       = NSTextAlignmentCenter;
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [dataModel.title length])];
        
    } else if ([dataModel.title isKindOfClass:[NSAttributedString class]]) {
        NSAttributedString* attributeString = dataModel.title;
        self.uiTitle.attributedText     = attributeString;
        
        CGSize size = [attributeString boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 30.0f, 1000000.0f)
                                                    options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                    context:nil].size;
        
        CGRect frame            = self.uiTitle.frame;
        frame.size.height       = size.height;
        self.uiTitle.frame      = frame;
        
        NSMutableAttributedString * attributedString1   = [[NSMutableAttributedString alloc] initWithAttributedString:attributeString];
        NSMutableParagraphStyle * paragraphStyle1       = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle1 setLineSpacing:5];
        paragraphStyle1.alignment                       = NSTextAlignmentCenter;
        [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, attributeString.length)];
    }
    
    dataModel.cellInstance      = self;
    
}

- (void) updateDisplay {
    [self setObject:self.item];
}


+ (CGFloat) tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    NVTitleDataModel* dataModel     = (NVTitleDataModel*)object;
    
    CGSize size;
    if ([dataModel.title isKindOfClass:[NSString class]]) {
        size = [dataModel.title boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 30.0f, 1000000.0f)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:ATTR_DICTIONARY(COLOR_HM_LIGHT_BLACK, dataModel.fontSize)
                                               context:nil].size;
        
    } else if ([dataModel.title isKindOfClass:[NSAttributedString class]]) {
        NSAttributedString* attributeString = dataModel.title;
        
        size = [attributeString boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 30.0f, 1000000.0f)
                                      options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                             context:nil].size;

    }
    
    
    return size.height + 20.0f;
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

@end

