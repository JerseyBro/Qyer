//
//  AdvertisementCell.m
//  Qyer
//
//  Created by Yang Xiong on 23/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "AdvertisementCell.h"

@implementation AdvertisementCell

-(UIButton *)leftBtn
{
    if (!_leftBtn)
    {
        _leftBtn = [UIButton new];
        [self.contentView addSubview:_leftBtn];
        [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(0);
            make.bottom.equalTo(0);
            CGFloat width = [UIScreen mainScreen].bounds.size.width / 2;
            //            make.width.equalTo(width);
            //            make.height.equalTo(110);
            make.width.equalTo(width);
            //            make.edges.equalTo(0);
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
        [self.contentView addSubview:_rightUpBtn];
        [_rightUpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            //            make.left.equalTo(self.rightDownBtn);
            make.left.equalTo(self.leftBtn.mas_right).offset(2.5);
            make.top.equalTo(0);
            make.right.equalTo(0);
            //            make.bottom.equalTo(self)
            //            make.top.equalTo(self.rightDownBtn.mas_bottom).offset(5);
            //            make.right.bottom.equalTo(0);
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
        [self.contentView addSubview:_rightDownBtn];
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
