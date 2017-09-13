//
//  NVTableViewDataConstructor.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NVDataModel.h"
#import "NVIndexPathArray.h"



@interface NVTableViewDataConstructor : NSObject
@property (nonatomic, strong) NVIndexPathArray * items;
@property (nonatomic, assign) NSInteger indexOfHighlight;
@property (nonatomic, assign) UIViewController* viewControllerDelegate;


- (void) constructData;
- (void) constructData:(void (^)(NSString *, NVDataModel *))reactBlock before:(void(^)(void))beforeBlock;

- (void) updateHighlightCell:(CGPoint)offset;
- (NVDataModel*) itemByCellType:(NSString*)cellType;
- (id) valueForCellType:(NSString*)cellType;

- (void) indexPathByCellType:(NSString*)cellType block:(void (^)(NSIndexPath* indexPath))block;

- (void) refreshValueForCellType:(NSString*)cellType;
- (void) refreshValueForCellType:(NSString *)cellType block:(void (^)(NVDataModel* item))block;

- (id)classConstructorCellName:(NSString *)classNmae
             ModelName:(NSString *)modelName
              cellType:(NSString *)cellType;

- (id)createNullCell;

@end



@interface NVTableViewDataConstructor (Index)
@property (nonatomic, strong) NSArray* arrayKeys;
- (void) constructIndex;
@end

