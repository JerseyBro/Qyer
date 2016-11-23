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
                    @"market_topic":@"ShoppingMarketTopicModel",
             @"hot_area":@"ShoppingHotAreaModel"};
}
@end

@implementation ShoppingDiscountTopicModel

@end

@implementation ShoppingHotAreaModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"list":@"ShoppingListModel",
             @"place":@"ShoppingPlaceModel"};
}
@end

@implementation ShoppingHotGoodsModel

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
