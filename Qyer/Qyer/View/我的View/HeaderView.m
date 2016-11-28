//
//  HeaderView.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/27.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(UIImageView *)back
{
    if (!_back) {
        _back = [UIImageView new];
        _back.image = [UIImage imageNamed:@"profileHeader"];
        [self addSubview:_back];
        [_back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _back;
}

-(UIImageView *)user
{
    if (!_user) {
        _user = [UIImageView new];
        _user.image = [UIImage imageNamed:@"QYUserPhoto_55x55_"];
        [self addSubview:_user];
        [_user mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(100);
        }];
    }
    return _user;
}
@end
