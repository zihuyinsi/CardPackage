//
//  AddCardView.h
//  CardPackage
//
//  Created by lv on 16/7/17.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface AddCardView : UIView

@property (nonatomic, strong) UITextField *numField;
@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UITextField *addressField;

@property (nonatomic, strong) UIButton *confirmBtn;

@end
