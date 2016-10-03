//
//  LeftTableView.m
//  LeftSlide
//
//  Created by hiteam on 16/7/5.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "LeftTableView.h"
#import "LeftHeaderTableView.h"

@interface LeftTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LeftTableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame] ;
    if (self) {
        self.delegate = self;
        self.dataSource = self;

        self.backgroundColor  = [UIColor whiteColor];
        [self addTableHeaderViewAndTableFooterView];
    }
    return self;
}
#pragma mark --加载View
-(void)addTableHeaderViewAndTableFooterView{
    LeftHeaderTableView * headerView = [[LeftHeaderTableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth - 75 , 444 * KScreenUnit)];
    [ headerView.myInformationButton addTarget:self action:@selector(buttonClickListener:) forControlEvents:UIControlEventTouchUpInside];
        self.tableHeaderView = headerView;
}



#pragma mark -- UITableViewDataSource
-(NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row==0) {
        cell.imageView.image=[UIImage imageNamed:@"sidebar_business"];
        cell.textLabel.text=@"我的商城";
    }else if (indexPath.row==1){
        cell.imageView.image=[UIImage imageNamed:@"sidebar_purse"];
        cell.textLabel.text=@"QQ钱包";
    }else if (indexPath.row==2){
        cell.imageView.image=[UIImage imageNamed:@"sidebar_decoration"];
        cell.textLabel.text=@"个性装扮";
    }else if (indexPath.row==3){
        cell.imageView.image=[UIImage imageNamed:@"sidebar_favorit"];
        cell.textLabel.text=@"我的收藏";
    }else if (indexPath.row==4){
        cell.imageView.image=[UIImage imageNamed:@"sidebar_album"];
        cell.textLabel.text=@"我的相册";
    }else{
        cell.imageView.image=[UIImage imageNamed:@"sidebar_file"];
        cell.textLabel.text=@"我的文件";
    }
    
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.selectedBackgroundView = [[UIImageView alloc] init];
    cell.selectedBackgroundView.backgroundColor = UIColorFromRGBAndAlpha(0xffffff, 0.3);
    //    点击cell时没有点击效果
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if ([self.clickDelegate respondsToSelector:@selector(tableView:clickedType:)]) {
        [self.clickDelegate tableView:self clickedType:indexPath.row + 4];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark --  所有button 的点击事件
-(void)buttonClickListener:(UIButton *)sender{
    if ([self.clickDelegate respondsToSelector:@selector(tableView:clickedType:)]) {
        [self.clickDelegate tableView:self clickedType:sender.tag];
    }
}
@end
