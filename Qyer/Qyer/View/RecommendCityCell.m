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
    CGRect rect = [UIScreen mainScreen].bounds;
    frame.origin.x = 25 / 2.0;
    frame.size.width = rect.size.width - 25;
    frame.size.height = (long)(rect.size.width * 590 / 640.0);
    [super setFrame:frame];
}
//  推荐城市View懒加载
-(UIView *)recommendCityView{
    if (!_recommendCityView) {
        _recommendCityView = [UIView new];
        _recommendCityView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_recommendCityView];
        [_recommendCityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _recommendCityView.layer.cornerRadius = 4;
    }
    return _recommendCityView;
}
//  表头Btn懒加载
-(UIButton *)iconBtnWithCover:(NSString *)cover City:(NSString *)city{
    
    if (!_iconBtn) {
       _iconBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.recommendCityView addSubview:_iconBtn];
       
      
        self.iconBtn.tintColor = [UIColor whiteColor];
        self.iconBtn.font = [UIFont systemFontOfSize:35];
        [_iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(self.iconBtn.mas_width).multipliedBy(200 / 590.0);
        }];
        // 设置毛玻璃
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.alpha = .5;
        [self.iconBtn addSubview:effectView];
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //  最近访问
        UILabel *visitLb = [UILabel new];
        [self.iconBtn addSubview:visitLb];
        [visitLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(_iconBtn.mas_top).offset(15);
        }];
        visitLb.text = @"最近访问";
        //  字体加粗
        visitLb.font = [UIFont boldSystemFontOfSize:15];
        visitLb.textColor = [UIColor lightGrayColor];
    }
        [self.iconBtn setBackgroundImageWithURL:(cover).wx_URL forState:UIControlStateNormal options:0];
        [self.iconBtn setTitle:city forState:UIControlStateNormal];
    return _iconBtn;
}
//  景点玩乐Btn懒加载
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _playBtn.userInteractionEnabled = YES;
        [_playBtn setImage:[UIImage imageNamed:@"city_iconPoi_32x32_"] forState:UIControlStateNormal];
        [self.recommendCityView addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Width * 70 / 590);
            make.centerY.equalTo(0);
        }];
        UILabel *playLb = [UILabel new];
        [self.playBtn addSubview:playLb];
        [playLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.playBtn.mas_bottom).offset(7);
            make.left.equalTo(self.contentView).offset(Width * 60 / 590);
        }];
        playLb.text = @"景点玩乐";
        playLb.font = [UIFont systemFontOfSize:11];
        
    }
    return _playBtn;
}
//  美食Btn懒加载
-(UIButton *)foodBtn{
    if (!_foodBtn) {
        _foodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _foodBtn.userInteractionEnabled = YES;
        [_foodBtn setImage:[UIImage imageNamed:@"city_iconFood_32x32_"] forState:UIControlStateNormal];
        [self.recommendCityView addSubview:_foodBtn];
        [_foodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Width * 200 / 590);
            make.centerY.equalTo(0);
        }];
        UILabel *foodLb = [UILabel new];
        [self.foodBtn addSubview:foodLb];
        [foodLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.foodBtn.mas_bottom).offset(7);
            make.left.equalTo(self.contentView).offset(Width * 210 / 590);
        }];
        foodLb.text = @"美食";
        foodLb.font = [UIFont systemFontOfSize:12];
    }
    return _foodBtn;
}
//  锦囊Btn懒加载
-(UIButton *)packBtn{
    if (!_packBtn) {
        _packBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _packBtn.userInteractionEnabled = YES;
        [_packBtn setImage:[UIImage imageNamed:@"city_iconGuid_32x32_"] forState:UIControlStateNormal];
        [self.recommendCityView addSubview:_packBtn];
        [_packBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(Width * 340 / 590);
        }];
        UILabel *packLb = [UILabel new];
        [self.packBtn addSubview:packLb];
        [packLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.packBtn.mas_bottom).offset(7);
            make.left.equalTo(self.contentView).offset(Width * 350 / 590);
        }];
        packLb.text = @"锦囊";
        packLb.font = [UIFont systemFontOfSize:12];
        
    }
    return _packBtn;
}
//  收藏目的地Btn懒加载
-(UIButton *)bournBtn{
    if (!_bournBtn) {
        _bournBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bournBtn.userInteractionEnabled = YES;
        [_bournBtn setImage:[UIImage imageNamed:@"city_iconDes_32x32_"] forState:UIControlStateNormal];
        [self.recommendCityView addSubview:_bournBtn];
        [_bournBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(Width * 460 / 590);
        }];
        UILabel *bournLb = [UILabel new];
        [self.bournBtn addSubview:bournLb];
        [bournLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bournBtn.mas_bottom).offset(7);
            make.left.equalTo(self.contentView).offset(Width * 440 / 590);
        }];
        bournLb.text = @"收藏目的地";
        bournLb.font = [UIFont systemFontOfSize:12];
        
    }
    return _bournBtn;
}
//  更多城市Label懒加载
-(UILabel *)cityLb{
    if (!_cityLb) {
        _cityLb = [UILabel new];
        [self.recommendCityView addSubview:_cityLb];
        [_cityLb mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.equalTo(0);
            make.top.equalTo(Height * 390 / 530);
 
            
        }];
        //  图片拼接字符串
        CGFloat width = Width * 235 / 590;
        NSTextAttachment *strAtt = [NSTextAttachment new];
        
        strAtt.image = [UIImage imageNamed:@"actionsheet_line"];
        
        strAtt.bounds = CGRectMake(0, 5, width, 1);
        
        NSTextAttachment *strAtt1 = [NSTextAttachment new];
        
        strAtt1.image = [UIImage imageNamed:@"actionsheet_line"];
        
        strAtt1.bounds = CGRectMake(0, 5, width, 1);
        
        NSMutableAttributedString *mutStr = [NSMutableAttributedString new];
        
        NSAttributedString *str1 = [NSAttributedString attributedStringWithAttachment:strAtt];
        
        
        NSAttributedString* str2 = [[NSAttributedString alloc]initWithString:@"  更多城市  " attributes:@{NSForegroundColorAttributeName: [UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        
        NSAttributedString *str3 = [NSAttributedString attributedStringWithAttachment:strAtt1];
        
        [mutStr appendAttributedString:str1];

        [mutStr appendAttributedString:str2];
        
        [mutStr appendAttributedString:str3];
        
        
        _cityLb.attributedText = mutStr;
    }
    return _cityLb;
    
}

//  底下景点1Btn懒加载
-(UIButton *)scenicBtn1{
    if (!_scenicBtn1) {
        _scenicBtn1 = [UIButton new];
        [self.recommendCityView addSubview:_scenicBtn1];
        [_scenicBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cityLb).offset(45);
            make.left.equalTo(Width * 30 / 590);
            make.size.equalTo(CGSizeMake((Width - 80) / 3, 52));
        }];
        _scenicBtn1.layer.cornerRadius = 26;
        _scenicBtn1.clipsToBounds = YES;
        [_scenicBtn1 setTitle:@"东京" forState:UIControlStateNormal];
        [_scenicBtn1 setTitleColor:[UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1] forState:UIControlStateNormal];
        _scenicBtn1.layer.borderWidth = 1;
        _scenicBtn1.layer.borderColor = [UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1].CGColor;
    }
    return _scenicBtn1;
}

//  底下景点2Btn懒加载
-(UIButton *)scenicBtn2{
    if (!_scenicBtn2) {
        _scenicBtn2 = [UIButton new];
        [self.recommendCityView addSubview:_scenicBtn2];
        [_scenicBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cityLb).offset(45);
            make.left.equalTo(Width * 210 / 590);
            make.size.equalTo(CGSizeMake((Width - 80) / 3, 52));
        }];
        _scenicBtn2.layer.cornerRadius = 26;
        _scenicBtn2.clipsToBounds = YES;
        [_scenicBtn2 setTitle:@"巴黎" forState:UIControlStateNormal];
        [_scenicBtn2 setTitleColor:[UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1] forState:UIControlStateNormal];
        _scenicBtn2.layer.borderWidth = 1;
        _scenicBtn2.layer.borderColor = [UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1].CGColor;
    }
    return _scenicBtn2;
}
//  底下景点3Btn懒加载
-(UIButton *)scenicBtn3{
    if (!_scenicBtn3) {
        _scenicBtn3 = [UIButton new];
        [self.recommendCityView addSubview:_scenicBtn3];
        [_scenicBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cityLb).offset(45);
            make.left.equalTo(Width * 390 / 590);
            make.size.equalTo(CGSizeMake((Width - 80) / 3, 52));
        }];
        _scenicBtn3.layer.cornerRadius = 26;
        _scenicBtn3.clipsToBounds = YES;
        [_scenicBtn3 setTitle:@"佛罗伦萨" forState:UIControlStateNormal];
        [_scenicBtn3 setTitleColor:[UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1] forState:UIControlStateNormal];
        _scenicBtn3.layer.borderWidth = 1;
        _scenicBtn3.layer.borderColor = [UIColor colorWithRed:165 / 255.0 green:226 / 255.0 blue:198 / 255.0 alpha:1].CGColor;
    }
    return _scenicBtn3;
}
@end
