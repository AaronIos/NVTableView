//
//  NVImageBrowserTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewLineCell.h"


@interface NVImageBrowserDataModel : NVDataModel
@property (nonatomic, retain) NSMutableArray* imageNameds;
@property (nonatomic, retain) NSMutableArray* titles;
@end



@protocol NVImageBrowserTableViewCellDelegate;

@interface NVImageBrowserTableViewCell : NVTableViewLineCell
@property (nonatomic, assign) id<NVImageBrowserTableViewCellDelegate> delegate;
@end

@protocol NVImageBrowserTableViewCellDelegate <NSObject>
- (void) imageBrowserTableViewCell:(NVImageBrowserTableViewCell*)cell didClickImagePath:(NSString*)imagePath;
@end


