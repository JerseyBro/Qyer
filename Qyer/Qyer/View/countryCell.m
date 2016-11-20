//
//  countryCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "countryCell.h"

@implementation countryCell
-(UIImageView *)photo
{
    if (!_photo) {
        _photo = [UIImageView new];
        [self.contentView addSubview:_photo];
        _photo.layer.cornerRadius = 2;
        _photo.clipsToBounds = YES;
        [_photo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.width.equalTo(_photo.mas_height);
            
        }];
    }
    return _photo;
}
-(UILabel *)cnname
{
    if (!_cnname) {
        _cnname = [UILabel new];
        [self.contentView addSubview:_cnname];
        _cnname.font = [UIFont systemFontOfSize:13];
        _cnname.numberOfLines = 0;
        [_cnname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.photo.mas_right).offset(10);
            make.top.equalTo(6);
            make.right.equalTo(-1);
        }];
    }
    return _cnname;
}
-(UILabel *)enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self.contentView addSubview:_enname];
        _enname.font = [UIFont systemFontOfSize:11];
        _enname.textColor = [UIColor grayColor];
        _enname.numberOfLines = 0;
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cnname);
            make.top.equalTo(self.cnname.mas_bottom).offset(4);
            make.right.equalTo(-1);
            make.bottom.equalTo(0);
        }];
    }
    return _enname;
}
@end
