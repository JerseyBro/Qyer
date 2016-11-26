//
//  HotGoodsCell.h
//  Qyer
//
//  Created by Yang Xiong on 25/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotGoodsCell : UITableViewCell
@property(nonatomic)  UIColor *backgroundColor;
@property(nonatomic)  UIColor *buttonBorderColor;
@property(nonatomic)  UIView *cityView;
@property(nonatomic)  UILabel *cityTitle;


@property(nonatomic)  NSArray <UIButton *> *goodsBtn;
@property(nonatomic)  NSArray<UIImageView *> *goodsPic;
@property(nonatomic)  NSArray<UILabel *> *titleLB;
@property(nonatomic)  NSArray<UILabel *> *statusLB;
@property(nonatomic)  NSArray<UILabel *> *priceLB;
@end
