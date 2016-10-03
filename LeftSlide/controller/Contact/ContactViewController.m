//
//  ContactViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "ContactViewController.h"
#import "AppDelegate.h"
@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleWithTitle:@"联系人"];
    [self addIcon];
    //接收抽屉点击事件的HomePage1Push通知
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(pushViewControllerFromLeftView:) name:@"HomePage1Push" object:nil];
}

#pragma mark -- 抽屉界面转跳
-(void)pushViewControllerFromLeftView:(NSNotification *) notification{
    NSDictionary * dict  = notification.userInfo;
    UIViewController * pushViewController = [dict objectForKey:@"pushViewController"];
    self.hidesBottomBarWhenPushed = YES;
    
    //关闭抽屉
    AppDelegate * appDelegate  =(AppDelegate *) [UIApplication sharedApplication].delegate;
    [appDelegate.leftSliderViewController closeLeftView];
    
    [self.navigationController pushViewController:pushViewController animated:YES];
    
    self.hidesBottomBarWhenPushed = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
