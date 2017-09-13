//
//  NVLineSheetTableViewCell.m
//  LBYunZhi
//
//  Created by Astraea尊 on 2017/5/12.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "NVLineSheetTableViewCell.h"

@interface NVLineSheetTableViewCell ()
<UITextFieldDelegate>
{
    NSInteger i;
}
@property (nonatomic, strong) CALayer*  partingLine;

- (void) buttonAction:(id)sender;
- (void) notifierDidChange:(NSNotification*)notification;
- (void) notifierDidBeginEditing:(NSNotification *)notification;
- (void) notifierDidEndEditing:(NSNotification *)notification;
@end


#define CELL_HEIGHT                     BASE_CELL_HEIGHT

#define TAG_SHEET_CELL_FIELD            10001
#define TAG_SHEET_CELL_BUTTON           10002

#define ALPHANUM @"Xx0123456789"

@implementation NVLineSheetTableViewCell

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
        
        
        
        [self setBackgroundColor:COLOR_DEFAULT_WHITE];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        self.partingLine        = [CALayer new];
        self.partingLine.frame  = CGRectMake(15.f,
                                             CELL_HEIGHT - LINE_HEIGHT,
                                             APPLICATIONWIDTH - 15.f,
                                             LINE_HEIGHT);
        self.partingLine.backgroundColor = COLOR_LINE.CGColor;
        [self.contentView.layer addSublayer:self.partingLine];
        self.partingLine.hidden = YES;
      
    }
    
    return self;
}

- (void) setObject:(id)object {
    if (self.item != object && object != nil) {
        self.item = object;
    }
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)self.item;
    dataModel.cellInstance      = self;
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    if (field == nil) {
        field = [[NVTextField alloc] initWithFrame:CGRectMake(17,
                                                              (CELL_HEIGHT - 30.0f)/2,
                                                              APPLICATIONWIDTH - 35.f * displayScale,
                                                              30.0f)];
        [self.contentView addSubview:field];
        field.tag = TAG_SHEET_CELL_FIELD;
        
    }
    field.placeholder       = dataModel.placeHolder;
    field.placeHolderColor  = dataModel.placeHolderColor;
    field.textColor         = dataModel.valueColor;
    field.text              = dataModel.value;
    field.textAlignment     = dataModel.valueAlignment;
    field.font              = dataModel.valueFont;
    field.keyboardType      = dataModel.keyboradType;
    field.tintColor         = dataModel.valueColor;
    field.delegate          = self;
    field.secureTextEntry   = dataModel.secureTextEntry;
    [field setEnabled:dataModel.enable];
    field.clearButtonMode   = UITextFieldViewModeWhileEditing;
    self.delegate           = dataModel.delegate;
    self.partingLine.hidden = !dataModel.isShowLine;
}

- (void) notifierDidChange:(NSNotification *)notification {
    
    NVTextField* fieldNotification = (NVTextField*)notification.object;
    NVTextField* field = (NVTextField*)[self.contentView viewWithTag:TAG_SHEET_CELL_FIELD];
    
    NVSheetDataModel* dataModel = (NVSheetDataModel*)self.item;
    if ([dataModel.placeHolder isEqualToString:@"请输入姓名"]) {
        if (field == fieldNotification) {
            if (field.text.length > 20) {
                field.text = [field.text substringToIndex:20];
            }
        }
    }
    
    if ([dataModel.placeHolder isEqualToString:@"请输入身份证号"]) {
        if (field == fieldNotification) {
            if (field.text.length > 21) {
                field.text = [field.text substringToIndex:21];
            }
        }
    }
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
                if (textField.text.length == 5 || textField.text.length == 10 || textField.text.length == 15
                    || textField.text.length == 20 || textField.text.length == 25) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 26 ) {//输入完成
                    textField.text = [textField.text substringToIndex:26];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 5 || textField.text.length == 10 || textField.text.length == 15
                    || textField.text.length == 20 || textField.text.length == 25) {
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
                if (textField.text.length == 5 || textField.text.length == 10 || textField.text.length == 15
                    || textField.text.length == 20 || textField.text.length == 25) {//输入
                    NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                    [str insertString:@" " atIndex:(textField.text.length-1)];
                    textField.text = str;
                }if (textField.text.length >= 26 ) {//输入完成
                    textField.text = [textField.text substringToIndex:26];
                    [textField resignFirstResponder];
                }
                i = textField.text.length;
                
            }else if (textField.text.length < i){//删除
                if (textField.text.length == 5 || textField.text.length == 10 || textField.text.length == 15
                    || textField.text.length == 20 || textField.text.length == 25) {
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
