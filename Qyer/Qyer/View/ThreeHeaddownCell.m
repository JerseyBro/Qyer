//
//  ThreeHeaddownCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/26.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ThreeHeaddownCell.h"

@implementation ThreeHeaddownCell

-(UILabel *)title
{
    if(!_title)
    {
        _title = [UILabel new];
        [self addSubview:_title];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        _title.text = @"TOP必去";
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(50);
        }];
    }
    return _title;
}
-(UIImageView*)image1
{
    if (!_image1) {
        _image1 = [UIImageView new];
        [self addSubview:_image1];
        _image1.layer.cornerRadius = 3.5;
        _image1.clipsToBounds = YES;
        [_image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widg = (WIDTH) * 30  / 640;
            make.left.equalTo(widg);
            CGFloat bottom = (Higt) * 48 / 375;
            make.bottom.equalTo(-bottom);
            CGFloat hight = (Higt) * 150 / 375;
            make.height.equalTo(hight);
            CGFloat width = (WIDTH) * 280 / 640;
            make.width.equalTo(width);
        }];
        UIImageView* image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"14760680917392"]];
        [_image1 addSubview:image];
        image.width = 50;
        image.height = 35;
        image.contentMode = UIViewContentModeScaleToFill;
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
            make.width.equalTo(30);
            make.height.equalTo(20);
        }];
    }
    return _image1;
}
-(UILabel *)content1
{
    if (!_content1) {
        _content1 = [UILabel new];
        [self addSubview:_content1];
        _content1.font = [UIFont systemFontOfSize:15];
        [_content1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.image1);
            make.bottom.equalTo(0);
        }];

    }
    return _content1;
}
-(UIImageView *)image2
{
    if (!_image2) {
        _image2 = [UIImageView new];
        [self addSubview:_image2];
        _image2.layer.cornerRadius = 3.5;
        _image2.clipsToBounds = YES;
        [_image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat widg = (WIDTH) * 30  / 640;
            make.right.equalTo(-widg);
            CGFloat bottom = (Higt) * 48 / 375;
            make.bottom.equalTo(-bottom);
            CGFloat hight = (Higt) * 150 / 375;
            make.height.equalTo(hight);
            CGFloat width = (WIDTH) * 280 / 640;
            make.width.equalTo(width);
        }];
        UIImageView* image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"14760680917392"]];
        [_image2 addSubview:image];
        image.width = 50;
        image.height = 35;
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _image2;
}
-(UILabel *)content2
{
    if (!_content2) {
        _content2 = [UILabel new];
        [self addSubview:_content2];
        _content2.font = [UIFont systemFontOfSize:15];
        [_content2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.image2);
            make.bottom.equalTo(0);
        }];
    }
    return _content2;
}

@end
