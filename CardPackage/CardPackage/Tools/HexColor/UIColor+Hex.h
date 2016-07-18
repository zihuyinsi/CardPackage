//
//  UIColor+Hex.h
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(NSString *)hexColor;
+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(float)opacity;

@end
