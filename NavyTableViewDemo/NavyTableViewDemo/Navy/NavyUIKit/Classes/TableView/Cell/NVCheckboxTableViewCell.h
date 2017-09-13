//
//  NVCheckboxTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewLineCell.h"
#import "NVHyperlinkTableViewCell.h"
#import "NVDataModel.h"


@interface NVCheckboxDataModel : NVDataModel
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIImage* imageNormal;
@property (nonatomic, strong) UIImage* imageSelected;
@end


@protocol NVCheckboxTableViewCellDelegate;

@interface NVCheckboxTableViewCell : NVTableViewLineCell
@property (nonatomic, assign) id<NVCheckboxTableViewCellDelegate> delegate;
@end


@interface NVCheckboxTableViewCell2 : NVCheckboxTableViewCell

@end



@protocol NVCheckboxTableViewCellDelegate <NSObject>
- (void) checkboxTableViewCell:(NVCheckboxTableViewCell*)cell didChangeCheckboxState:(BOOL)state;
@end




@protocol NVHyperlinkCheckboxTableViewCellDelegate;

@interface NVHyperlinkCheckboxDataModel : NVHyperlinkDataModel
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) UIImage* imageNormal;
@property (nonatomic, retain) UIImage* imageSelected;
@property (nonatomic, strong) UIFont*  font;

@end


@interface NVHyperlinkCheckboxTableViewCell : NVCheckboxTableViewCell2
@property (nonatomic, assign) id<NVHyperlinkCheckboxTableViewCellDelegate> delegate;
@end


@protocol NVHyperlinkCheckboxTableViewCellDelegate <NVCheckboxTableViewCellDelegate>
- (void) hyperlinkCheckboxTableViewCell:(NVHyperlinkCheckboxTableViewCell*)cell touchUrl:(NSString*)urlPath;
@end

