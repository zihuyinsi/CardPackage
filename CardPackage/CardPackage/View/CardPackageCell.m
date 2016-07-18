//
//  CardPackageCell.m
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "CardPackageCell.h"
#import <Masonry.h>

@implementation CardPackageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        _bgView = [[UIView alloc] init];
        [_bgView setBackgroundColor: Card_BgColor];
        [self.contentView addSubview: _bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.mas_equalTo(self.contentView.mas_top).with.offset(5);
             make.left.mas_equalTo(self.contentView.mas_left).with.offset(10);
             make.right.mas_equalTo(self.contentView.mas_right).with.offset(-10);
             make.bottom.mas_equalTo(self.contentView.mas_bottom).with.offset(-5);
         }];
        
        //卡号
        _cardNum = [[UILabel alloc] init];
        [_cardNum setBackgroundColor: [UIColor clearColor]];
        [_cardNum setTextColor: Card_Num_Color];
        [_cardNum setFont: [UIFont systemFontOfSize: 15.f]];
        [_bgView addSubview: _cardNum];
        [_cardNum mas_makeConstraints:^(MASConstraintMaker *make)
         {
            make.top.mas_equalTo(_bgView.mas_top).with.offset(10);
            make.left.mas_equalTo(_bgView.mas_left).with.offset(10);
            make.right.mas_equalTo(_bgView.mas_right).with.offset(-10);
            make.height.mas_equalTo(35);
        }];
        
        //卡名
        _cardName = [[UILabel alloc] init];
        [_cardName setBackgroundColor: [UIColor clearColor]];
        [_cardName setTextColor: Card_Name_Color];
        CGFloat nameFontSize = 13.f * iPhoneScale;
        [_cardName setFont: [UIFont systemFontOfSize: nameFontSize]];
        [_bgView addSubview: _cardName];
        [_cardName mas_makeConstraints:^(MASConstraintMaker *make)
         {
            make.top.mas_equalTo(_cardNum.mas_top).with.offset(0);
            make.left.mas_equalTo(_bgView.mas_left).with.offset(10);
            make.right.mas_equalTo(_bgView.mas_right).with.offset(-10);
            make.height.mas_equalTo(30);
        }];
        
        //卡地址
        _cardAddress = [[UILabel alloc] init];
        [_cardAddress setBackgroundColor: [UIColor clearColor]];
        [_cardAddress setFont: [UIFont boldSystemFontOfSize: 13.f]];
        [_cardAddress setTextColor: Card_Address_Color];
        [_bgView addSubview: _cardAddress];
        [_cardAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_cardName.mas_bottom).with.offset(0);
            make.left.mas_equalTo(_bgView.mas_left).with.offset(10);
            make.right.mas_equalTo(_bgView.mas_right).with.offset(-10);
            make.height.mas_equalTo(30);
        }];
    }
    
    return self;
}

- (void) setCardInfo:(Card *)cardInfo
{
    _cardNum.text = cardInfo.cardNum;
    _cardName.text = cardInfo.shopName;
    _cardAddress.text = cardInfo.shopAddress;
}



@end
