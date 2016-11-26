//
//  RecommendModel.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : @"RecommendDataModel",
             @"extra" : @"RecommendExtraModel"};
}
@end

@implementation RecommendDataModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"discount" : @"RecommendDataDiscountModel",
             @"recommend_city" : @"RecommendDataRecommend_cityModel",
             @"tab" : @"RecommendDataTabModel"};
}

@end

@implementation RecommendExtraModel


@end

@implementation RecommendDataDiscountModel

@end

@implementation RecommendDataRecommend_cityModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" :@"id"};
}

@end

@implementation RecommendDataTabModel

@end
