//
//  HeaddownCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "HeaddownCell.h"

@implementation HeaddownCell

-(UILabel *)enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self addSubview:_enname];
        
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
        
    }
    return _enname;
}


@end
