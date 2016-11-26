//
//  ShoppingModel.m
//  Qyer
//
//  Created by tarena15 on 2016/11/19.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "ShoppingModel.h"

@implementation ShoppingModel

@end

@implementation ShoppingDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"icon_list":@"ShoppingIconListModel",
             @"discount_topic":@"ShoppingDiscountTopicModel",
             @"market_topic":@"ShoppingMarketTopicModel",
             @"hot_area":@"ShoppingHotAreaModel",
             @"hot_goods":@"ShoppingHotGoodsModel"};
}
@end

@implementation ShoppingDiscountTopicModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"ShoppingDisCountTopicListModel"};
}

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"topic0":@"0",@"topic1":@"1"};
}
@end

@implementation ShoppingHotAreaModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"ShoppingListModel",
             @"place":@"ShoppingPlaceModel"};
}
@end

@implementation ShoppingHotGoodsModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
@end

@implementation ShoppingIconListModel

@end

@implementation ShoppingMarketTopicModel

@end

@implementation Shopping0Model


@end

@implementation Shopping1Model

@end

@implementation Shopping2Model

@end


@implementation ShoppingListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}

@end

@implementation ShoppingPlaceModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
@end


@implementation ShoppingDisCountTopic0Model
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"ShoppingDisCountTopicListModel"};
}
@end

@implementation ShoppingDisCountTopic1Model
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"ShoppingDisCountTopicListModel"};
}
@end

@implementation ShoppingDisCountTopicListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"ID":@"id"};
}
@end

@implementation ShoppingDisCountTopicTopicModel


@end
