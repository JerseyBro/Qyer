//
//  WorldCell.h
//  Qyer
//
//  Created by tarena15 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldCell : UITableViewCell
@property(nonatomic)  UIColor *backgroundColor;
@property(nonatomic)  UIColor *buttonBorderColor;
@property(nonatomic)  UIView *cityView;
@property(nonatomic)  UILabel *cityTitle;
@property(nonatomic)  NSArray<UIButton *> *cityBtn;
@property(nonatomic)  NSArray<UILabel *> *cityName;
@property(nonatomic)  UIButton *cityDetail01Btn;
@property(nonatomic)  UIButton *cityDetail02Btn;
@property(nonatomic)  UIImageView *cityPic1;
@property(nonatomic)  UIImageView *cityPic2;
@property(nonatomic)  UILabel *title1LB;
@property(nonatomic)  UILabel *title2LB;
@property(nonatomic)  UILabel *sold1LB;
@property(nonatomic)  UILabel *sold2LB;
@property(nonatomic)  UILabel *price1LB;
@property(nonatomic)  UILabel *price2LB;
@property(nonatomic)  UIButton *moreContentBtn;
@end
