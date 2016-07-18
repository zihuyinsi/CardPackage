//
//  MainMacro.h
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#ifndef MainMacro_h
#define MainMacro_h

#ifdef DEBUG
# define NSLog(fmt, ...) NSLog((@"\n[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" "~~~" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define NSLog(...);
#endif

#define ApplicationDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

// 设备大小
#define iPhoneWidth [UIScreen mainScreen].bounds.size.width
#define iPhoneHeight [UIScreen mainScreen].bounds.size.height

//比例
#define iPhoneScale [Tools gainScale]

//背景颜色
#define View_BgColor [UIColor colorWithHex: @"2a292f"]

//卡颜色
#define Card_BgColor [UIColor colorWithHex: @"101010"]
//卡号颜色
#define Card_Num_Color [UIColor colorWithHex: @"cccccc"]
//卡名颜色
#define Card_Name_Color [UIColor colorWithHex: @"cccccc"]
//卡地址颜色
#define Card_Address_Color [UIColor colorWithHex: @"cccccc"]

#endif /* MainMacro_h */
