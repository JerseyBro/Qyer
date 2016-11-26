//
//  AdvertisementCell.h
//  Qyer
//
//  Created by Yang Xiong on 23/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertisementCell : UITableViewCell
// 声明广告View中用到的所有控件,为其属性.
@property(nonatomic)  UIView   *view;
@property(nonatomic)  UIButton *leftBtn;
@property(nonatomic)  UIButton *rightUpBtn;
@property(nonatomic)  UIButton *rightDownBtn;
@end
