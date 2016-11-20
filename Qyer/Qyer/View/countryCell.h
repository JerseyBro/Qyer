//
//  countryCell.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface countryCell : UICollectionViewCell
/***
 **   城市中文名称
 **
 ***/
@property (nonatomic, strong) UILabel * cnname;
/***
 **  城市英文名称
 **
 ***/
@property (nonatomic, strong) UILabel * enname;
/***
 **   左边目的地地区的名字数组
 **
 ***/
//@property (nonatomic, assign) NSInteger flag;
/***
 **   页面链接的id值
 **   id--> idField
 ***/
//@property (nonatomic, assign) NSInteger idField;
/***
 **     图片链接
 **
 ***/
@property (nonatomic, strong) UIImageView* photo;
@end
