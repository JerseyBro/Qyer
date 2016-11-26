//
//  HeadCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/26.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "HeadCell.h"

@implementation HeadCell
-(UILabel *)enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self.contentView addSubview:_enname];
        _enname.textColor = [UIColor whiteColor];
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cnname.mas_bottom).offset(20);
            make.centerX.equalTo(0);
        }];
        
    }
    return _enname;
}
-(UILabel *)cnname
{
    if (!_cnname) {
        _cnname = [UILabel new];
        [self.contentView addSubview:_cnname];
        _cnname.textColor = [UIColor whiteColor];
        _cnname.font = [UIFont systemFontOfSize:20];
        _cnname.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [_cnname mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat hit = higt * 175 / 468;
            make.top.equalTo(hit);
            make.centerX.equalTo(0);
        }];
    }
    return _cnname;
}
-(UIButton *)tour
{
    if (!_tour) {
        _tour = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_tour];
        [_tour setImage:[UIImage imageNamed:@"想去normal"] forState:UIControlStateNormal];
         [_tour setImage:[UIImage imageNamed:@"已想去icon"] forState:UIControlStateHighlighted];
        [_tour setTitle:@"想去" forState:UIControlStateNormal];
        [_tour setTitle:@"已想去" forState:UIControlStateHighlighted];
        _tour.font = [UIFont systemFontOfSize:11];
        [_tour setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [_tour setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [_tour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.bottom.equalTo(-60);
        }];
    }
    return _tour;
}
-(UILabel *)info
{
    if (!_info) {
        _info = [UILabel new];
        [self.contentView addSubview:_info];
        _info.font = [UIFont systemFontOfSize:13];
        _info.backgroundColor = [UIColor whiteColor];
        [_info mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.bottom.equalTo(-40);
        }];
    }
    return _info;
}
@end
