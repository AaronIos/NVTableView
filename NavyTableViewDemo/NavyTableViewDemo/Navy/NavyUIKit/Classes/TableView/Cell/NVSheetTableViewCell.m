//
//  NVSheetTableViewCell.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVSheetTableViewCell.h"
#import "NVLabel.h"
#import "NVTextField.h"
#import "UIView+Category.h"
#import "NavyUIKit.h"







#define CELL_HEIGHT     BASE_CELL_HEIGHT

#define TAG_SHEET_CELL_FIELD            10001
#define TAG_SHEET_CELL_BUTTON           10002

#define ALPHANUM @"Xx0123456789"

NSInteger i   = 0;

@interface NVSheetTableViewCell ()
<UITextFieldDelegate>
- (void) buttonAction:(id)sender;
- (void) notifierDidChange:(NSNotification*)notification;
- (void) notifierDidBeginEditing:(NSNotification *)notification;
- (void) notifierDidEndEditing:(NSNotification *)notification;
@end


@implementation NVSheetTableViewCell

- (void) dealloc {
    _delegate = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notifierDidChange:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notifierDidBeginEditing:)
                                                     name:UITextFieldTextDidBeginEditingNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notifierDidEndEditing:)
                                                     name:UITextFieldTextDidEndEditingNotification
                                                   object:nil];
        
//        UIEdgeInsets insets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
        
        [self setBackgroundColor:COLOR_DEFAULT_WHITE];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        //        [self setSelectedBackgroundView:[[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, CELL_HEIGHT)] autorelease]];
        //        self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        
        
        _uiTitle = [[NVLabel alloc] initWithFrame:CGRectMake(15.0f, (CELL_HEIGHT - 20.0f)/2, 260.0f, 20.0f)];
        [self.contentView addSubview:_uiTitle];
        [_uiTitle setTextColor:[UIColor grayColor]];
        [_uiTitle setFont:nvNormalFontWithSize(16.0f + fontScale)];
        
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)self.item;
    dataModel.cellInstance      = self;
    
    if ([dataModel.title isKindOfClass:[NSString class]]) {
        _uiTitle.text   = dataModel.title;
    } else if ([dataModel.title isKindOfClass:[NSAttributedString class]]) {
        _uiTitle.attributedText = dataModel.title;
    }
    
    if (dataModel.titleColor) {
        [_uiTitle setTextColor:dataModel.titleColor];
    }
    
    
    switch (self.item.cellStyle) {
        case NVSheetTableViewCellStyleDefault:
            _uiTitle.font               = dataModel.valueFont;
            break;
        case NVSheetTableViewCellStyleEdit:
        case NVSheetTableViewCellStyleEdit2:
        {
            [self setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            _uiTitle.hidden = (self.item.cellStyle == NVSheetTableViewCellStyleEdit2);
            CGFloat x = (self.item.cellStyle == NVSheetTableViewCellStyleEdit2) ? 30.0f : 100.0f * displayScale;
            NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
            if (field == nil) {
                field = [[NVTextField alloc] initWithFrame:CGRectMake(x,
                                                                      (CELL_HEIGHT - 30.0f)/2,
                                                                      APPLICATIONWIDTH - 100 * displayScale - 15.f,
                                                                      30.0f)];
                [self.contentView addSubview:field];
                field.tag = TAG_SHEET_CELL_FIELD;
                
            }
            
            field.placeholder       = dataModel.placeHolder;
            field.placeHolderColor  = dataModel.placeHolderColor;
            field.textColor         = dataModel.valueColor;
            field.text              = dataModel.value;
            field.textAlignment     = dataModel.valueAlignment;
            field.font              = _uiTitle.font;
            field.keyboardType      = dataModel.keyboradType;
            field.tintColor         = dataModel.valueColor;
            field.delegate          = self;
            field.secureTextEntry   = dataModel.secureTextEntry;
            [field setEnabled:dataModel.enable];
            self.delegate           = dataModel.delegate;
            
            if (dataModel.valueFont) {
                field.font          = dataModel.valueFont;
                _uiTitle.font       = dataModel.valueFont;
            }
            
            break;
        }
        case NVSheetTableViewCellStyleEditButton:
        {
            _uiBgView.hidden = NO;
            
            NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
            if (field) {
                field = [[NVTextField alloc] initWithFrame:CGRectMake(80.0f, (CELL_HEIGHT - 30.0f)/2, 230.0f, 30.0f)];
                [self.contentView addSubview:field];
                field.tag = TAG_SHEET_CELL_FIELD;
            }
            
            field.placeholder       = dataModel.placeHolder;
            field.placeHolderColor  = dataModel.placeHolderColor;
            field.textColor         = dataModel.titleColor;
            field.font              = _uiTitle.font;
            field.keyboardType      = dataModel.keyboradType;
            field.tintColor         = dataModel.valueColor;
            
            UIButton* button = (UIButton*)[self.contentView viewWithTag:TAG_SHEET_CELL_BUTTON];
            if (button) {
                button = [[UIButton alloc] initWithFrame:CGRectMake(80.0f, (CELL_HEIGHT - 30.0f)/2, 230.0f, 30.0f)];
                [self.contentView addSubview:button];
                button.tag = TAG_SHEET_CELL_BUTTON;
                [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            self.delegate = dataModel.delegate;
            
            break;
        }
            
        case NVSheetTableViewCellStyleTitle:
        {
            
            _uiBgView.hidden = YES;
            _uiTitle.hidden = NO;
            [_uiTitle setTextAlignment:NSTextAlignmentCenter];
            [_uiTitle setTextColor:[UIColor grayColor]];
            
            NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
            if (field != nil) {
                [field removeFromSuperview];
            }
            
            break;
        }
            case NVSheetTableViewCellStyleIndentation:
        {
            
            [self setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            _uiTitle.hidden = (self.item.cellStyle == NVSheetTableViewCellStyleEdit2);

            CGFloat x = (self.item.cellStyle == NVSheetTableViewCellStyleEdit2) ? 30.0f : 100.0f * displayScale;
            NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
            if (field == nil) {
                field = [[NVTextField alloc] initWithFrame:CGRectMake(x,
                                                                      (CELL_HEIGHT - 30.0f)/2,
                                                                      APPLICATIONWIDTH - 100 * displayScale - 15.f,
                                                                      30.0f)];
                [self.contentView addSubview:field];
                field.tag = TAG_SHEET_CELL_FIELD;
                
            }
            
            field.placeholder       = dataModel.placeHolder;
            field.placeHolderColor  = dataModel.placeHolderColor;
            field.textColor         = dataModel.valueColor;
            field.text              = dataModel.value;
            field.textAlignment     = dataModel.valueAlignment;
            field.font              = _uiTitle.font;
            field.keyboardType      = dataModel.keyboradType;
            field.tintColor         = dataModel.valueColor;
            field.delegate          = self;
            field.secureTextEntry   = dataModel.secureTextEntry;
            [field setEnabled:dataModel.enable];
            self.delegate           = dataModel.delegate;
            
            if (dataModel.valueFont) {
                field.font          = dataModel.valueFont;
                _uiTitle.font       = dataModel.valueFont;
            }

           CGSize labelsize = [dataModel.title sizeWithFont:dataModel.valueFont constrainedToSize:CGSizeMake(1000, 0) lineBreakMode:NSLineBreakByCharWrapping];
            _uiTitle.frame = CGRectMake(_uiTitle.frame.origin.x, 0.f, labelsize.width + 10, dataModel.cellHeight.floatValue);
            
            x = CGRectGetMaxX(_uiTitle.frame) + 5;
            field.frame = CGRectMake(x,
                                     0,
                                     APPLICATIONWIDTH - x - 15.f,
                                     dataModel.cellHeight.floatValue-1);
            
            
          break;
        }
            
        default:
            break;
    }
}

- (void) notifierDidChange:(NSNotification *)notification {
    
    NVTextField* fieldNotification = (NVTextField*)notification.object;
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    
    if (field == fieldNotification) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textEditDidChangeValue:)]) {
            [self.delegate sheetTableViewCell:self textEditDidChangeValue:field.text];
        }
    }
}

- (void) notifierDidBeginEditing:(NSNotification *)notification {
    NVTextField* fieldNotification = (NVTextField*)notification.object;
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    
    if (field == fieldNotification) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textEditDidBeginEditing:)]) {
            [self.delegate sheetTableViewCell:self textEditDidBeginEditing:field.text];
        }
    }
}

- (void) notifierDidEndEditing:(NSNotification *)notification {
    NVTextField* fieldNotification = (NVTextField*)notification.object;
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    
    if (field == fieldNotification) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textEditDidEndEditing:)]) {
            [self.delegate sheetTableViewCell:self textEditDidEndEditing:field.text];
        }
    }
}


- (void) shakeTextEditAnimation {
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    if (field) {
        [field shakeAnimation];
    }
}

- (void) becomeFirstResponder {
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    if (field) {
        [field becomeFirstResponder];
    }
}

- (void) resignFirstResponder {
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    if (field) {
        [field resignFirstResponder];
    }
}

- (void) setTextFieldValue:(id)text {
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    if (field) {
        if ([text isKindOfClass:[NSString class]]) {
            field.text = text;
        } else if ([text isKindOfClass:[NSAttributedString class]]) {
            field.attributedText = text;
        }
    }
}

- (void) updateDisplay {
    [self setObject:self.item];
}

- (void) buttonAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:didClickButton:)]) {
        [self.delegate sheetTableViewCell:self didClickButton:sender];
    }
}


+ (CGFloat) heightForCell {
    return CELL_HEIGHT;
}

//+ (CGFloat) tableView:(UITableView *)tableView rowHeightForObject:(id)object {
//    return CELL_HEIGHT;
//}

+ (NSString*) cellIdentifier {
    return CLS_SHEET_TABLE_VIEW_CELL;
}

#pragma mark - UITextFieldDelegate

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)self.item;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textField:shouldChangeCharactersInRange:replacementString:)]) {
        
        if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleDefault) {
            return [self.delegate sheetTableViewCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStylePhone) {
            if (textField.text.length > i) {
                if (textField.text.length == 4 || textField.text.length == 9 ) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 13 ) {//输入完成
                    textField.text = [textField.text substringToIndex:13];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 4 || textField.text.length == 9) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            return [self.delegate sheetTableViewCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleBankcard) {
            
            if (textField.text.length > i) {
                if (textField.text.length == 5 || textField.text.length == 9 || textField.text.length == 13
                    || textField.text.length == 17 || textField.text.length == 21 || textField.text.length == 25) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 26 ) {//输入完成
                    textField.text = [textField.text substringToIndex:26];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 5 || textField.text.length == 9 || textField.text.length == 13
                    || textField.text.length == 17 || textField.text.length == 21 || textField.text.length == 25) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            
            return [self.delegate sheetTableViewCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleID) {
            
            if (textField.text.length > i) {
                if (textField.text.length == 7 || textField.text.length == 12 || textField.text.length == 17 ) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 21 ) {//输入完成
                    textField.text = [textField.text substringToIndex:21];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 7 || textField.text.length == 12 || textField.text.length == 17 ) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            
            return [self.delegate sheetTableViewCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        else {
            return [self.delegate sheetTableViewCell:self textField:textField shouldChangeCharactersInRange:range replacementString:string];
        }
        
    }
    else {
        if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleDefault) {
            return YES;
        }
        
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStylePhone) {
            if (textField.text.length > i) {
                if (textField.text.length == 4 || textField.text.length == 9 ) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 13 ) {//输入完成
                    textField.text = [textField.text substringToIndex:13];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 4 || textField.text.length == 9) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            return YES;
        }
        
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleBankcard) {
            
            if (textField.text.length > i) {
                if (textField.text.length == 5 || textField.text.length == 9 || textField.text.length == 13
                    || textField.text.length == 17 || textField.text.length == 21 || textField.text.length == 25) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 26 ) {//输入完成
                    textField.text = [textField.text substringToIndex:26];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 5 || textField.text.length == 9 || textField.text.length == 13
                    || textField.text.length == 17 || textField.text.length == 21 || textField.text.length == 25) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            
            return YES;
        }
        else if (dataModel.keyboardStyle == NVSheetTableViewKeyboardStyleID) {
            
            if (textField.text.length > i) {
                if (textField.text.length == 7 || textField.text.length == 12 || textField.text.length == 17 ) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 21 ) {//输入完成
                    textField.text = [textField.text substringToIndex:21];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 7 || textField.text.length == 12 || textField.text.length == 17 ) {
                    textField.text = [NSString stringWithFormat:@"%@",textField.text];
                    textField.text = [textField.text substringToIndex:(textField.text.length-1)];
                }
                i = textField.text.length;
            }
            
            NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
            NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            return [string isEqualToString:filtered];
        }
        else {
            return YES;
        }
    }
}


@end



@implementation NVAttributeStringSheetTableViewCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //        [self.lineLower removeFromSuperview];
        //        [self.lineUpper removeFromSuperview];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _uiTitle.numberOfLines = 0;
        _uiTitle.frame = CGRectMake(20.0f, 5.0f, APPLICATIONWIDTH - 20.0f, CELL_HEIGHT - 10.0f);
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)self.item;
    if ([dataModel.value isKindOfClass:[NSAttributedString class]]) {
        _uiTitle.attributedText = dataModel.value;
    }
    
    CGSize size = [dataModel.value boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 40.0f, 100000.0f)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                context:nil].size;
    CGRect frame = _uiTitle.frame;
    size.width = (size.width < APPLICATIONWIDTH - 40.0f) ? APPLICATIONWIDTH - 40.0f : size.width;
    frame.size = size;
    _uiTitle.frame = frame;
    
}

+ (CGFloat) tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)object;
    
    CGSize size = [dataModel.value boundingRectWithSize:CGSizeMake(APPLICATIONWIDTH - 40.0f, 100000.0f)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                                context:nil].size;
    
    return size.height + 20.0f;
}

+ (NSString*) cellIdentifier {
    return CLS_ATTRIBUTE_STRING_SHEET_TABLE_VIEW_CELL;
}

@end



@implementation NVSheetDataModel

- (id) init {
    self = [super init];
    if (self) {
        self.intro = YES;
        self.enable = YES;
    }
    
    return self;
}

@end



#import "NVGradientLayer.h"

@interface NVIntroSheetTableViewCell ()
@property (nonatomic, strong) NVGradientLayer* bgLayer;
@property (nonatomic, strong) UIImageView* introView;
@end


@implementation NVIntroSheetTableViewCell


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGRect frame = _uiTitle.frame;
        frame.origin.x = 15.0f;
        _uiTitle.frame = frame;
        
        UIImage* image = [UIImage imageNamed:@"towards_the_right"];
        CGSize size = image.size;
        self.introView = [[UIImageView alloc] initWithImage:image];
        [self.contentView addSubview:self.introView];
        self.introView.frame = CGRectMake(APPLICATIONWIDTH - size.width - 10.0f,
                                          (CELL_HEIGHT - size.height)/2,
                                          size.width,
                                          size.height);
        
        
        _uiValue        = [[NVLabel alloc] initWithFrame:CGRectMake(100.0f * displayScale,
                                                                    0.0f,
                                                                    APPLICATIONWIDTH - 100.0f * displayScale - size.width,
                                                                    CELL_HEIGHT)];
        [self.contentView addSubview:_uiValue];
        _uiValue.font   = _uiTitle.font;
        _uiValue.numberOfLines   = 0;
        
        _bgLayer = [[NVGradientLayer alloc] init];
        _bgLayer.frame = CGRectMake(0.0f, 0.0f, APPLICATIONWIDTH, CELL_HEIGHT);
        [self.layer insertSublayer:_bgLayer atIndex:0];
        
    }
    
    return self;
}

- (void) setObject:(id)object {
    [super setObject:object];
    
    if (self.item.arrayBgColor != nil) {
        [_bgLayer removeColors];
        for (UIColor* color in self.item.arrayBgColor) {
            [_bgLayer addColor:color];
        }
        [_bgLayer setNeedsDisplay];
    }
    
    NVSheetDataModel* dataModel     = (NVSheetDataModel*)self.item;
    dataModel.cellInstance          = self;
    if (dataModel.valueFont) {
        _uiTitle.font                   = dataModel.valueFont;
        self.uiValue.font               = dataModel.valueFont;
    }
    if ([dataModel.value isKindOfClass:[NSString class]]) {
        self.uiValue.textColor          = dataModel.valueColor;
        self.uiValue.text               = dataModel.value;
        self.uiValue.textAlignment      = dataModel.valueAlignment;

    } else if ([dataModel.value isKindOfClass:[NSAttributedString class]]) {
        self.uiValue.attributedText     = dataModel.value;
        self.uiValue.textAlignment      = dataModel.valueAlignment;
    }
    
    CGRect frame   = _uiTitle.frame;
    _uiTitle.frame = CGRectMake(frame.origin.x,
                                frame.origin.y,
                                frame.size.width,
                                dataModel.cellHeight.floatValue - 2*frame.origin.y);
    
    self.introView.hidden           = !dataModel.intro;
    if (dataModel.intro) {
        _uiValue.frame = CGRectMake(100 * displayScale,
                                    0.0f,
                                    APPLICATIONWIDTH - (100 * displayScale + 10.0f) - self.introView.frame.size.width,
                                    dataModel.cellHeight.floatValue);
        
        
    }else{
        
        _uiValue.frame = CGRectMake(100 * displayScale,
                                    0.0f,
                                    APPLICATIONWIDTH - (100 * displayScale + 15.0f),
                                    dataModel.cellHeight.floatValue);
        
    }
    
}

@end



#define CELL_TEXT_VIEW_HEIGHT       120.0f

@implementation NVTextViewSheetTableViewCell


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _uiTitle.hidden = YES;
        
        _uiTextView = [[NVPlaceHolderTextView alloc] initWithFrame:CGRectMake(20.0f, 10.0f, APPLICATIONWIDTH - 40.0f, CELL_TEXT_VIEW_HEIGHT - 20.0f)];
        [self.contentView addSubview:_uiTextView];
        [_uiTextView setFont:nvNormalFontWithSize(16.0f)];
        _uiTextView.delegate = self;
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
        self.item.cellInstance = self;
    }
    
    _uiTextView.placeHolder = self.item.placeHolder;
    self.delegate = self.item.delegate;
    
}

- (void) shakeTextEditAnimation {
    [_uiTextView shakeAnimation];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sheetTableViewCell:textEditDidChangeValue:)]) {
        [self.delegate sheetTableViewCell:self textEditDidChangeValue:textView.text];
    }
}

+ (CGFloat) tableView:(UITableView *)tableView rowHeightForObject:(id)object {
    return CELL_TEXT_VIEW_HEIGHT;
}

+ (CGFloat) heightForCell {
    return CELL_TEXT_VIEW_HEIGHT;
}

@end




