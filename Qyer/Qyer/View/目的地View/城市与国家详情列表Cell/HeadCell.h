//
//  HeadCell.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/26.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define higt HEIGHT * 467 / 1135

@interface HeadCell : UICollectionViewCell
@property(nonatomic ) UILabel* cnname;

@property(nonatomic ) UILabel* enname;

@property(nonatomic ) UILabel* info;

@property(nonatomic ) UIButton* tour;

@property(nonatomic) UILabel* go;

-(UIButton *)tour;
@end
