//
//  HotGoodsCell.m
//  Qyer
//
//  Created by Yang Xiong on 25/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "HotGoodsCell.h"

@implementation HotGoodsCell

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
             make.top.equalTo(20);
             make.left.right.equalTo(0);
             make.height.equalTo(20);
             make.width.equalTo([UIScreen mainScreen].bounds.size.width);
         }];
        _cityTitle.textAlignment = NSTextAlignmentCenter;
        _cityTitle.font = [UIFont systemFontOfSize:20.0];
    }
    return _cityTitle;
}


-(NSArray<UIButton *> *)goodsBtn
{
    if (!_goodsBtn)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 6; i ++)
        {
            UIButton *btn = [UIButton new];
            [self.contentView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(kWidth * (132 / 639.0));
                make.height.equalTo(kHight * (132 / 1132.0));
                
                if ( i >= 0 && i <= 1 )
                {
                    if (i == 0)
                    {
                        make.top.equalTo(self.cityTitle.mas_bottom).equalTo(20);
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);
                    }
                }
                else if ( i >= 2 && i <= 3 )
                {
                    
                    if ( i == 2 )
                    {
                        make.left.equalTo(20);
                        make.top.equalTo(lastView.mas_bottom).offset(20);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);                    }
                }
                else if ( i >= 4 && i <= 5 )
                {
                    
                    if ( i == 4 )
                    {
                        make.left.equalTo(20);
                        make.top.equalTo(lastView.mas_bottom).offset(20);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);                    }
                }
                
            }];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = self.buttonBorderColor.CGColor;
            btn.layer.cornerRadius = 3.0;
            btn.clipsToBounds = YES;
            lastView = btn;
            [tmpArr addObject:btn];
        }
        _goodsBtn = tmpArr.copy;
    }
    return _goodsBtn;
}

-(NSArray<UIImageView *> *)goodsPic
{
    if (!_goodsPic)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 6; i ++)
        {
            UIImageView *image = [UIImageView new];
            [self.contentView addSubview:image];
            [image mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(120);
                make.width.equalTo(180);
                
                if ( i >= 0 && i <= 1 )
                {
                    if (i == 0)
                    {
                        make.top.equalTo(self.cityTitle.mas_bottom).equalTo(20);
                        make.left.equalTo(20);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);
                    }
                }
                else if ( i >= 2 && i <= 3 )
                {
                    
                    if ( i == 2 )
                    {
                        make.left.equalTo(20);
                        make.top.equalTo(lastView.mas_bottom).offset(100);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);                    }
                }
                else if ( i >= 4 && i <= 5 )
                {
                    
                    if ( i == 4 )
                    {
                        make.left.equalTo(20);
                        make.top.equalTo(lastView.mas_bottom).offset(100);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(20);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-20);                    }
                }
                
            }];

            lastView = image;
            [tmpArr addObject:image];
        }
        _goodsPic = tmpArr.copy;
    }
    return _goodsPic;
}


-(NSArray<UILabel *> *)titleLB
{
    if (!_titleLB)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 6; i ++)
        {
            UILabel *title = [UILabel new];
            [self.contentView addSubview:title];
            [title mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(40);
                make.width.equalTo(160);
                
                if ( i >= 0 && i <= 1 )
                {
                    if (i == 0)
                    {
                        make.top.equalTo(self.cityTitle.mas_bottom).equalTo(145);
                        make.left.equalTo(30);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(40);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-30);
                    }
                }
                else if ( i >= 2 && i <= 3 )
                {
                    
                    if ( i == 2 )
                    {
                        make.left.equalTo(30);
                        make.top.equalTo(lastView.mas_bottom).offset(180);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(40);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-30);                    }
                }
                else if ( i >= 4 && i <= 5 )
                {
                    
                    if ( i == 4 )
                    {
                        make.left.equalTo(30);
                        make.top.equalTo(lastView.mas_bottom).offset(180);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(40);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-30);                    }
                }
                
            }];
            //[title setBackgroundColor:[UIColor redColor]];
            title.numberOfLines = 2;
            title.font = [UIFont systemFontOfSize:15.0];
            lastView = title;
            [tmpArr addObject:title];
        }
        _titleLB = tmpArr.copy;
    }
    return _titleLB;
}

-(NSArray<UILabel *> *)statusLB
{
    if (!_statusLB)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 6; i ++)
        {
            UILabel *status = [UILabel new];
            [self.contentView addSubview:status];
            [status mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(30);
                make.width.equalTo(80);
                
                if ( i >= 0 && i <= 1 )
                {
                    if (i == 0)
                    {
                        make.top.equalTo(self.cityTitle.mas_bottom).equalTo(188);
                        make.left.equalTo(30);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        //make.right.equalTo(-130);
                    }
                }
                else if ( i >= 2 && i <= 3 )
                {
                    
                    if ( i == 2 )
                    {
                        make.left.equalTo(30);
                        make.top.equalTo(lastView.mas_bottom).offset(187);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        //make.right.equalTo(-30);
                    }
                }
                else if ( i >= 4 && i <= 5 )
                {
                    
                    if ( i == 4 )
                    {
                        make.left.equalTo(30);
                        make.top.equalTo(lastView.mas_bottom).offset(190);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        //make.right.equalTo(-30);
                    }
                }
                
            }];
            //[title setBackgroundColor:[UIColor redColor]];
            status.font = [UIFont systemFontOfSize:13.0];
            status.textColor = [UIColor lightGrayColor];
            lastView = status;
            [tmpArr addObject:status];
        }
        _statusLB = tmpArr.copy;
    }
    return _statusLB;
}

-(NSArray<UILabel *> *)priceLB
{
    if (!_priceLB)
    {
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (NSInteger i = 0; i < 6; i ++)
        {
            UILabel *price = [UILabel new];
            [self.contentView addSubview:price];
            [price mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(30);
                make.width.equalTo(80);
                
                if ( i >= 0 && i <= 1 )
                {
                    if (i == 0)
                    {
                        make.top.equalTo(self.cityTitle.mas_bottom).equalTo(188);
                        make.right.equalTo(-230);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        //make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-30);
                    }
                }
                else if ( i >= 2 && i <= 3 )
                {
                    
                    if ( i == 2 )
                    {
                        make.right.equalTo(-230);
                        make.top.equalTo(lastView.mas_bottom).offset(187);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-30);
                    }
                }
                else if ( i >= 4 && i <= 5 )
                {
                    
                    if ( i == 4 )
                    {
                        make.right.equalTo(-220);
                        make.top.equalTo(lastView.mas_bottom).offset(190);
                    }
                    else
                    {
                        make.top.equalTo(lastView);
                        make.left.equalTo(lastView.mas_right).equalTo(120);
                        //make.width.equalTo(lastView);
                        make.right.equalTo(-40);
                    }
                }
                
            }];
            price.textColor = [UIColor redColor];
            price.font = [UIFont systemFontOfSize:16.0];
            //price.textColor = [UIColor lightGrayColor];
            lastView = price;
            [tmpArr addObject:price];
        }
        _priceLB = tmpArr.copy;
    }
    return _priceLB;
}
@end
