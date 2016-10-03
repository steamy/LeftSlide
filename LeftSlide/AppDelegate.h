//
//  AppDelegate.h
//  LeftSlide
//
//  Created by hiteam on 16/7/1.
//  Copyright © 2016年 steam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LeftTableViewController.h"
#import "MainTabBarViewController.h"
#import "LeftSliderViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong ,nonatomic) LeftSliderViewController * leftSliderViewController;
@property(strong, nonatomic) LeftTableViewController * leftTabeViewController;
@property( strong , nonatomic ) MainTabBarViewController * mainTabBarViewController;
@end

