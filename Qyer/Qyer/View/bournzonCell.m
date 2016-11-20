//
//  bournzonCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "bournzonCell.h"

@implementation bournzonCell
-(UILabel *)tagname
{
    if (!_tagname) {
        _tagname = [UILabel new];
        _tagname.textAlignment = NSTextAlignmentCenter;
        _tagname.highlightedTextColor = [UIColor colorWithRed:35 / 255.0 green:189 / 255.0 blue:123 / 255.0 alpha:1.0];
        _tagname.textColor = [UIColor colorWithRed:89 / 255.0 green:89 / 255.0 blue:89 / 255.0 alpha:1.0];
        [self.contentView addSubview:_tagname];
        [_tagname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
    }
    return _tagname;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
