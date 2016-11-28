//
//  RecommendCityCell.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "RecommendCityCell.h"
@implementation RecommendCityCell
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 25 / 2.0;
    
    frame.size.width = (long)([UIScreen mainScreen].bounds.size.width * 590 / 640.0);
    [super setFrame:frame];
}
//  推荐城市View懒加载
-(UIView *)recommendCityView{
    if (!_recommendCityView) {
        _recommendCityView = [UIView new];
        _recommendCityView.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_recommendCityView];
        [_recommendCityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _recommendCityView.layer.cornerRadius = 4;
    }
    return _recommendCityView;
}
//  表头按钮懒加载
-(UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn = [UIButton new];
        _iconBtn.backgroundColor = [UIColor redColor];
        [self.recommendCityView addSubview:_iconBtn];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(self.iconBtn.mas_width).multipliedBy(200 / 590.0);
        }];
    }
    return _iconBtn;
}
//  景点玩乐懒加载
//-(UIButton *)playBtn{
//    if (!_playBtn) {
//        _playBtn = [UIButton new];
//        [self.recommendCityView addSubview:_playBtn];
//        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//        }];
//    }
//    return _playBtn;
//}
@end
