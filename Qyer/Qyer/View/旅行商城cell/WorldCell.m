//
//  WorldCell.m
//  Qyer
//
//  Created by tarena15 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "WorldCell.h"


@implementation WorldCell
-(UIColor *)backgroundColor
{
    return [UIColor colorWithRed:47 / 255.0 green:176 / 255.0 blue:116 / 255.0 alpha:1.0];
}

-(UIColor *)buttonBorderColor
{
    return [UIColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:0.5];
}

-(UIView *)cityView
{
    if (!_cityView)
    {
        _cityView = [UIView new];
        [self.contentView addSubview:_cityView];
        [_cityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        _cityView.backgroundColor = [UIColor whiteColor];
    }
    return _cityView;
}

-(UILabel *)cityTitle
{
    if (!_cityTitle)
    {
        _cityTitle = [UILabel new];
        [self.cityView addSubview:_cityTitle];
        [_cityTitle mas_makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(kHight * (36.f / 1132.f));
             make.left.right.equalTo(0);
             make.height.equalTo(kHight * (38.f / 1132.f));
             make.width.equalTo(kWidth);
         }];
        _cityTitle.textAlignment = NSTextAlignmentCenter;
        _cityTitle.font = [UIFont systemFontOfSize:20.f];
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
            [self.cityView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                // make.top.equalTo(self.cityTitle.mas_bottom).offset(20);
                make.width.equalTo(kWidth * (132.f / 639.f));
                make.height.equalTo(kHight * (102.f / 1132.f));
                make.top.equalTo((86.f / 710.f) * (kHight * (718.f / 1132.f)));
                
                if (i == 0)
                {
                    make.left.equalTo(kWidth * (30.f / 639.f));
                }
                else
                {
                    make.left.equalTo(lastView.mas_right).equalTo(kWidth * (30.f / 639.f));
                    make.width.equalTo(lastView);
                    if (i == 3)
                    {
                        make.right.equalTo(-(kWidth * (30.f / 639.f)));
                    }
                }
                
            }];
            btn.layer.cornerRadius = 0.5;
            btn.clipsToBounds = YES;
            
            lastView.layer.cornerRadius = 0.5;
            lastView.clipsToBounds = YES;
            // 设置毛玻璃
            UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
            UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
            effectView.alpha = .3;
            
            [btn addSubview:effectView];
            [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(0.f);
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
            [self.cityView addSubview:name];
            [name mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.cityTitle.mas_bottom).offset((45.f / 710.f) * (kHight * (718.f / 1132.f)));
                //make.center.equalTo(self.cityBtn);
                if (i == 0)
                {
                    make.left.equalTo(kWidth * (20.f / 639.f));
                }
                else
                {
                    make.left.equalTo(lastView.mas_right).equalTo(kWidth * (10.f / 639.f));
                    make.width.equalTo(lastView);
                    if (i == 3)
                    {
                        make.right.equalTo(-kWidth * (20.f / 639.f));
                    }
                }

            }];
            name.textColor = [UIColor whiteColor];
            name.textAlignment = NSTextAlignmentCenter;
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
        [self.cityView addSubview:_cityDetail01Btn];
        [_cityDetail01Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(kWidth * (30.f / 639.f));
            make.top.equalTo(self.cityBtn.lastObject.mas_bottom).offset((20.f / 718.f) * (kHight * (718.f / 1132.f)));
            make.right.equalTo(-(kWidth * (20.f / 639.f)));
            make.width.equalTo(kWidth * (582.f / 639.f));
            make.height.equalTo(kHight * (160.f / 1132.f));
        }];
        _cityDetail01Btn.layer.borderWidth = 1;
        _cityDetail01Btn.layer.borderColor = self.buttonBorderColor.CGColor;
        _cityDetail01Btn.layer.cornerRadius = 3.0;
        _cityDetail01Btn.clipsToBounds = YES;
        
    }
    
    return _cityDetail01Btn;
}

-(UIButton *)cityDetail02Btn
{
    if (!_cityDetail02Btn)
    {
        _cityDetail02Btn = [UIButton new];
        [self.cityView addSubview:_cityDetail02Btn];
        [_cityDetail02Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.cityDetail01Btn);
            make.top.equalTo(self.cityDetail01Btn.mas_bottom).offset((20.f / 718.f) * (kHight * (718.f / 1132.f)));
            make.width.height.equalTo(self.cityDetail01Btn);
        }];
        _cityDetail02Btn.layer.borderWidth = 1;
        _cityDetail02Btn.layer.borderColor = self.buttonBorderColor.CGColor;
        _cityDetail02Btn.layer.cornerRadius = 3.0;
        _cityDetail02Btn.clipsToBounds = YES;
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
            make.width.equalTo(self.cityBtn.lastObject);
            make.height.lessThanOrEqualTo(self.cityBtn.lastObject.mas_height).offset(30.f);
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
            make.width.equalTo(self.cityBtn.lastObject);
            make.height.equalTo(self.cityPic1);
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
            make.left.equalTo(self.cityPic1.mas_right).offset(10);
            make.top.equalTo(3);
            make.right.equalTo(-10);
        }];
        _title1LB.numberOfLines = 2;
        _title1LB.font = [UIFont systemFontOfSize:15.0];
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
            make.left.equalTo(self.cityPic2.mas_right).offset(10);
            make.top.equalTo(3);
            make.right.equalTo(-10);
        }];
        _title2LB.numberOfLines = 2;
        _title2LB.font = [UIFont systemFontOfSize:15.0];
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
        _sold1LB.font = [UIFont systemFontOfSize:13.0];
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
        _sold2LB.font = [UIFont systemFontOfSize:13.0];
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

-(UIButton *)moreContentBtn
{
    if (!_moreContentBtn)
    {
        _moreContentBtn = [UIButton new];
        [self.cityView addSubview:_moreContentBtn];
        [_moreContentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
            make.height.equalTo(kHight * (48.f / 1132.f));
            make.width.equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        _moreContentBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        _moreContentBtn.titleLabel.textColor = [UIColor blackColor];
    }
    
    return _moreContentBtn;
}
@end
