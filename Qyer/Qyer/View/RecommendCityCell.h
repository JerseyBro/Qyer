//
//  RecommendCityCell.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendCityCell : UITableViewCell
//  推荐城市View
@property (nonatomic) UIView *recommendCityView;
//  表头按钮
@property (nonatomic) UIButton *iconBtn;
//  景点玩乐
@property (nonatomic) UIButton *playBtn;
//  美食
@property (nonatomic) UIButton *foodBtn;
//  锦囊
@property (nonatomic) UIButton *packBtn;
//  收藏目的地
@property (nonatomic) UIButton *bournBtn;
//  更多城市Label
@property (nonatomic) UILabel *cityLb;
//  底下景点1按钮
@property (nonatomic) UIButton *scenicBtn1;
//  底下景点2按钮
@property (nonatomic) UIButton *scenicBtn2;
//  底下景点3按钮
@property (nonatomic) UIButton *scenicBtn3;

-(UIButton *)iconBtnWithCover:(NSString *)cover City:(NSString *)city;

@end
