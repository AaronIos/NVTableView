//
//  NVIconSheetTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NavyUIKit.h"
#import "NVSheetTableViewCell.h"


@interface NVIconSheetDataModel : NVSheetDataModel

@property (nonatomic, strong) NSString* imageNamed;
@property (nonatomic, assign) BOOL      accountIcon;
@property (nonatomic, assign) BOOL      isBottom;
@property (nonatomic, assign) BOOL      showHint; // 提示图片标记 yes显示 no 不显示
@property (nonatomic, strong) NSString* position; // 提示图片标记的前后位置
@property (nonatomic, strong) NSString* hintImageName;
@end


@interface NVIconSheetTableViewCell : NVIntroSheetTableViewCell

@end

