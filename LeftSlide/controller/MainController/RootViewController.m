//
//  RootViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "RootViewController.h"

#import "AppDelegate.h"

@interface RootViewController () <UIGestureRecognizerDelegate>

@end


@implementation RootViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:13/255.0 green:184/255.0 blue:246/255.0 alpha:1];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //设置右滑后退
    [self setInteractivePopGestureRecognizer];
}

-(void)setInteractivePopGestureRecognizer{
    //设置滑动
//    self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
     UIGestureRecognizer *gesture = self.navigationController.interactivePopGestureRecognizer;
    
    NSMutableArray *_targets = [gesture valueForKey:@"_targets"];
    //获取它的唯一对象 有一个叫UIGestureRecognizerTarget的私有类,有一个属性叫_target
    id gestureRecognizerTarget = [_targets firstObject];
    //获取_target:_UINavigationInteractiveTransition 有一个方法叫handleNavigationTranstion
    id navigationInteractiveTransition = [gestureRecognizerTarget valueForKey:@"_target"];
    //从控制台获取出他的方法签名
    SEL handelTransition = NSSelectorFromString(@"handleNavigationTransition:");
    //创建一个与系统一毛一样的手势 我们只把他的类改为UIPanGestureRecognizer
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]  initWithTarget:navigationInteractiveTransition action:handelTransition];
    
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;

}



//根据标题设置头部
-(void)addTitleWithTitle:(NSString *) title{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter ;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
}


/**
 *  设置item
 *
 *  @param title     item 的文字
 *  @param imageName item的图片
 *  @param action    点击事件
 *  @param isLeft    是否在左边，YES = 左边，NO= 右边
 */
-(void)addItemWithTitle:(NSString *) title
              imageName:(NSString *)imageName
             pressImageName:(NSString *)pressImageName
                 action:(SEL)action
                 isLeft:   (BOOL) isLeft{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imageName != nil && ![imageName isEqualToString:@""])
    {
        UIImage * image = [UIImage imageNamed:imageName];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [button setImage:image forState:UIControlStateNormal];
        if (pressImageName != nil && ![pressImageName isEqualToString:@""])
        {
            UIImage * pressImage = [UIImage imageNamed:pressImageName];
            pressImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            [button setImage:image forState:UIControlStateHighlighted];
        }
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -20)];
        if (isLeft)
        {
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, -27, 0, 0)]  ;
        }
    }
    
    [button setFrame:CGRectMake(0, 0, 45, 40)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (isLeft)
    {
        self.navigationItem.leftBarButtonItem = item;
    }
    else
    {
        self.navigationItem.rightBarButtonItem = item;
    }
  
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController && [self.navigationController.viewControllers count] == 1 )
    {
        return NO;
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
