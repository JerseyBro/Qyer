//
//  RecommendViewCell.m
//  Qyer
//
//  Created by “Skip、 on 2016/12/2.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "RecommendViewCell.h"

@implementation RecommendViewCell

//  表头view懒加载
-(UIImageView *)headerView{
    if (!_headerView) {
        _headerView = [UIImageView new];
        _headerView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_headerView];
        [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
            make.height.equalTo(self.headerView.mas_width).multipliedBy(255 / 640.0);
        }];
        _headerView.clipsToBounds = YES;
    }
    return _headerView;
}

//  标签Lb懒加载
-(UILabel *)noteLb{
    if (!_noteLb) {
        _noteLb = [UILabel new];
        _noteLb.backgroundColor = [UIColor colorWithRed:113 / 255.0 green:210 / 255.0 blue:154 / 255.0 alpha:1];
        [self.headerView addSubview:_noteLb];
        [_noteLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15);
            make.left.equalTo(0);
            make.height.equalTo(20);
            make.width.equalTo(60);
        }];
        _noteLb.font = [UIFont systemFontOfSize:10];
        _noteLb.textColor = [UIColor whiteColor];
        _noteLb.textAlignment = NSTextAlignmentCenter;
        
    }
    return _noteLb;
}

//  标题Lb懒加载
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(self.headerView.mas_bottom).offset(20);
        }];
        _titleLb.font = [UIFont systemFontOfSize:18];
    }
    return _titleLb;
}

//  内容Lb懒加载
-(UILabel *)subjectLb{
    if (!_subjectLb) {
        _subjectLb = [UILabel new];
        [self.contentView addSubview:_subjectLb];
        [_subjectLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLb.mas_bottom).offset(15);
            make.left.equalTo(15);
        }];
        _subjectLb.font = [UIFont systemFontOfSize:12];
        _subjectLb.textColor = [UIColor grayColor];
        _subjectLb.numberOfLines = 0;
    }
    return _subjectLb;
}

//  表尾view懒加载
-(UIImageView *)footerView{
    if (!_footerView) {
        _footerView = [UIImageView new];
        [self.contentView addSubview:_footerView];
        [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(-20);
        }];
    }
    return _footerView;
}
@end
