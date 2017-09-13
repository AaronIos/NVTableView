//
//  NVIndexPathArray.h
//  NavyUIKit
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITableView.h>


@interface NVIndexPathArray : NSObject
@property (nonatomic, strong, readonly) NSMutableArray* arrayIndexPath;
@property (nonatomic, strong) NSMutableArray* item;
@property (nonatomic, strong) NSArray* arrayDataModels;

- (void) addObject:(id)object;
- (void) addObjects:(NSArray*)array;
- (void) addObjectsAtNewSection:(NSArray *)array;
- (void) addObjects:(NSArray *)array inSection:(NSInteger)section;

- (void) removeAllObjects;

- (NSUInteger) count;
- (NSUInteger) countAtSection:(NSInteger)section;

- (id) objectAtIndexPath:(NSIndexPath*)indexPath;
- (NSArray*) arrayInSection:(NSInteger)section;

@end


