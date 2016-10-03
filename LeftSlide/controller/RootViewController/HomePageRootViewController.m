//
//  HomePageRootViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/5.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "HomePageRootViewController.h"
#import "AppDelegate.h"

@interface HomePageRootViewController ()

@end

@implementation HomePageRootViewController

//当主页出现后打开，右滑打开抽屉手势
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setPanIsOpen:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//设置icon
-(void)addIcon{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 33, 33);
    button.layer.cornerRadius = 33/2;
    button.clipsToBounds = YES;
    [button setBackgroundImage:[UIImage imageNamed:@"IMG_0363"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(closeOrOpenLeftView) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = item;
}


//点击头像的事件
-(void)closeOrOpenLeftView{
    
    //取得app代理
    AppDelegate * appDelegate = (AppDelegate *)[ [UIApplication sharedApplication] delegate];
    
    if (appDelegate.leftSliderViewController.closed)
    {
        [appDelegate.leftSliderViewController openLeftView];
    }
    else
    {
        [appDelegate.leftSliderViewController closeLeftView];
    }
}


//右滑打开抽屉手势
-(void)setPanIsOpen:(BOOL)isOpen{
    AppDelegate * appDelagate = (AppDelegate *)[UIApplication sharedApplication].delegate ;
    [appDelagate.leftSliderViewController setPanEnabled:isOpen];
}

//当主页消失的时候关闭手势
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self setPanIsOpen:NO];
}

@end
