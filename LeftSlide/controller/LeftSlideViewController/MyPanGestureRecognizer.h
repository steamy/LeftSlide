//
//  MyPanGestureRecognizer.h
//  LeftSlide
//
//  Created by hiteam on 16/7/6.
//  Copyright © 2016年 steam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPanGestureRecognizer : UIPanGestureRecognizer
@property(assign , nonatomic)CGPoint beginPoint;
@property(strong , nonatomic) UIView *  inView;

-(instancetype)initWithTarget:(id)target action:(SEL)action inview:(UIView *)view;
@end
