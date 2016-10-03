//
//  RootViewController.h
//  LeftSlide
//
//  Created by hiteam on 16/7/4.
//  Copyright © 2016年 steam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController



//根据标题设置头部
-(void)addTitleWithTitle:(NSString *) title;

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
                 isLeft:   (BOOL) isLeft;
@end
