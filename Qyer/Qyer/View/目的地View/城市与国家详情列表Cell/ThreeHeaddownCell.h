//
//  ThreeHeaddownCell.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/26.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>
#define Higt  HEIGHT * 375 / 1135
@interface ThreeHeaddownCell : UICollectionReusableView
@property(nonatomic)UILabel* title;
@property(nonatomic)UIImageView* image1;
@property(nonatomic)UIImageView* image2;
@property(nonatomic)UILabel* content1;
@property(nonatomic)UILabel* content2;
@property(nonatomic)UIImageView* image3;
-(UILabel *)title;
@end
