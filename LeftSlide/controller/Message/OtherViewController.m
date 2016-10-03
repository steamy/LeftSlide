//
//  OtherViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addItemWithTitle:@"返回" imageName:nil pressImageName:nil action:@selector(popToViewController) isLeft:YES];
    [self addTitleWithTitle:@"other"];
    
//    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,500, 600)];
//    button.backgroundColor = [UIColor lightGrayColor];
//    [button addTarget:self action:@selector(pushOth) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
}
-(void)pushOth{
    OtherViewController * oth = [[OtherViewController alloc] init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:oth animated:YES];
    
}


-(void)popToViewController{
    [self.navigationController popViewControllerAnimated:YES];
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
