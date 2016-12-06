//
//  AdvertisementCell.m
//  Qyer
//
//  Created by Yang Xiong on 23/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "AdvertisementCell.h"

@implementation AdvertisementCell
-(UIView *)view
{
    if (!_view)
    {
        _view = [UIView new];
        [self.contentView addSubview:_view];
        [_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(0);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        _view.backgroundColor = [UIColor whiteColor];
    }
    return _view;
}

-(UIButton *)leftBtn
{
    if (!_leftBtn)
    {
        _leftBtn = [UIButton new];
        [self.view addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(0);
            make.bottom.equalTo(0);
            make.width.equalTo(kWidth * (317 / 639.0));
            make.height.equalTo(kHight * (216 / 1132.0));
        }];
        _leftBtn.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _leftBtn;
}

-(UIButton *)rightUpBtn
{
    if (!_rightUpBtn)
    {
        _rightUpBtn = [UIButton new];
        [self.view addSubview:_rightUpBtn];
        [_rightUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftBtn.mas_right).offset(2.5);
            make.top.equalTo(0);
            make.right.equalTo(0);
            make.width.equalTo(kWidth * (317 / 639.0));
            make.height.equalTo(kHight * (105 / 1132.0));
        }];
    }
    
    return _rightUpBtn;
}

-(UIButton *)rightDownBtn
{
    if (!_rightDownBtn)
    {
        _rightDownBtn = [UIButton new];
        [self.view addSubview:_rightDownBtn];
        [_rightDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(0);
            make.right.equalTo(0);
            
            make.left.equalTo(self.rightUpBtn);
            make.top.equalTo(self.rightUpBtn.mas_bottom).offset(2.5);
            make.size.equalTo(self.rightUpBtn);
            
        }];
    }
    
    return _rightDownBtn;
}

@end
