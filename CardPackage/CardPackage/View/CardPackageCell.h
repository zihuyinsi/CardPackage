//
//  CardPackageCell.h
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface CardPackageCell : UITableViewCell

@property (nonatomic, strong) Card *cardInfo;        //卡片信息

@property (nonatomic, strong) UIView *bgView;                       //背景
@property (nonatomic, strong) UILabel *cardNum;                     //卡号
@property (nonatomic, strong) UILabel *cardName;                    //卡片名（商家名）
@property (nonatomic, strong) UILabel *cardAddress;                 //卡片地址（商家地址）

//@property (nonatomic, strong) UIImage *logo;                        //卡片图标

@end
