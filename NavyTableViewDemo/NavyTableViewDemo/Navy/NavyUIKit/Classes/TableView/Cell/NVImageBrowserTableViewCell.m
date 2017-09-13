//
//  NVImageBrowserTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVImageBrowserTableViewCell.h"
#import "NVLabel.h"
#import "DBImageView.h"
#import "NavyUIKit.h"


@implementation NVImageBrowserDataModel


- (NSMutableArray*) imageNameds {
    if (_imageNameds == nil) {
        _imageNameds = [[NSMutableArray alloc] init];
    }
    return _imageNameds;
}

- (NSMutableArray*) titles {
    if (_titles == nil) {
        _titles = [[NSMutableArray alloc] init];
    }
    return _titles;
}

@end



@interface NVImageBrowserTableViewCell ()
@property (nonatomic, strong) UIScrollView* scrollView;
- (void) onTap:(UIGestureRecognizer*)recognizer;
@end


#define CELL_HEIGHT     (120.0f * nativeScale() / 2)

@implementation NVImageBrowserTableViewCell



- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor        = COLOR_DEFAULT_WHITE;
        self.selectionStyle         = UITableViewCellSelectionStyleNone;
        
        _scrollView                 = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, APPLICATIONWIDTH, CELL_HEIGHT)];
        [self.contentView addSubview:_scrollView];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVImageBrowserDataModel* dataModel = (NVImageBrowserDataModel*)self.item;
    
    self.delegate = dataModel.delegate;
    
    for (UIView* view in self.scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat spacing = 10.0f;
    CGFloat width = 120.0f;
    __block CGFloat x = 10.0f;
    [dataModel.imageNameds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString* imageNamed = (NSString*)obj;
        
        DBImageView* imageView = [[DBImageView alloc] initWithFrame:CGRectMake(x, spacing, width, CELL_HEIGHT - 40.0f)];
        [self.scrollView addSubview:imageView];
        [imageView setImageWithPath:imageNamed];

        
        UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        [imageView setUserInteractionEnabled:YES];
        [imageView addGestureRecognizer:tapRecognizer];
        
        
        NVLabel* label      = [[NVLabel alloc] initWithFrame:CGRectMake(x, CELL_HEIGHT - 30.0f, width, 20.0f)];
        [self.scrollView addSubview:label];
        label.font          = nvNormalFontWithSize(12.0f);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor     = COLOR_HM_LIGHT_BLACK;
        label.text          = dataModel.titles[idx];
        
        x += spacing + width;
    }];
    
    self.scrollView.contentSize = CGSizeMake([dataModel.imageNameds count] * (width + spacing) + spacing, CELL_HEIGHT);
}

- (void) onTap:(UIGestureRecognizer *)recognizer {
    DBImageView* imageView = (DBImageView*)recognizer.view;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageBrowserTableViewCell:didClickImagePath:)]) {
        [self.delegate imageBrowserTableViewCell:self didClickImagePath:imageView.remoteImage.imageURL.absoluteString];
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

@end
