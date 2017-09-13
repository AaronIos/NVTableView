//
//  TestViewController.m
//  NavyTableViewDemo
//
//  Created by Astraea尊 on 2017/9/13.
//  Copyright © 2017年 Astraea尊. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableViewDataConstructor.h"
#import "NVAnimationButtonTableViewCell.h"

@interface TestViewController ()
<NVAnimationButtonTableViewCellDelegate>

@property (nonatomic, strong) TestTableViewDataConstructor* dataConstructor;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title                  = @"TableView";
    self.view.backgroundColor   = COLOR_DEFAULT_WHITE;
}


- (void) constructData {
    if (_dataConstructor == nil) {
        _dataConstructor = [[TestTableViewDataConstructor alloc] init];
        _dataConstructor.viewControllerDelegate = self;
        
    }
    [self.dataConstructor constructData];
    self.adaptor.items = self.dataConstructor.items;
    [self.uiTableView reloadData];
}

#pragma mark - NVAnimationButtonTableViewCellDelegate
- (BOOL) willStartLoadingAtAnimationButtonTableViewCell:(NVAnimationButtonTableViewCell *)cell {
    
    return YES;
}

- (void) animationButtonTableViewCell:(NVAnimationButtonTableViewCell *)cell didChangeState:(NVAnimationButtonState)state {
    
    if (state == NVAnimationButtonStateLoading) {
        
        [cell startCompleteAnimation];
        
//        [cell startFailureAnimation];
        
    } else if (state == NVAnimationButtonStateComplete) {
        
    } else if (state == NVAnimationButtonStateFailure) {
        [cell restore];
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
