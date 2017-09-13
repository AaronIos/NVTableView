//
//  NVHyperlinkTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVHyperlinkTableViewCell.h"


@implementation NVHyperlinkItemDataModel

@end


@implementation NVHyperlinkDataModel


@end


@interface NVHyperlinkTableViewCell ()
<NVHyperlinkLabelDelegate>
@property (nonatomic, strong) NVHyperlinkLabel* uiHyperlink;
@end


#define CELL_HEIGHT     (30.0f * displayScale)


@implementation NVHyperlinkTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _uiHyperlink = [[NVHyperlinkLabel alloc] initWithFrame:CGRectMake(10.0f, 0.0f, APPLICATIONWIDTH - 20.0f, CELL_HEIGHT)];
        [self.contentView addSubview:_uiHyperlink];
        _uiHyperlink.delegate = self;
        
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVHyperlinkDataModel* dataModel = (NVHyperlinkDataModel*)self.item;
    
    [_uiHyperlink clear];
    [dataModel.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NVHyperlinkItemDataModel* itemHyperlink = (NVHyperlinkItemDataModel*)obj;
        if ([itemHyperlink.urlPath length] == 0) {
            [_uiHyperlink addPlainText:itemHyperlink.text withTextColor:itemHyperlink.plainTextColor];
        } else {
            [_uiHyperlink addHyperlink:itemHyperlink.text withUrl:itemHyperlink.urlPath withColor:itemHyperlink.textColor];
        }
    }];
    
    self.uiHyperlink.textAlignment          = dataModel.textAlignment;
    self.uiHyperlink.textColor              = dataModel.textColor;
    self.delegate                           = dataModel.delegate;
}


#pragma mark - NVHyperlinkLabelDelegate
- (void) hyperlinkLabel:(NVHyperlinkLabel *)label touchUrl:(NSString *)urlPath {
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(hyperlinkTableViewCell:didClickUrlPath:)]) {
        [self.delegate hyperlinkTableViewCell:self didClickUrlPath:urlPath];
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}


@end

