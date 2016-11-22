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
    return @{@"iconList":@"icon_list"};
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
