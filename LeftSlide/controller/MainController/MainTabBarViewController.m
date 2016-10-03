//
//  MainTabBarViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
//    self.nowViewController = [[UIViewController alloc] init];
    [self addTabBar];
}

#pragma mark -- addViews



/**
 *  加载tabbarView:消息、联系人，动态
 */
-(void)addTabBar{
    
 self.tabBar.tintColor=[UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    
    //加载tab
    MessageViewController * messageViewController = [[MessageViewController alloc] init];
    UINavigationController * messageNavgationController = [[UINavigationController alloc] initWithRootViewController:messageViewController];
    
    ContactViewController * contactViewController = [[ContactViewController alloc] init];
    UINavigationController * contractNavigationController = [[UINavigationController alloc] initWithRootViewController:contactViewController];
    
    DynamicViewController * dynamicViewController = [[DynamicViewController alloc] init];
    UINavigationController * dynamicNavigationController = [[UINavigationController alloc] initWithRootViewController:dynamicViewController];
    
    //设置tab的图标
    messageNavgationController.tabBarItem = [self getTabBarItemWithTitle:@"消息" andImageName:@"tab_buddy_"];
    contractNavigationController.tabBarItem = [self getTabBarItemWithTitle:@"联系人" andImageName:@"tab_qworld_"];
    dynamicNavigationController.tabBarItem = [self getTabBarItemWithTitle:@"动态" andImageName:@"tab_recent_"];
    
    
    self.viewControllers = @[messageNavgationController,contractNavigationController,dynamicNavigationController];
    
}
/**
 *  tabbraitem
 *
 *  @param title     item的文字
 *  @param imageName 图标的名字
 *
 *  @return item对象
 */
-(UITabBarItem * ) getTabBarItemWithTitle:(NSString *) title
                             andImageName:(NSString *) imageName{
    UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@nor",imageName]];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * imagePress = [UIImage imageNamed:[NSString stringWithFormat:@"%@press",imageName]];
    imagePress = [imagePress imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:imagePress];
    
    return item;
}

#pragma mark -- 抽屉栏页面转跳的通知
/**
 *  通知流程：
 *  1.在MainTabBarViewController，发送切换了tab的通知，通知名：MainTabChanged，内容selectedIndex
 *  2.在LeftTableViewController,中接受通知，接收selectedindex，
 *  3. 抽屉栏点击事件后需要跳转页面，关闭抽屉， 通过HomePage+index+push名通知主页push，内容需要push的vc。
 */
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    int index ;
    if ([item.title isEqualToString:@"消息"])
    {
        index = 0;
    }else if ([item.title isEqualToString:@"联系人"])
    {
        index = 1;
    }else if ( [item.title isEqualToString:@"动态"] )
    {
        index = 2;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"MainTabChanged" object:nil userInfo:@{@"selectedIndex":@(index)}];
}

-(void)dealloc{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
