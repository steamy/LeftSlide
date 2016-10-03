//
//  LeftTableViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "LeftTableViewController.h"
#import "AppDelegate.h"
#import "LeftTableView.h"

#import "OtherViewController.h"
#define tableViewWidth  kScreenWidth - kMainPageDistance

@interface LeftTableViewController ()<LeftTableViewClickDelegate>
@property(strong, nonatomic) LeftTableView *  tableView;
@property(strong ,nonatomic) UIViewController * nowMainViewController;


@property(assign , nonatomic) int homePageIndex;
@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nowMainViewController = [[UIViewController alloc] init];
    
    [self setBackGround];
    
    [self addTableView];
    
    //注册通知，用于接收主页Tab 的改变
   [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainTabChanged:) name:@"MainTabChanged"object:nil];
}

#pragma mark -- 加载View
//设置背景
-(void)setBackGround{
    self.view.backgroundColor =  [UIColor whiteColor];
    UIImageView * backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    backgroundImage.image = [UIImage imageNamed:@"IMG_0064"];
    [self.view addSubview:backgroundImage];
    
    UIImageView * mengban = [[UIImageView alloc] initWithFrame:self.view.frame];
    mengban.backgroundColor = UIColorFromRGBAndAlpha(0x000000, 1);
    mengban.alpha = 0.25;
    [self.view addSubview:mengban];
}
/**
 *  添加tableView
 */
-(void)addTableView{
    self.tableView = [[LeftTableView alloc] initWithFrame:CGRectMake(0, 0, tableViewWidth,kScreenHeight )];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.clickDelegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
}


#pragma mark -- LeftTableViewClickDelegate
-(void)tableView:(UITableView *)tableView clickedType:(ELeftClickType)clickType{
    UIViewController * viewController;
    switch (clickType) {
        case KMyInformation:
            viewController = [[OtherViewController alloc] init];
            break;
        case KQRCode:
            viewController = [[OtherViewController alloc] init];
            break;
        case KPersonalSignature:
            viewController = [[OtherViewController alloc] init];
            break;
        case KMyQQVip:
            viewController = [[OtherViewController alloc] init];
            break;
        case KQQWalte:
            viewController = [[OtherViewController alloc] init];
            break;
        case KPersonalDressing:
            viewController = [[OtherViewController alloc] init];
            break;
        case KMyLike:
            viewController = [[OtherViewController alloc] init];
            break;
        case KMyAlbum:
            viewController = [[OtherViewController alloc] init];
            break;
        case KMyFile:
            viewController = [[OtherViewController alloc] init];
            break;
        case KAppSeting:
            
            break;
        case KNightStyle:
            
            break;
        case KWeather:
            
            break;
        default:
            break;
    }
    [self notificationHomePagePushViewController:viewController];
}

#pragma mark -- 点击事件跳转
-(void)notificationHomePagePushViewController:(UIViewController *) viewController{

//[appDelegate.mainTabBarViewController.messageViewController.navigationController pushViewController:otherViewController animated:YES];
 //    3. 抽屉栏点击事件后需要跳转页面，关闭抽屉， 通过HomePage+index+push名通知主页push，内容需要push的vc。
    if (viewController)
    {
        NSString * postName = [NSString stringWithFormat:@"HomePage%dPush",self.homePageIndex];
        [[NSNotificationCenter defaultCenter] postNotificationName:postName object:nil userInfo:@{@"pushViewController":viewController}];
    }

}

#pragma make -- MainTabChanged通知事件
-(void)mainTabChanged:(NSNotification *) notification{
    NSDictionary * dict = notification.userInfo;
    self.homePageIndex = [dict[@"selectedIndex"] intValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter ] removeObserver:self];
}

@end
