//
//  NSString+Category.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

- (BOOL) isValidMobileNumber;
- (BOOL) isValidVerifyCode;
- (BOOL) isValidBankCardNumber;
- (BOOL) isValidIdentityCard;
- (BOOL) isValidChinese;
- (BOOL) isName;
- (BOOL) isValidZip;
- (BOOL) hasExistedSpace;
- (BOOL) isValidAmount;
+(BOOL)matches:(NSString*)setString andText:(NSString*)text;

+ (NSString*) stringFormatCurrencyWithDouble:(double)currency;
+ (NSString*) stringFormatJPYCurrencyWithDouble:(double)currency;

+ (BOOL)isBlankString:(NSString *)string;
- (NSString*) stringValue;

// 手机号344格式化输出
+ (NSString*)stringFormatWithMobile:(NSString*)mobile;

- (CGSize)stringSizeWithFont:(UIFont *)font Size:(CGSize)size;


@end


@interface NSString (urlEncode)
- (NSString *)URLEncodedString;
@end


@interface NSString (Base64)
+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length;
@end


@interface NSString (MD5)
- (NSString*) md5String;
@end


@interface NSString (Format)
+ (NSString*) stringMobileFormat:(NSString*)mobile;
+ (NSString*) stringChineseFormat:(double)value;

@end


@interface NSString (UrlParameters)
- (NSDictionary*) parameters;
- (NSArray*) parametersSorted;
@end


@interface NSString (Date)
+ (NSString*) stringFromDate:(NSDate*)date;
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;   //时间戳转换时间

@end





