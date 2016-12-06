//
//  RecommendModel.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendDataModel, RecommendExtraModel, RecommendDataDiscountModel, RecommendDataRecommend_cityModel, RecommendDataTabModel;
@interface RecommendModel : NSObject
@property (nonatomic, strong) RecommendDataModel * data;

@property (nonatomic, strong) RecommendExtraModel * extra;

@property (nonatomic, strong) NSString * info;

@property (nonatomic, strong) NSString * ra_referer;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger times;
@end

@interface RecommendDataModel : NSObject
@property (nonatomic, assign) NSInteger city_id;

@property (nonatomic, strong) NSString * city_name;

@property (nonatomic, strong) NSString * cover;

@property (nonatomic, strong) RecommendDataDiscountModel * discount;

@property (nonatomic, strong) NSArray<RecommendDataRecommend_cityModel *> * recommend_city;

@property (nonatomic, strong) NSArray<RecommendDataTabModel *> * tab;

@property (nonatomic, strong) NSString * title;

@property (nonatomic, assign) NSInteger type;
@end

@interface RecommendExtraModel : NSObject
@property (nonatomic, assign) NSInteger ra_switch;

@end

@interface RecommendDataDiscountModel : NSObject


@end

@interface RecommendDataRecommend_cityModel : NSObject
@property (nonatomic, strong) NSString * city_name;

@property (nonatomic, assign) NSInteger city_type;
//id -> ID
@property (nonatomic, assign) NSInteger ID;
@end

@interface RecommendDataTabModel : NSObject
@property (nonatomic, strong) NSString * icon_type;

@property (nonatomic, strong) NSString * icon_url;

@property (nonatomic, strong) NSString * name;
@end
