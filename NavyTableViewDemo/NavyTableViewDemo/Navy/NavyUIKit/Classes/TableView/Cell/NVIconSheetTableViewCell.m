//
//  NVIconSheetTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVIconSheetTableViewCell.h"
#import "NavyUIKit.h"


@implementation NVIconSheetDataModel

@end



@interface NVIconSheetTableViewCell ()
@property (nonatomic, strong) UIImageView* uiIconView;
@property (nonatomic, strong) UIImageView* uiHintImage;
@property (nonatomic, strong) CALayer*     liner;

@end


#define CELL_HEIGHT     50.f


@implementation NVIconSheetTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor        = COLOR_DEFAULT_WHITE;
        self.selectionStyle         = UITableViewCellSelectionStyleNone;
        
        self.uiIconView             = [[UIImageView alloc] initWithFrame:CGRectMake(15.0f,
                                                                                    (CELL_HEIGHT - 26.0f)/2,
                                                                                    26.0f,
                                                                                    26.0f)];
        [self.contentView addSubview:self.uiIconView];
        self.uiIconView.contentMode = UIViewContentModeScaleAspectFit;
        self.uiIconView.image       = [UIImage imageNamed:@"icon_info_manage.png"];
        
        
        CGRect frame                = _uiTitle.frame;
        frame.origin.x              = 39.0f + 10.0f;
        _uiTitle.frame              = frame;
        
        
        self.uiHintImage            = [[UIImageView alloc] initWithFrame:CGRectMake(100.f,
                                                                                    (CELL_HEIGHT - 20.0f)/2,
                                                                                    20.f,
                                                                                    20.f)];
        self.uiHintImage.hidden     = YES;
        [self.contentView addSubview:self.uiHintImage];
        
        self.liner = [CALayer layer];
        self.liner.frame = CGRectMake(15.f, CELL_HEIGHT - LINE_HEIGHT, APPLICATIONWIDTH - 30.f, LINE_HEIGHT);
        self.liner.backgroundColor = COLOR_LINE.CGColor;
        [self.layer addSublayer:self.liner];
    }
    
    return self;
}


- (void) setObject:(id)object {
    [super setObject:object];
    
    NVIconSheetDataModel* dataModel     = (NVIconSheetDataModel*)self.item;
    self.lineUpper.hidden               = YES;
    self.lineLower.hidden               = YES;
    
    if (dataModel.isBottom) {
        self.liner.hidden           = YES;
    }
    
    self.uiIconView.image               = [UIImage imageNamed:dataModel.imageNamed];
    
    if (dataModel.accountIcon == YES) {
        
        self.uiIconView.frame       = CGRectMake(13.0f,
                                                 (CELL_HEIGHT - 32.0f)/2,
                                                 32.0f,
                                                 32.0f);
        CGRect frame                = _uiTitle.frame;
        frame.origin.x              = 40.0f + 10.0f;
        _uiTitle.frame              = frame;
    }
    
    if (dataModel.showHint == YES) {
        self.uiHintImage.hidden     = NO;
        self.uiHintImage.image      = [UIImage imageNamed:dataModel.hintImageName];
        if ([dataModel.position isEqualToString:@"right"]) {
            CGSize size             = [self.uiValue.text boundingRectWithSize:CGSizeMake(100000, 100000)
                                                                      options: NSStringDrawingUsesLineFragmentOrigin
                                                                   attributes:ATTR_DICTIONARY(COLOR_DEFAULT_BLACK, 12.f + fontScale) context:nil].size;
            
            self.uiHintImage.frame  = CGRectMake(APPLICATIONWIDTH - size.width - 55.f,
                                                 (CELL_HEIGHT - 20.0f)/2,
                                                 20.f,
                                                 20.f);
        } else if ([dataModel.position isEqualToString:@"left"]) {
            self.uiHintImage.frame  = CGRectMake(70.f + 30 * displayScale,
                                                 (CELL_HEIGHT - 18.0f)/2,
                                                 35.f,
                                                 18.f);
        }
    } else {
        self.uiHintImage.hidden     = YES;
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

@end

