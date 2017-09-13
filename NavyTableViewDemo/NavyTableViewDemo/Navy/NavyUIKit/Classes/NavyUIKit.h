//
//  NavyUIKit.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NVSingleton.h"
#import "NVViewController.h"
#import "NVGlassViewController.h"
#import "NVGlassMainViewController.h"
#import "NVTableViewController.h"
#import "NVTableViewDataConstructor.h"
#import "NVNetworkDataConstructor.h"
#import "NVTableViewNullCell.h"
#import "NVTableViewLineCell.h"
#import "NVTableViewCell.h"
#import "NVLabel.h"
#import "NVWebBrowserViewController.h"
#import "NSString+Category.h"
#import "UIView+Category.h"
#import "NVTableView+Category.h"
#import "UIViewController+Exception.h"
#import "UIColor+Category.h"
#import "NVTextField.h"
#import "Navy.h"

/*!
 常用字体Macro
 */
#define FONT_HEITI_LIGHT_SIZE(s)            [UIFont fontWithName:@"STHeitiSC-Light" size:s]
#define FONT_HEITI_LIGHT                    FONT_HEITI_LIGHT_SIZE(14.0f)
#define FONT_HEITI_SIZE(s)                  [UIFont fontWithName:@"STHeitiSC" size:s]
#define FONT_HEITI                          FONT_HEITI_SIZE(14.0f)
#define FONT_HEITI_MEDIUM_SIZE(s)           [UIFont fontWithName:@"STHeitiSC-MEDIUM" size:s]
#define FONT_HEITI_MEDIUM                   FONT_HEITI_MEDIUM_SIZE(14.0f)

#define FONT_HELVETICA_SIZE(s)              [UIFont fontWithName:@"Helvetica" size:s]
#define FONT_HELVETICA_BOLD_SIZE(s)         [UIFont fontWithName:@"Helvetica-Bold" size:s]

#define FONT_HELVETICA_NEUE_SIZE(s)                         [UIFont fontWithName:@"HelveticaNeue" size:s]
#define FONT_HELVETICA_NEUE_BOLD_SIZE(s)                    [UIFont fontWithName:@"HelveticaNeue-Bold" size:s]
#define FONT_HELVETICA_NEUE_LIGHT_SIZE(s)                   [UIFont fontWithName:@"HelveticaNeue-Light" size:s]
#define FONT_HELVETICA_NEUE_ULTRA_LIGHT_SIZE(s)             [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:s]

#define FONT_APPLE_GOTHIC_NEO_THIN_SIZE(s)                  [UIFont fontWithName:@"AppleSDGothicNeo-Thin" size:s]
#define FONT_BANK_CARD_NUMBER_SIZE(s)                       [UIFont fontWithName:@"Farrington-7B-Qiqi" size:s]


#define FONT_DIN_SIZE(s)                         [UIFont fontWithName:@"DIN-Regular" size:s]
#define FONT_DIN_BOLD_SIZE(s)                    [UIFont fontWithName:@"DIN-Bold" size:s]

#define FONT_DIN_MEDIUM_SIZE(s)                    [UIFont fontWithName:@"DIN-MediumAlternate" size:s]







#define FONT_LANTING_SIZE(s)                [UIFont fontWithName:@"Lantinghei SC" size:s]
#define FONT_HELVET_OTF_SIZE(s)             [UIFont fontWithName:@"HelveticaNeueLTW1G-Th" size:s]



#define FONT_SYSTEM_SIZE(s)                 [UIFont systemFontOfSize:s]
#define FONT_BOLD_SYSTEM_SIZE(s)            [UIFont boldSystemFontOfSize:s]


/*!
 常用颜色Macro
 */
#define COLOR_HM_BLACK                      [UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f]
#define COLOR_HM_LIGHT_BLACK                [UIColor colorWithRed:66.0f/255.0f green:66.0f/255.0f blue:66.0f/255.0f alpha:1.0f]
#define COLOR_HM_DARK_GRAY                  [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f]
#define COLOR_HM_GRAY                       [UIColor colorWithRed:159.0f/255.0f green:159.0f/255.0f blue:159.0f/255.0f alpha:1.0f]
#define COLOR_HM_LIGHT_GRAY                 [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f]
#define COLOR_HM_WHITE_GRAY                 [UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1.0f]

#define COLOR_HM_ORANGE                     [UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:51.0f/255.0f alpha:1.0f]
#define COLOR_HM_DRAK_ORANGE                [UIColor colorWithRed:255.0f/255.0f green:86.0f/255.0f blue:30.0f/255.0f alpha:1.0f]
#define COLOR_HM_LIGHT_ORANGE               [UIColor colorWithRed:232.0f/255.0f green:136.0f/255.0f blue:63.0f/255.0f alpha:0.8f]
#define COLOR_HM_BLUE                       [UIColor colorWithRed:77.0f/255.0f green:157.0f/255.0f blue:215.0f/255.0f alpha:1.0f]



#define COLOR_LINE                          [UIColor colorWithHex:0xcccccc]
#define COLOR_DEFAULT_WHITE                 [UIColor whiteColor]
#define COLOR_DEFAULT_BLACK                 [UIColor blackColor]
#define COLOR_SKY_BLUE                      [UIColor colorWithRed:76.0f/255.0f green:172.0f/255.0f blue:239.0f/255.0f alpha:0.8f]
#define COLOR_SKY_GRAY                      [UIColor colorWithRed:180.0f/255.0f green:180.0f/255.0f blue:180.0f/255.0f alpha:0.8f]


#define LINE_HEIGHT                         0.5f

#define ATTR_DICTIONARY(color, size)                    @{NSForegroundColorAttributeName : color, NSFontAttributeName : nvNormalFontWithSize(size)}

#define ATTR_DICTIONARY_BOLD(color, size)               @{NSForegroundColorAttributeName : color, NSFontAttributeName : nvNormalBoldFontWithSize(size)}

#define ATTR_DICTIONARY_NUMBER(color, size)             @{NSForegroundColorAttributeName : color, NSFontAttributeName : nvNumberFontWithSize(size)}


#define ATTR_DICTIONARY_NUMBER2(color, size)            @{NSForegroundColorAttributeName : color, NSFontAttributeName : FONT_HELVETICA_NEUE_LIGHT_SIZE(size)}


#define ATTR_DICTIONARY2(color, bg_color, size)         @{NSForegroundColorAttributeName : color, NSBackgroundColorAttributeName: bg_color, NSFontAttributeName : nvNormalFontWithSize(size)}
#define ATTR_DICTIONARY3(color, font)                   @{NSForegroundColorAttributeName : color, NSFontAttributeName : font}


#define APPLICATIONWIDTH                    [UIScreen mainScreen].bounds.size.width
#define APPLICATIONHEIGHT                   [UIScreen mainScreen].bounds.size.height
#define APPLICATIONFRAME                    [UIScreen mainScreen].applicationFrame
#define APPLICATIONBOUNDS                   [UIScreen mainScreen].bounds
#define NAVIGATIONBARBOUNDS                 (self.navigationController.navigationBar.bounds)
#define NAVIGATIONBARHEIGHT                 (NAVIGATIONBARBOUNDS.size.height)
#define TABBARHEIGHT                        (49.0f)
#define BASE_CELL_HEIGHT                    (55.f)
#define NAVIGATIONBARHEIGHT64               (64.f)

//#define nvNormalFontWithSize(size)          FONT_HELVETICA_NEUE_LIGHT_SIZE(size)
#define nvNormalFontWithSize(size)          FONT_HELVETICA_NEUE_LIGHT_SIZE(size)
#define nvNormalBoldFontWithSize(size)      FONT_HELVETICA_NEUE_BOLD_SIZE(size)

#define nvNumberBoldFontWithSize(size)      FONT_DIN_BOLD_SIZE(size)
#define nvNumberFontWithSize(size)          FONT_DIN_SIZE(size)
#define nvNuberFontMediumSize(size)         FONT_DIN_MEDIUM_SIZE(size)

UIFont* navigationTitleFont();
UIFont* navigationTitleFontWithSize(CGFloat size);



#define displayScale    (nativeScale() / 2)
#define fontScale       ((ceil(displayScale)-1)*2)

CGFloat nativeScale(void);

