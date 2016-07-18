//
//  AddCardView.m
//  CardPackage
//
//  Created by lv on 16/7/17.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "AddCardView.h"
#import <Masonry.h>

#define LabelHeight 20.f
#define FieldHeight 45.f

@implementation AddCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
        [self addCardViewInitialize];
    }
    
    return self;
}

- (void) addCardViewInitialize
{
    NSLog(@"iphoneScale , LabelHeight, FieldHeight = %.1f, %.1f, %.1f", iPhoneScale, LabelHeight, FieldHeight);
    
    CGFloat fontSize = 15.f * iPhoneScale;
    UIFont *font = [UIFont systemFontOfSize: fontSize];
    
    UILabel *numLabel = [[UILabel alloc] init];
    [numLabel setBackgroundColor: [UIColor clearColor]];
    [numLabel setTextColor: [UIColor colorWithHex: @"363636"]];
    [numLabel setFont: font];
    [numLabel setText: @"卡号"];
    [self addSubview: numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(self.mas_top).with.offset(10);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(LabelHeight*iPhoneScale);
     }];

    //卡号
    _numField = [[UITextField alloc] init];
    [_numField setBackgroundColor: [UIColor clearColor]];
    [_numField setTextColor: Card_Num_Color];
    [_numField setFont: font];
    _numField.placeholder = @"请输入卡号";
    [self addSubview: _numField];
    [_numField mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(numLabel.mas_bottom).with.offset(0);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(FieldHeight*iPhoneScale);
     }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    [nameLabel setBackgroundColor: [UIColor clearColor]];
    [nameLabel setTextColor: [UIColor colorWithHex: @"363636"]];
    [nameLabel setFont: font];
    [nameLabel setText: @"名称"];
    [self addSubview: nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(_numField.mas_bottom).with.offset(10);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(LabelHeight*iPhoneScale);
     }];
    
    //卡名
    _nameField = [[UITextField alloc] init];
    [_nameField setBackgroundColor: [UIColor clearColor]];
    [_nameField setTextColor: Card_Num_Color];
    _nameField.placeholder = @"对应商家名";
    [_nameField setFont: font];
    [self addSubview: _nameField];
    [_nameField mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(nameLabel.mas_bottom).with.offset(0);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(FieldHeight*iPhoneScale);
     }];
    
    
    UILabel *addressLabel = [[UILabel alloc] init];
    [addressLabel setBackgroundColor: [UIColor clearColor]];
    [addressLabel setTextColor: [UIColor colorWithHex: @"363636"]];
    [addressLabel setFont: font];
    [addressLabel setText: @"地址"];
    [self addSubview: addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(_nameField.mas_bottom).with.offset(10);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(LabelHeight*iPhoneScale);
     }];
    
    //卡地址
    _addressField = [[UITextField alloc] init];
    [_addressField setBackgroundColor: [UIColor clearColor]];
    [_addressField setTextColor: Card_Num_Color];
    _addressField.placeholder = @"商家地址";
    [_addressField setFont: font];
    [self addSubview: _addressField];
    [_addressField mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.mas_equalTo(addressLabel.mas_bottom).with.offset(0);
         make.left.mas_equalTo(self.mas_left).with.offset(10);
         make.right.mas_equalTo(self.mas_right).with.offset(-10);
         make.height.mas_equalTo(FieldHeight*iPhoneScale);
     }];
    
    //确定
    _confirmBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [_confirmBtn setBackgroundColor: [UIColor lightGrayColor]];
    [_confirmBtn setTitle: @"保存" forState: UIControlStateNormal];
    [self addSubview: _confirmBtn];
    [_confirmBtn mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.mas_equalTo(_addressField.mas_bottom).with.offset(15);
        make.left.mas_equalTo(self.mas_left).with.offset(10);
        make.right.mas_equalTo(self.mas_right).with.offset(-10);
        make.bottom.mas_equalTo(self.mas_bottom).with.offset(-10);
    }];
}


@end
