//
//  cityVScountryCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "cityVScountryCell.h"
#define high  (self.contentView.height / 3)
@implementation cityVScountryCell
-(UIImageView *)photo
{
    if (!_photo) {
        _photo = [UIImageView new];
        [self.contentView addSubview:_photo];
        [_photo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //填充样式
//        _photo.contentMode = UIViewContentModeScaleAspectFill;
        //切割圆形
        _photo.layer.cornerRadius = 2;
        _photo.layer.masksToBounds = YES;
    }
    return _photo;
}
-(UILabel *)cnname
{
    if (!_cnname) {
        _cnname = [UILabel new];
        [self.contentView addSubview:_cnname];
        _cnname.textColor = [UIColor whiteColor];
        [_cnname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
          
            make.top.equalTo(high);
        }];
    }
    return _cnname;
}
-(UILabel*) enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self.contentView addSubview:_enname];
        _enname.textColor = [UIColor whiteColor];
        _enname.font = [UIFont systemFontOfSize:13];
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            
            make.top.equalTo(self.cnname).offset(high);
        }];
    }
    return _enname;
}
@end
