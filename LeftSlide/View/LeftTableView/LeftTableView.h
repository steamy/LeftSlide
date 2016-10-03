//
//  LeftTableView.h
//  LeftSlide
//
//  Created by hiteam on 16/7/5.
//  Copyright © 2016年 steam. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    KMyInformation = 1,
    KQRCode,
    KPersonalSignature,
    KMyQQVip,
    KQQWalte,
    KPersonalDressing,
    KMyLike,
    KMyAlbum,
    KMyFile,
//    KMyBusinessCards,
    KAppSeting,
    KNightStyle,
    KWeather,
} ELeftClickType;

@protocol LeftTableViewClickDelegate <NSObject>
-(void)tableView:(UITableView *) tableView clickedType:(ELeftClickType) clickType;
@end

@interface LeftTableView : UITableView
@property(nonatomic,assign)id<LeftTableViewClickDelegate>clickDelegate;
@end
