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
            make.left.top.equalTo(0);
            make.width.height.equalTo(90);
            
        }];
    }
    return _photo;
}
-(UILabel *)cnname
{
    if (!_cnname) {
        _cnname = [UILabel new];
        [self.contentView addSubview:_cnname];
        [_cnname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.photo.mas_right).offset(12);
            make.top.equalTo(17);
        }];
    }
    return _cnname;
}
-(UILabel *)enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self.contentView addSubview:_enname];
        _enname.font = [UIFont systemFontOfSize:12];
        _enname.textColor = [UIColor grayColor];
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cnname);
            make.top.equalTo(self.cnname.mas_bottom).offset(10);
        }];
    }
    return _enname;
}
@end
