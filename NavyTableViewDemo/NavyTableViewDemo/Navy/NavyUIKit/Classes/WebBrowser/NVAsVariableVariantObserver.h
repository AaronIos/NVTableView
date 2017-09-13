//
//  NVAsVariableVariantObject.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NVSingleton.h"


UIKIT_EXTERN NSString* const kVVProductIdKeyName;
UIKIT_EXTERN NSString* const kVVUserIdKeyName;
UIKIT_EXTERN NSString* const kVVHoldIdKeyName;



@interface NVAsVariableVariantObserver : NSObject
DEF_SINGLETON(NVAsVariableVariantObserver)

- (void) addVariantName:(NSString*)variantName variantTag:(NSString*)variantTag;

- (NSString*) fillinWithSchemeUrl:(NSString*)schemeUrl
                      filledValue:(NSString*(^)(NSString* variantTag))filledValue;

@end
