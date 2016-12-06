//
//  GoCell.m
//  Qyer
//
//  Created by “Skip、 on 2016/12/3.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "GoCell.h"

@implementation GoCell

//  锚图片懒加载
-(UIImageView *)image{
    if (!_image) {
        _image = [UIImageView new];
        [_image setImage:[UIImage imageNamed:@"lasttime_view_Green_icon_10x10_"]];
        [self.contentView addSubview:_image];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.centerX.equalTo(0);
        }];
    }
    return _image;
}

//  现在出发Lb懒加载
-(UILabel *)goLb{
    if (!_goLb) {
        _goLb = [UILabel new];
        _goLb.text = @"现在出发";
        _goLb.font = [UIFont systemFontOfSize:10];
        _goLb.textColor = [UIColor colorWithRed:100 / 255.0 green:205 / 255.0 blue:164 / 255.0 alpha:1];
        [self.contentView addSubview:_goLb];
        [_goLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.image.mas_bottom).offset(8);
            make.centerX.equalTo(0);
        }];
    }
    return _goLb;
}

//  竖条view懒加载
-(UIImageView *)IV{
    if (!_IV) {
        _IV = [UIImageView new];
        _IV.backgroundColor = [UIColor colorWithRed:100 / 255.0 green:205 / 255.0 blue:164 / 255.0 alpha:1];
        [self.contentView addSubview:_IV];
        [_IV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.goLb.mas_bottom).offset(8);
            make.height.equalTo(8);
            make.width.equalTo(1);
        }];
    }
    return _IV;
}
@end
