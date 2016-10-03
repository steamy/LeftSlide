//
//  RightMenuPopoverViewController.m
//  LeftSlide
//
//  Created by hiteam on 16/7/7.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "RightMenuPopoverViewController.h"

#import "OtherViewController.h"

@class popoverModel;

@interface popoverModel : NSObject

@property(nonatomic, copy) NSString * text;
@property(nonatomic ,copy) NSString * imageName;

+(NSArray *)getArray;
@end


@interface RightMenuPopoverViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic, strong) NSArray * modelArray;

@end

@implementation RightMenuPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelArray = [popoverModel getArray ];
    
    [self addTableVIew];
}

#pragma mark -- 添加tableView
-(void)addTableVIew{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone  ;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 48;
    [self.view addSubview:self.tableView];
}

#pragma mark -- tableView.dataSource 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    popoverModel * model = self.modelArray[indexPath.row];
    NSString * imageName = model.imageName;
    cell.imageView.image = [UIImage imageNamed:imageName];
    cell.textLabel.text = model.text;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:26 * KScreenUnit ];
    if (indexPath.row<5) {
        UIImageView * line  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 46 , 136, 1)];
        line.backgroundColor = UIColorFromRGB(0xeeeeee);
        [cell.contentView addSubview:line];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    OtherViewController * otherViewController = [[OtherViewController   alloc] init];
  
    [self dismissViewControllerAnimated:YES completion:^{
          [ [NSNotificationCenter defaultCenter] postNotificationName:@"HomePage0Push" object:nil userInfo:@{@"pushViewController":otherViewController}];
    }];
}

//重置本控制器的大小
-(CGSize)preferredContentSize{
    
    if (self.popoverPresentationController != nil) {
        CGSize tempSize ;
        tempSize.height = 288 ;
        tempSize.width  = 136;
        CGSize size = [self.tableView sizeThatFits:tempSize];  //返回一个完美适应tableView的大小的 size
        return size;
    }else{
        return [super preferredContentSize];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end



@implementation popoverModel
+(NSArray *)getArray{
    NSMutableArray * mutableArray = [[NSMutableArray alloc] init];
    [mutableArray addObject:[self getModelWithText:@"多人聊天" imageName:@"right_menu_multichat"]];
      [mutableArray addObject:[self getModelWithText:@"加好友" imageName:@"right_menu_addFri"]];
      [mutableArray addObject:[self getModelWithText:@"扫一扫" imageName:@"right_menu_QR"]];
      [mutableArray addObject:[self getModelWithText:@"发送到电脑" imageName:@"right_menu_sendFile"]];
      [mutableArray addObject:[self getModelWithText:@"面对面快传" imageName:@"right_menu_facetoface"]];
      [mutableArray addObject:[self getModelWithText:@"付款" imageName:@"right_menu_payMoney"]];
    
    return mutableArray;
}
+(popoverModel *)getModelWithText:(NSString *)text imageName:(NSString *) imageName{
    popoverModel * model = [[popoverModel alloc] init];
    model.text = text;
    model.imageName = imageName;
    return model;
}
@end
