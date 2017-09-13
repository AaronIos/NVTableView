//
//  NVDatePickerView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol NVDatePickerViewDelegate;


@interface NVDatePickerView : UIView
@property (nonatomic, assign) id<NVDatePickerViewDelegate> delegate;
@property (nonatomic, strong) UIColor* colorToolbar;
@property (nonatomic, strong) NSDate* minimumDate;
@property (nonatomic, strong) NSDate* maximumDate;
- (void) show;
- (void) showInView:(UIView*)view;
- (void) hide;
@end



@protocol NVDatePickerViewDelegate <NSObject>
- (void) datePickerView:(NVDatePickerView*)pickerView didSelectDateTime:(NSString*)dateTime;
- (void) didDismissAtPickerView:(NVDatePickerView *)pickerView;
@end


