//
//  NVHyperlinkTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewNullCell.h"
#import "NVHyperlinkLabel.h"



@interface NVHyperlinkItemDataModel : NVDataModel
@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* urlPath;
@property (nonatomic, retain) UIColor*  textColor;
@property (nonatomic, retain) UIColor*  plainTextColor;
@end


@interface NVHyperlinkDataModel : NVListModel
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, strong) UIColor*        textColor;
@end




@protocol NVHyperlinkTableViewCellDelegate;


@interface NVHyperlinkTableViewCell : NVTableViewNullCell
@property (nonatomic, assign) id<NVHyperlinkTableViewCellDelegate> delegate;
@end


@protocol NVHyperlinkTableViewCellDelegate <NSObject>
- (void) hyperlinkTableViewCell:(NVHyperlinkTableViewCell*)cell didClickUrlPath:(NSString*)urlPath;
@end


