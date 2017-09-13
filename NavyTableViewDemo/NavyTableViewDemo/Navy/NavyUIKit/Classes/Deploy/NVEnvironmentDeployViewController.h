//
//  NVEnvironmentDeployViewController.h
//  Navy
//
//  Created by Astraea尊 on 16/01/10.
//  Copyright © 2016年 Astraea尊. All rights reserved.
//


#import "NVTableViewController.h"

@protocol NVEnvironmentDeployViewControllerDelegate;


@interface NVEnvironmentDeployViewController : NVTableViewController
@property (nonatomic, strong) NSString* typeOfSelection;
@property (nonatomic, assign) id<NVEnvironmentDeployViewControllerDelegate> delegate;
@property (nonatomic, strong) NSDictionary* environments;
@end


@protocol NVEnvironmentDeployViewControllerDelegate <NSObject>
- (void) environmentDeployViewController:(NVEnvironmentDeployViewController*)viewController didSelectEnvironment:(NSString*)environment;
@end

