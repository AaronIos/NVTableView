//
//  NSString+Category.m
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>


#define LENGTH_VERIFY_CODE          6


@implementation NSString (Category)

- (BOOL) isValidMobileNumber {
    NSString* const MOBILE = @"^1(3|5|7|8)\\d{9}$";

    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidVerifyCode {
    
    NSString* const VERIFYCODE = [NSString stringWithFormat:@"^d{%d}$", LENGTH_VERIFY_CODE];
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", VERIFYCODE];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidBankCardNumber {
    NSString* const BANKCARD = @"^(\\d{15}|\\d{16}|\\d{17}|\\d{18}|\\d{19}|\\d{20})$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", BANKCARD];
    return [predicate evaluateWithObject:self];
}


+ (NSString*) stringFormatCurrencyWithDouble:(double)currency {
    NSString* value = [NSString stringWithFormat:@"%.02f", currency];
    
    NSMutableString* string     = [[NSMutableString alloc] init];
    [string appendString:[value substringFromIndex:[value length] - 3]];
    
    NSInteger index = [value length] - 6;
    while (index > 0) {
        NSString* subValue = [value substringWithRange:NSMakeRange(index, 3)];
        [string insertString:subValue atIndex:0];
        [string insertString:@"," atIndex:0];
        
        index -= 3;
    }
    
    if (index <= 0) {
        NSString* subValue = [value substringWithRange:NSMakeRange(0, 3 + index)];
        [string insertString:subValue atIndex:0];
    }
    
    return string;
}

+ (NSString*) stringFormatJPYCurrencyWithDouble:(double)currency {
    NSString* value = [NSString stringWithFormat:@"%.0f", currency];;
    
    
    NSMutableString* string     = [[NSMutableString alloc] init];
    
    NSInteger index = [value length] - 3;
    while (index > 0) {
        NSString* subValue = [value substringWithRange:NSMakeRange(index, 3)];
        [string insertString:subValue atIndex:0];
        [string insertString:@"," atIndex:0];
        
        index -= 3;
    }
    
    if (index <= 0) {
        NSString* subValue = [value substringWithRange:NSMakeRange(0, 3 + index)];
        [string insertString:subValue atIndex:0];
    }
    
    return string;
}


+ (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

- (NSString*) stringValue {
    return self;
}


//根据字符串的字体和size(此处size设置为字符串宽和MAXFLOAT)返回多行显示时的字符串size
- (CGSize)stringSizeWithFont:(UIFont *)font Size:(CGSize)size {
    
    CGSize resultSize;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
        //段落样式
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineBreakMode = NSLineBreakByWordWrapping;
        
        //字体大小，换行模式
        NSDictionary *attributes = @{NSFontAttributeName : font , NSParagraphStyleAttributeName : style};
        resultSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
        //计算正文的高度
        resultSize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    }
    return resultSize;
}



- (BOOL) isValidIdentityCard {
    NSString* const IDENTITY = @"^\\d{18,18}|\\d{15,15}|\\d{17,17}x)*$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDENTITY];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidChinese {
    NSString* const IDENTITY = @"^[\u4e00-\u9fa5]*$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDENTITY];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isName {
    NSString* const NAME = @"^[\u4e00-\u9fa5]*$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", NAME];
    return [predicate evaluateWithObject:self];
}

- (BOOL) isValidZip {
    NSString* const IDENTITY = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDENTITY];
    return [predicate evaluateWithObject:self];
}


- (BOOL) hasExistedSpace {
    return ([self rangeOfString:@" "].length > 0);
}

- (BOOL) isValidAmount {
    NSString* const IDENTITY = @"^(([1-9]\\d{0,9})|0)(\\.\\d{0,2})?$";
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IDENTITY];
    return [predicate evaluateWithObject:self];
}

+(BOOL)matches:(NSString*)setString andText:(NSString*)text{
    if(!text || [[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqual:@""]){
        return NO;
    }
    
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:setString] invertedSet];
    NSRange r = [text rangeOfCharacterFromSet:cs];
    if (r.location != NSNotFound) {
        return NO;
    }
    return YES;
}


+ (NSString*)stringFormatWithMobile:(NSString*)mobile {
    
    if (mobile.length > 10) {
        return [NSString stringWithFormat:@"%@ %@ %@",[mobile substringWithRange:NSMakeRange(0,3)],[mobile substringWithRange:NSMakeRange(3,4)],[mobile substringWithRange:NSMakeRange(7,4)]];
    } else {
        return mobile;
    }
    
}
@end



@implementation NSString (urlEncode)

- (NSString *)URLEncodedString {
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                            (CFStringRef)self,
                                            (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                            NULL,
                                            kCFStringEncodingUTF8));
    return encodedString;
}

@end



static char base64EncodingTable[64] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
};

@implementation NSString (Base64)

+ (NSString *)base64StringFromData:(NSData *)data length:(NSUInteger)length {
    unsigned long ixtext, lentext;
    long ctremaining;
    unsigned char input[3], output[4];
    short i, charsonline = 0, ctcopy;
    const unsigned char *raw;
    NSMutableString *result;
    
    lentext = [data length];
    if (lentext < 1) {
        return @"";
    }
    result = [NSMutableString stringWithCapacity: lentext];
    raw = [data bytes];
    ixtext = 0;
    
    while (true) {
        ctremaining = lentext - ixtext;
        if (ctremaining <= 0) {
            break;
        }
        for (i = 0; i < 3; i++) {
            unsigned long ix = ixtext + i;
            if (ix < lentext) {
                input[i] = raw[ix];
            }
            else {
                input[i] = 0;
            }
        }
        output[0] = (input[0] & 0xFC) >> 2;
        output[1] = ((input[0] & 0x03) << 4) | ((input[1] & 0xF0) >> 4);
        output[2] = ((input[1] & 0x0F) << 2) | ((input[2] & 0xC0) >> 6);
        output[3] = input[2] & 0x3F;
        ctcopy = 4;
        switch (ctremaining) {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }
        
        for (i = 0; i < ctcopy; i++) {
            [result appendString: [NSString stringWithFormat: @"%c", base64EncodingTable[output[i]]]];
        }
        
        for (i = ctcopy; i < 4; i++) {
            [result appendString: @"="];
        }
        
        ixtext += 3;
        charsonline += 4;
        
        if ((length > 0) && (charsonline >= length)) {
            charsonline = 0;
        }
    }     
    return result;
}

@end


@implementation NSString (Format)

+ (NSString*) stringMobileFormat:(NSString *)mobile {
    if ([mobile isValidMobileNumber]) {
        NSMutableString* value = [[NSMutableString alloc] initWithString:mobile];
        [value insertString:@" " atIndex:3];
        [value insertString:@" " atIndex:8];
        return value;
    }
    
    return nil;
}


+ (NSString*) stringChineseFormat:(double)value{
    
    if (value / 100000000.0f >= 1) {
        return [NSString stringWithFormat:@"%.2f亿", value / 100000000.0f];
    }
    else if (value / 10000.0f >= 1 && value / 100000000.0f < 1) {
        return [NSString stringWithFormat:@"%.2f万", value / 10000.0f];
    }
    else {
        return [NSString stringWithFormat:@"%.2f", value];
    }

}


@end




@implementation NSString (MD5)

- (NSString*) md5String {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],result[4],result[5],
            result[6],result[7],result[8],result[9],result[10],result[11],
            result[12],result[13],result[14],result[15]];
}

@end




@implementation NSString (UrlParameters)

- (NSDictionary*) parameters {
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    NSArray* array          = [self componentsSeparatedByString:@"&"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray* keyValues  = [(NSString*)obj componentsSeparatedByString:@"="];
        [parameters setObject:keyValues[1] forKey:keyValues[0]];
        
    }];
    
    return parameters;
}

- (NSArray*) parametersSorted {
    NSMutableArray* parameters      = [NSMutableArray array];
    NSArray* array                  = [self componentsSeparatedByString:@"&"];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray* keyValues          = [(NSString*)obj componentsSeparatedByString:@"="];
        
        [parameters addObject:@{keyValues[0]: keyValues[1]}];
    }];
    
    return parameters;
}

@end




@implementation NSString (Date)
+ (NSString*) stringFromDate:(NSDate*)date {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString* string = [formatter stringFromDate:date];
    
    return string;
}

+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

@end




