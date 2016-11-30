//
//  CommentViewCell.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/30.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "CommentViewCell.h"

@implementation CommentViewCell


- (void)setFrame:(CGRect)frame
{
        CGRect rect = [UIScreen mainScreen].bounds;
        frame.origin.x = 25 / 2.0;
        frame.size.width = rect.size.width - 25;
        frame.size.height = Height1;
        [super setFrame:frame];
}


-(UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.centerY.equalTo(0);
        }];
        [_icon setImage:[UIImage imageNamed:@"new_review_icon_10x10_"]];
    }
    return _icon;
}

-(UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(_icon.mas_right).offset(5);
        }];
        _label.text = @"点评我去过的目的地，帮助更多的穷游er";
        _label.font = [UIFont systemFontOfSize:10];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}

@end
