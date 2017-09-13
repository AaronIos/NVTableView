//
//  NVLineSheetTableViewCell.h
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/5/12.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVTableViewNullCell.h"
#import "NVSheetTableViewCell.h"



@interface NVLineSheetTableViewCell : NVTableViewNullCell {
    UIImageView* _uiBgView;
}
@property (nonatomic, assign) id<NVSheetTableViewCellDelegate> delegate;
@property (nonatomic, strong) NVSheetDataModel* item;

- (void) shakeTextEditAnimation;
- (void) becomeFirstResponder;
- (void) resignFirstResponder;
- (void) setTextFieldValue:(id)text;
- (void) updateDisplay;

@end


