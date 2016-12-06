//
//  AdvertisementView.m
//  Qyer
//
//  Created by tarena15 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "AdvertisementView.h"

@implementation AdvertisementView

-(UIButton *)leftBtn
{
    if (!_leftBtn)
    {
        _leftBtn = [UIButton new];
        [self addSubview:_leftBtn];
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
        [self addSubview:_rightUpBtn];
        [_rightUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.rightDownBtn);
            make.left.equalTo(self.leftBtn.mas_right).offset(2.5);
            make.top.equalTo(0);
            make.right.equalTo(0);
        }];
    }
    
    return _rightUpBtn;
}
//
-(UIButton *)rightDownBtn
{
    if (!_rightDownBtn)
    {
        _rightDownBtn = [UIButton new];
        [self addSubview:_rightDownBtn];
        [_rightDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.leftBtn.mas_right).offset(5);
//            make.top.equalTo(0);
//            make.right.equalTo(0);
            make.bottom.equalTo(0);
            make.right.equalTo(0);
            
            make.left.equalTo(self.rightUpBtn);
            make.top.equalTo(self.rightUpBtn.mas_bottom).offset(2.5);
           
            //            CGFloat width = self.leftBtn.width / 2;
            //make.width.equalTo(self.leftBtn.mas_width);
            //CGFloat hight = self.leftBtn.height / 2;
            //make.height.equalTo(hight);
             make.size.equalTo(self.rightUpBtn);

        }];
    }
    
    return _rightDownBtn;
}

@end
