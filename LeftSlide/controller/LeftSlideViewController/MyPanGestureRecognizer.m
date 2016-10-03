//
//  MyPanGestureRecognizer.m
//  LeftSlide
//
//  Created by hiteam on 16/7/6.
//  Copyright © 2016年 steam. All rights reserved.
//

#import "MyPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
@implementation MyPanGestureRecognizer


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.inView];
    self.beginPoint = point;
    
}
-(instancetype)initWithTarget:(id)target action:(SEL)action inview:(UIView *)view{
    self = [super initWithTarget:target action:action];
    if (self) {
        self.inView = view;
    }
    return self;
}

@end
