//
//  CityheadCell.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <iCarousel.h>
@interface CityheadCell : UICollectionViewCell <iCarouselDelegate,iCarouselDataSource>

@property(nonatomic ) NSArray<NSString*>* picture;

@property(nonatomic ) iCarousel* icvc;

@property(nonatomic ) UIButton*  goback;

@property(nonatomic ) UILabel* cnname;

@property(nonatomic ) UILabel* enname;

@property(nonatomic ) UILabel* info;

@property(nonatomic ) UIButton* tour;

@property(nonatomic ) UIView*  topView;
@end
