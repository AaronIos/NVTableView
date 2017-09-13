//
//  NVPickerView.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavyUIKit.h"


@interface NVPickerDataModel : NSObject
@property (nonatomic, strong) id title;
@property (nonatomic, strong) NSString* tag;
@end

@interface NVPickerListModel : NVListModel

@end



@protocol NVPickerViewDelegate;


@interface NVPickerView : UIView
@property (nonatomic, strong) NSArray* arrayPickerDataModel;
@property (nonatomic, assign) id<NVPickerViewDelegate> delegate;
@property (nonatomic, strong) UIColor* colorToolbar;
@property (nonatomic, strong) NSString* title;

- (void) show;
- (void) showInView:(UIView*)view;
- (void) hide;

@end


@protocol NVPickerViewDelegate <NSObject>
- (void) pickerView:(NVPickerView*)pickerView didSelectItems:(NVPickerListModel*)listModel;
- (void) didDismissAtPickerView:(NVPickerView *)pickerView;

@end


