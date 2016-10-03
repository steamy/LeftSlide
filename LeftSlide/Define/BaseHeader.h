//
//  BaseHeader.h
//  LeftSlide
//
//  Created by hiteam on 16/7/1.
//  Copyright © 2016年 steam. All rights reserved.
//

#ifndef BaseHeader_h
#define BaseHeader_h


/**
 *
 *16进制颜色定义
 * */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000)>>16))/255.0 green:((float)((rgbValue & 0xFF00)>>8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/**
 * 16进制颜色+透明度定义
 */
#define UIColorFromRGBAndAlpha(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define KScreenSize     [UIScreen mainScreen].bounds.size
#define KScreenWidth     [UIScreen mainScreen].bounds.size.width
#define KScreenHeight     [UIScreen mainScreen].bounds.size.height
#define KScreenUnit    ( [UIScreen mainScreen].bounds.size.width) / 720

#define KMainPageDistance 135 * KScreenUnit
#define KMainPageScale 0.8  //中央视图缩放比例饿
#define KMainPageCenter CGPointMake(KScreenWidth + KScreenWidth * KMainPageScale / 2.0 - KMainPageDistance, KScreenHeight / 2);

#define VClouldChaneDeckStateDistance (KScreenWidth - KMainPageDistance) / 2.0 - 40
#define VSpeedFloat 0.7

#define KLeftAlpha 0.9
#define KLeftCenterX 30 
#define KLeftScale 0.7

#define VDeckCanNoPanViewTag 344343

#endif /* BaseHeader_h */
