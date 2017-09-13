//
//  NVSheetTableViewCell.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewLineCell.h"
#import "NVLabel.h"
#import "NVPlaceHolderTextView.h"

@class NVSheetDataModel;

typedef NS_ENUM(NSUInteger, NVSheetTableViewCellLineStyle) {
    NVSheetTableViewCellLineStyleDefault = 0, 
    NVSheetTableViewCellLineStyleLeftRight,  // 左右空隙
    NVSheetTableViewCellLineStyleLeft,       // 左空隙
    NVSheetTableViewCellLineStyleNone,       // 无
};


typedef NS_ENUM(NSUInteger, NVSheetTableViewCellStyle) {
    NVSheetTableViewCellStyleDefault,
    NVSheetTableViewCellStyleEdit,
    NVSheetTableViewCellStyleEdit2,
    NVSheetTableViewCellStyleTitle,
    NVSheetTableViewCellStyleEditButton,
    NVSheetTableViewCellStyleIndentation,
};


typedef NS_ENUM(NSUInteger, NVSheetTableViewKeyboardStyle) {
    NVSheetTableViewKeyboardStyleDefault = 0,
    NVSheetTableViewKeyboardStylePhone,
    NVSheetTableViewKeyboardStyleID,
    NVSheetTableViewKeyboardStyleBankcard,
};




#define CLS_SHEET_TABLE_VIEW_CELL       @"NVSheetTableViewCell"

@protocol NVSheetTableViewCellDelegate;

@interface NVSheetTableViewCell : NVTableViewLineCell {
    UIImageView* _uiBgView;
    NVLabel* _uiTitle;
}
@property (nonatomic, strong) NVSheetDataModel* item;
@property (nonatomic, assign) id<NVSheetTableViewCellDelegate> delegate;
- (void) shakeTextEditAnimation;
- (void) becomeFirstResponder;
- (void) resignFirstResponder;
- (void) setTextFieldValue:(id)text;
- (void) updateDisplay;
@end

@protocol NVSheetTableViewCellDelegate <NSObject>
- (void) sheetTableViewCell:(NVSheetTableViewCell*)cell didClickButton:(id)object;
- (void) sheetTableViewCell:(NVSheetTableViewCell *)cell textEditDidChangeValue:(NSString*)value;
- (void) sheetTableViewCell:(NVSheetTableViewCell *)cell textEditDidBeginEditing:(NSString*)value;
- (void) sheetTableViewCell:(NVSheetTableViewCell *)cell textEditDidEndEditing:(NSString *)value;
- (BOOL) sheetTableViewCell:(NVSheetTableViewCell *)cell textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end



@interface NVSheetDataModel : NVDataModel
@property (nonatomic, assign) NVSheetTableViewCellStyle cellStyle;
@property (nonatomic, strong) id title;
@property (nonatomic, strong) UIColor* titleColor;

@property (nonatomic, strong) NSString* placeHolder;
@property (nonatomic, strong) UIColor* placeHolderColor;

@property (nonatomic, strong) id value;
@property (nonatomic, strong) UIColor* valueColor;
@property (nonatomic, assign) NSTextAlignment valueAlignment;
@property (nonatomic, strong) UIFont* valueFont;

@property (nonatomic, assign) UIKeyboardType keyboradType;
@property (nonatomic, assign) BOOL secureTextEntry;
@property (nonatomic, assign) BOOL intro;
@property (nonatomic, strong) NSArray* arrayBgColor;

@property (nonatomic, assign) BOOL enable;

// 新增键盘输入分割格式
@property (nonatomic, assign) NVSheetTableViewKeyboardStyle keyboardStyle;

@property (nonatomic, assign) BOOL isShowLine;

@property (nonatomic, assign) NVSheetTableViewCellLineStyle lineStyle;

@end



#define CLS_ATTRIBUTE_STRING_SHEET_TABLE_VIEW_CELL      @"NVAttributeStringSheetTableViewCell"

@interface NVAttributeStringSheetTableViewCell : NVSheetTableViewCell

@end



#define CLS_INTRO_SHEET_TABLE_VIEW_CELL         @"NVIntroSheetTableViewCell"

@interface NVIntroSheetTableViewCell : NVSheetTableViewCell

@property (nonatomic, strong) NVLabel* uiValue;

@end



#define CLS_TEXT_VIEW_SHEET_TABLE_VIEW_CELL     @"NVTextViewSheetTableViewCell"

@interface NVTextViewSheetTableViewCell : NVSheetTableViewCell
<UITextViewDelegate>
@property (nonatomic, strong, readonly) NVPlaceHolderTextView* uiTextView;
@end


