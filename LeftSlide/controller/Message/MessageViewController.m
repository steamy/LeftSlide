//
//  MessageViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "MessageViewController.h"
#import "OtherViewController.h"
#import "AppDelegate.h"

#import "MessageTableView.h"//消息列表
//菜单栏视图
#import "RightMenuPopoverViewController.h"
@interface MessageViewController ()<UITableViewDelegate,
                                                        UITableViewDataSource,
                                                        UIPopoverPresentationControllerDelegate>

@property(nonatomic,strong)MessageTableView  * tableView;
@end

@implementation MessageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addTitleWithTitle:@"消息"];
    [self addIcon];
    
    [self  addItemWithTitle:nil imageName:@"right_menu_nor" pressImageName:@"right_menu_pre" action:@selector(popToPopView) isLeft:NO];
    
    [self addTableView];
    
    //接收抽屉点击事件的HomePage0Push通知
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(pushViewControllerFromLeftView:) name:@"HomePage0Push" object:nil];
}

#pragma mark -- popTopresentView
-(void)popToPopView{
    RightMenuPopoverViewController * popoverViewController = [[RightMenuPopoverViewController alloc] init];
    popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
    popoverViewController.preferredContentSize = CGSizeMake( 400 , 400 );
    popoverViewController.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    popoverViewController.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    popoverViewController.popoverPresentationController.delegate = self;
    [self.view.window.rootViewController presentViewController:popoverViewController animated:YES completion:nil];
}
-(UIModalPresentationStyle )adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

#pragma mark -- 加载view
-(void)addTableView{
    self.tableView = [[MessageTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth,KScreenHeight - self.tabBarController.tabBar.frame.size.height)];
    
    [self.view addSubview:self.tableView];
    
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



-(void)tiao{
    
    self.hidesBottomBarWhenPushed = YES;
    OtherViewController * otherViewController = [[OtherViewController alloc] init];
//    [self.navigationController pushViewController:otherViewController animated:YES];
//
//    self.hidesBottomBarWhenPushed = NO;
    [self presentViewController:otherViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
