//
//  NVProgressTableViewCell.m
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/8/2.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVProgressTableViewCell.h"

@implementation NVProgressDataModel

@end



@interface NVProgressTableViewCell ()

@property (nonatomic, strong) UIProgressView* progressView;
@property (nonatomic, strong) UIImageView*    uiIcon;

@end


#define CELL_HEIGHT      50

@implementation NVProgressTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle     = UITableViewCellSelectionStyleNone;
    
        self.progressView       = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        self.progressView.frame = CGRectMake(15,
                                             (CELL_HEIGHT - 20) / 2 + 10,
                                             APPLICATIONWIDTH - 30,
                                             20);
        self.progressView.progressTintColor = [UIColor blueColor];
        CGAffineTransform transform         = CGAffineTransformMakeScale(1.0f, 2.0f);
        self.progressView.transform         = transform;//设定宽高
        self.progressView.contentMode       = UIViewContentModeScaleAspectFill;
        self.progressView.layer.cornerRadius= 1.0;
        self.progressView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.progressView];
        
        self.uiIcon             = [[UIImageView alloc] initWithFrame:CGRectMake(100.f,
                                                                               (CELL_HEIGHT - 15) / 2.f,
                                                                               18,
                                                                                18)];
        self.uiIcon.hidden      = YES;
        [self.contentView addSubview:self.uiIcon];
        
    }
    return self;
}

- (void)setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    NVProgressDataModel* dataModel  = (NVProgressDataModel *)self.item;
    self.backgroundColor            = dataModel.backgroundColor;
    self.progressView.progress      = dataModel.progressValue;
    
    if (dataModel.progressIconName.length > 0) {
        self.uiIcon.image           = [UIImage imageNamed:dataModel.progressIconName];
    }
    self.progressView.progressTintColor = dataModel.progressTintColor;
    self.progressView.trackTintColor    = dataModel.trackTintColor;
    
    if (dataModel.progressImage) {
        self.progressView.progressImage = dataModel.progressImage;
    }
    if (dataModel.progressIconName) {
        self.uiIcon.hidden              = NO;
        self.uiIcon.image               = [UIImage imageNamed:dataModel.progressIconName];
        self.uiIcon.frame               = CGRectMake(15 + dataModel.progressValue * self.progressView.frame.size.width - 9,
                                                     (CELL_HEIGHT - 15) / 2.f,
                                                     18,
                                                     18);
    }
}

+ (CGFloat)heightForCell {
    return CELL_HEIGHT;
}


@end
