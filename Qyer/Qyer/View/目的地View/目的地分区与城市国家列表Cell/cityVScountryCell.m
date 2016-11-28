//
//  cityVScountryCell.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "cityVScountryCell.h"
#define high  (self.contentView.height / 3)
@implementation cityVScountryCell
-(UIImageView *)photo
{
    if (!_photo) {
        _photo = [UIImageView new];
        [self.contentView addSubview:_photo];
        //打开用户交互
         _photo.userInteractionEnabled = YES;
          //切割圆形
        _photo.layer.cornerRadius = 2;
        _photo.layer.masksToBounds = YES;
        [_photo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        //填充样式
       _photo.contentMode = UIViewContentModeScaleAspectFill;
       // 设置毛玻璃
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.alpha = .5;
        
        [_photo addSubview:effectView];
        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
      
     
    }
    return _photo;
}
-(UILabel *)cnname
{
    if (!_cnname) {
        _cnname = [UILabel new];
        [self.contentView addSubview:_cnname];
        _cnname.textColor = [UIColor whiteColor];
         _cnname.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        [_cnname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
          
            make.top.equalTo(high);
        }];
    }
    return _cnname;
}
-(UILabel*) enname
{
    if (!_enname) {
        _enname = [UILabel new];
        [self.contentView addSubview:_enname];
        _enname.textColor = [UIColor whiteColor];
       
        _enname.font = [UIFont systemFontOfSize:15];
    
        [_enname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            
            make.top.equalTo(self.cnname).offset(high);
        }];
    }
    return _enname;
}
@end
