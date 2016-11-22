//
//  RecommendCityCell.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "RecommendCityCell.h"

@implementation RecommendCityCell
-(UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return _iconBtn;
}
@end
