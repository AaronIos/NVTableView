//
//  NSData+Category.h
//  NavyCoreFoundation
//
//  Created by Astraea尊 on 15/11/16.
//  Copyright © 2015年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Base64)
+ (NSData *)base64DataFromString:(NSString *)string;
@end
