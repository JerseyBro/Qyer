//
//  ThreeCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/26.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ThreeCell.h"

@implementation ThreeCell

-(UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        [self.contentView addSubview:_icon];
        _icon.layer.cornerRadius = 2.5;
        _icon.clipsToBounds = YES;
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
//            CGFloat boot = HEIGHT * 140 / 1135;
            make.left.right.equalTo(0);
            make.top.equalTo(0);
            make.height.equalTo(_icon.mas_width);
        }];
    }
    return _icon;
}
-(UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        _name.font = [UIFont systemFontOfSize:15];
        _name.numberOfLines = 2;
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon);
            make.right.equalTo(-15);
            make.top.equalTo(self.icon.mas_bottom).offset(5);
        }];
    }
    return _name;
}
-(UILabel *)grade
{
    if (!_grade) {
        _grade = [UILabel new];
        [self.contentView addSubview:_grade];
        _grade.font = [UIFont systemFontOfSize:13.5];
        [_grade mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.icon.mas_right);
            make.top.equalTo(self.name.mas_bottom).offset(5);
        }];
    }
    return _grade;
}
@end
