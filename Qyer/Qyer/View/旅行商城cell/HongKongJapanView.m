//
//  HongKongJapanView.m
//  Qyer
//
//  Created by Yang Xiong on 23/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "HongKongJapanView.h"

@implementation HongKongJapanView
-(UILabel *)cityTitle
{
    if (!_cityTitle)
    {
        _cityTitle = [UILabel new];
        [self addSubview:_cityTitle];
        [_cityTitle mas_makeConstraints:^(MASConstraintMaker *make)
        {
            make.left.top.right.equalTo(0);
            make.height.equalTo(20);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        _cityTitle.textAlignment = NSTextAlignmentCenter;
        _cityTitle.font = [UIFont systemFontOfSize:18];
    }
    return _cityTitle;
}


-(NSArray<UIButton *> *)cityBtn
{
    if (!_cityBtn)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 4; i ++)
        {
            UIButton *btn = [UIButton new];
            [self addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    
                    if (i == 0)
                    {
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.left.equalTo(lastView.mas_right).equalTo(10);
                        make.width.equalTo(lastView);
                        if (i == 3)
                        {
                            make.right.equalTo(-20);
                        }
                    }
                
            }];
            lastView = btn;
            [tmpArr addObject:btn];
        }
        _cityBtn = tmpArr.copy;
        
    }
      return _cityBtn;
}


-(NSArray<UILabel *> *)cityName
{
    if (!_cityName)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 4; i ++)
        {
            UILabel *name = [UILabel new];
            [self addSubview:name];
            [name mas_makeConstraints:^(MASConstraintMaker *make) {
                
                if (i == 0)
                {
                    make.left.equalTo(20);
                }
                else
                {
                    make.left.equalTo(lastView.mas_right).equalTo(10);
                    make.width.equalTo(lastView);
                    if (i == 3)
                    {
                        make.right.equalTo(-20);
                    }
                }
                
            }];
            lastView = name;
            [tmpArr addObject:name];
        }
        _cityName = tmpArr.copy;
        
    }
            return _cityName;
}


-(UIButton *)cityDetail01Btn
{
    if (!_cityDetail01Btn)
    {
        _cityDetail01Btn = [UIButton new];
        [self addSubview:_cityDetail01Btn];
        [_cityDetail01Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20);
            make.top.equalTo(100);
            make.right.equalTo(-20);
            make.width.equalTo(300);
            make.height.equalTo(60);
        }];
        _cityDetail01Btn.layer.borderWidth = 1;
        _cityDetail01Btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    
    return _cityDetail01Btn;
}

-(UIButton *)cityDetail02Btn
{
    if (!_cityDetail02Btn)
    {
        _cityDetail02Btn = [UIButton new];
        [self addSubview:_cityDetail02Btn];
        [_cityDetail02Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.cityDetail01Btn);
            make.top.equalTo(self.cityDetail01Btn.mas_bottom).offset(20);
            make.width.height.equalTo(self.cityDetail01Btn);
        }];
        _cityDetail02Btn.layer.borderWidth = 1;
        _cityDetail02Btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    
    return _cityDetail02Btn;
}

-(UIImageView *)cityPic1
{
    if (!_cityPic1)
    {
        _cityPic1 = [UIImageView new];
        [self.cityDetail01Btn addSubview:_cityPic1];
        [_cityPic1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.width.equalTo(60);
        }];
    }
    
    return _cityPic1;
}

-(UIImageView *)cityPic2
{
    if (!_cityPic2)
    {
        _cityPic2 = [UIImageView new];
        [self.cityDetail02Btn addSubview:_cityPic2];
        [_cityPic2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.width.equalTo(60);
        }];
    }
    
    return _cityPic2;
}

-(UILabel *)title1LB
{
    if (!_title1LB)
    {
        _title1LB = [UILabel new];
        [self.cityDetail01Btn addSubview:_title1LB];
        [_title1LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cityPic1.mas_right).offset(5);
            make.top.equalTo(3);
            make.right.equalTo(-10);
        }];
        _title1LB.numberOfLines = 2;
        _title1LB.font = [UIFont systemFontOfSize:14.0];
    }
    
    return _title1LB;
}

-(UILabel *)title2LB
{
    if (!_title2LB)
    {
        _title2LB = [UILabel new];
        [self.cityDetail02Btn addSubview:_title2LB];
        [_title2LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cityPic2.mas_right).offset(5);
            make.top.equalTo(3);
            make.right.equalTo(-10);
        }];
        _title2LB.numberOfLines = 2;
        _title2LB.font = [UIFont systemFontOfSize:14.0];
    }
    
    return _title2LB;
}

-(UILabel *)sold1LB
{
    if (!_sold1LB)
    {
        _sold1LB = [UILabel new];
        [self.cityDetail01Btn addSubview:_sold1LB];
        [_sold1LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title1LB);
            make.bottom.equalTo(-3);
        }];
        _sold1LB.font = [UIFont systemFontOfSize:12.0];
        _sold1LB.textColor = [UIColor lightGrayColor];
    }
    
    return _sold1LB;
}

-(UILabel *)sold2LB
{
    if (!_sold2LB)
    {
        _sold2LB = [UILabel new];
        [self.cityDetail02Btn addSubview:_sold2LB];
        [_sold2LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title2LB);
            make.bottom.equalTo(-3);
        }];
        _sold2LB.font = [UIFont systemFontOfSize:12.0];
        _sold2LB.textColor = [UIColor lightGrayColor];
    }
    
    return _sold2LB;
}

-(UILabel *)price1LB
{
    if (!_price1LB)
    {
        _price1LB = [UILabel new];
        [self.cityDetail01Btn addSubview:_price1LB];
        [_price1LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(-3);
        }];
        _price1LB.font = [UIFont systemFontOfSize:16.0];
        _price1LB.textColor = [UIColor redColor];
    }
    
    return _price1LB;
}

-(UILabel *)price2LB
{
    if (!_price2LB)
    {
        _price2LB = [UILabel new];
        [self.cityDetail02Btn addSubview:_price2LB];
        [_price2LB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.bottom.equalTo(-3);
        }];
        _price2LB.font = [UIFont systemFontOfSize:16.0];
        _price2LB.textColor = [UIColor redColor];
    }
    
    return _price2LB;
}


@end
