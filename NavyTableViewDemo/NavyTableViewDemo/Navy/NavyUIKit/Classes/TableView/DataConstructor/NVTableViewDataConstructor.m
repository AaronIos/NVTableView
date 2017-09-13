//
//  NVTableViewDataConstructor.m
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import "NVTableViewDataConstructor.h"
#import "NVTableViewCell.h"
#import <objc/runtime.h>
#import "NVTableViewNullCell.h"

@implementation NVTableViewDataConstructor

- (id) init {
    self = [super init];
    if (self) {
        _indexOfHighlight = -1;
    }
    
    return self;
}

- (void) constructData {
    
}

- (void) updateHighlightCell:(CGPoint)offset {
    
}

- (NVDataModel*) itemByCellType:(NSString *)cellType {
    if ([cellType length] == 0) {
        return nil;
    }
    
    for (NSArray* array in self.items.arrayIndexPath) {
        for (NVDataModel* item in array) {
            if ([item.cellType isEqualToString:cellType]) {
                return item;
            }
        }
    }
    
    return nil;
}

- (void) indexPathByCellType:(NSString *)cellType block:(void (^)(NSIndexPath *))block {
    if ([cellType length] == 0) {
        return;
    }
    
    __block BOOL found = NO;
    [self.items.arrayIndexPath enumerateObjectsUsingBlock:^(id obj, NSUInteger section, BOOL *stop) {
        NSArray* array = (NSArray*)obj;
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger row, BOOL *stop) {
            NVDataModel* item = (NVDataModel*)obj;
            if ([item.cellType isEqualToString:cellType]) {
                
                if (block) {
                    block([NSIndexPath indexPathForRow:row inSection:section]);
                }
                found = YES;
            }
            *stop = found;
        }];
        *stop = found;
    }];
}


- (void) refreshValueForCellType:(NSString *)cellType {
    NVDataModel* item = [self itemByCellType:cellType];
    if (item == nil) {
        return;
    }
    
    NVTableViewCell* cellInstance = (NVTableViewCell*)item.cellInstance;
    [cellInstance setObject:item];
}

- (void) refreshValueForCellType:(NSString *)cellType block:(void (^)(NVDataModel *))block {
    NVDataModel* item = [self itemByCellType:cellType];
    if (item == nil) {
        return;
    }
    
    if (block) {
        block(item);
        
        NVTableViewCell* cellInstance = (NVTableViewCell*)item.cellInstance;
        [cellInstance setObject:item];
    }
}

- (id)createNullCell {
    NVDataModel* itemNull       = [[NVDataModel alloc] init];
    itemNull.cellClass          = [NVTableViewNullCell class];
    itemNull.cellType           = @"cell.type.null";
    itemNull.cellHeight         = [NSNumber numberWithFloat:10.0f];
    return itemNull;
}


- (id)classConstructorCellName:(NSString *)classNmae
             ModelName:(NSString *)modelName
              cellType:(NSString *)cellType {
    Class targetClass = NSClassFromString(modelName);
    if (!targetClass) {
        return nil;
    }
    id target = [[targetClass alloc] init];
    if (target) {
        Class cellNonaGeneralClass = NSClassFromString(classNmae);
        if (!cellNonaGeneralClass) {
            return target;
        }
        SEL selector = NSSelectorFromString(@"heightForCell");
        if ([(id)cellNonaGeneralClass respondsToSelector:selector]) {
            typedef CGFloat (* MethodType) (Class, SEL);
            MethodType imp = (MethodType)[cellNonaGeneralClass methodForSelector:selector];
            CGFloat height = imp(cellNonaGeneralClass, selector);
            [target setValue:@(height) forKey:@"cellHeight"];
            [target setValue:cellType forKey:@"cellType"];
            [target setValue:cellNonaGeneralClass forKey:@"cellClass"];
            [target setValue:self.viewControllerDelegate forKey:@"delegate"];
        }
    }
    
    return target;
}


#pragma mark - setter/getter
- (NVIndexPathArray *) items {
    if (_items == nil) {
        _items = [[NVIndexPathArray alloc] init];
    }
    return _items;
}



@end



static char kAdapterArrayKeysObjectKey;


@implementation NVTableViewDataConstructor (Index)
@dynamic arrayKeys;


- (NSArray*) arrayKeys {
    return (NSArray *)objc_getAssociatedObject(self, &kAdapterArrayKeysObjectKey);
}

- (void) setArrayKeys:(NSArray *)arrayKeys {
    objc_setAssociatedObject(self, &kAdapterArrayKeysObjectKey, arrayKeys, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void) constructIndex {
    
}

@end


