//
//  HomePageRootViewController.h
//  LeftSlide
//
//  Created by hiteam on 16/7/5.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "RootViewController.h"

@interface HomePageRootViewController : RootViewController
//设置icon
-(void)addIcon;

//右滑打开抽屉手势
-(void)setPanIsOpen:(BOOL)isOpen;
@end
