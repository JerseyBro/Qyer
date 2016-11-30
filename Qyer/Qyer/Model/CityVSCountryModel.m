//
//  BournCityVC.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "CityVSCountryModel.h"

@implementation CityVSCountryModel

//+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
//{
//    return @{@"CiCodataModel":@"data",@"extra":@"CiCoextraModel"};
//}

@end

@implementation CiCodataModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"iconList":@"icon_list",
             @"cityPic":@"city_pic",
             @"guideNum":@"guide_num"};
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"iconList":@"CiCoiconListModel"};
}

@end

@implementation CiCoiconListModel



@end
@implementation CiCoweatherModel



@end
@implementation CiConot_missModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"events":@"CiCoeventsModel",
             @"pois":@"CiCopoisModel"};
}

@end

@implementation CiCoeventsModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"idField":@"id"};
}

@end

@implementation CiCopoisModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"idField":@"id"};
}

@end
